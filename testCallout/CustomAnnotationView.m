//
//  CustomAnnotationView.m
//  testCallout
//
//  Created by SUBRAHMANYAM NUKALA on 04/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "CustomAnnotationView.h"

//@implementation CustomAnnotationView
//
//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}
//
///*
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//}
//*/
#import "CustomMapItem.h"

static CGFloat kMaxViewWidth = 150.0;

static CGFloat kViewWidth = 90;
static CGFloat kViewLength = 100;

static CGFloat kLeftMargin = 15.0;
static CGFloat kRightMargin = 5.0;
static CGFloat kTopMargin = 5.0;
static CGFloat kBottomMargin = 10.0;
static CGFloat kRoundBoxLeft = 10.0;

@interface CustomAnnotationView ()
@property (nonatomic, strong) UILabel *annotationLabel;
@property (nonatomic, strong) UIImageView *annotationImage;
@property (nonatomic ,strong) UIButton *btn;
@end

@implementation CustomAnnotationView

// determine the MKAnnotationView based on the annotation info and reuseIdentifier
//
- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self != nil)
    {
        self.backgroundColor = [UIColor clearColor];
        
        // offset the annotation so it won't obscure the actual lat/long location
        self.centerOffset = CGPointMake(50.0, 50.0);
        
        // add the annotation's label
        _annotationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        CustomMapItem *mapItem = (CustomMapItem *)self.annotation;
        self.annotationLabel.font = [UIFont systemFontOfSize:9.0];
        self.annotationLabel.textColor = [UIColor whiteColor];
        self.annotationLabel.text = mapItem.place;
        [self.annotationLabel sizeToFit];   // get the right vertical size
        
        // compute the optimum width of our annotation, based on the size of our annotation label
        CGFloat optimumWidth = self.annotationLabel.frame.size.width + kRightMargin + kLeftMargin;
        CGRect frame = self.frame;
        if (optimumWidth < kViewWidth)
            frame.size = CGSizeMake(kViewWidth, kViewLength);
        else if (optimumWidth > kMaxViewWidth)
            frame.size = CGSizeMake(kMaxViewWidth, kViewLength);
        else
            frame.size = CGSizeMake(optimumWidth, kViewLength);
        self.frame = frame;
        
        self.annotationLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.annotationLabel.backgroundColor = [UIColor clearColor];
        CGRect newFrame = self.annotationLabel.frame;
        newFrame.origin.x = kLeftMargin;
        newFrame.origin.y = kTopMargin;
        newFrame.size.width = self.frame.size.width - kRightMargin - kLeftMargin;
        self.annotationLabel.frame = newFrame;
        //[self addSubview:self.annotationLabel];
        
        // add the annotation's image
        // the annotation image snaps to the width and height of this view
        _annotationImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:mapItem.imageName]];
        self.annotationImage.contentMode = UIViewContentModeScaleAspectFit;
        self.annotationImage.frame =
        CGRectMake(kLeftMargin,
                   self.annotationLabel.frame.origin.y + self.annotationLabel.frame.size.height + kTopMargin,
                   self.frame.size.width - kRightMargin - kLeftMargin,
                   self.frame.size.height - self.annotationLabel.frame.size.height - kTopMargin*2 - kBottomMargin);
        [self addSubview:self.annotationImage];
        _btn = [[UIButton alloc]init];
        _btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        self.btn.frame = CGRectMake(20.0, 50.0, 10.0, 10.0);
        self.btn.backgroundColor = [UIColor clearColor];
        [self addSubview:self.btn];
        
        
    }
    
    return self;
}

- (void)setAnnotation:(id <MKAnnotation>)annotation
{
    [super setAnnotation:annotation];
    
    // this annotation view has custom drawing code.  So when we reuse an annotation view
    // (through MapView's delegate "dequeueReusableAnnoationViewWithIdentifier" which returns non-nil)
    // we need to have it redraw the new annotation data.
    //
    // for any other custom annotation view which has just contains a simple image, this won't be needed
    //
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CustomMapItem *mapItem = (CustomMapItem *)self.annotation;
    if (mapItem != nil)
    {
        [[UIColor darkGrayColor] setFill];
        
        // draw the pointed shape
        UIBezierPath *pointShape = [UIBezierPath bezierPath];
        [pointShape moveToPoint:CGPointMake(14.0, 0.0)];
        [pointShape addLineToPoint:CGPointMake(0.0, 0.0)];
        [pointShape addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
        [pointShape fill];
        
        // draw the rounded box
        UIBezierPath *roundedRect =
        [UIBezierPath bezierPathWithRoundedRect:
         CGRectMake(10.0, 0.0, self.frame.size.width - kRoundBoxLeft, self.frame.size.height) cornerRadius:3.0];
        roundedRect.lineWidth = 2.0;
        [roundedRect fill];
    }
}


@end
