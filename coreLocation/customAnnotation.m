//
//  customAnnotation.m
//  coreLocation
//
//  Created by SUBRAHMANYAM NUKALA on 04/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "customAnnotation.h"
#import "CustomMapItem.h"

@implementation customAnnotation
@synthesize annotationImage,annotationLabel;

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}
- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self != nil)
    {
        self.backgroundColor = [UIColor clearColor];
        
        // offset the annotation so it won't obscure the actual lat/long location
        self.centerOffset = CGPointMake(50.0, 50.0);
        
        // add the annotation's label
        annotationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //CustomMapItem *mapItem = (CustomMapItem *)self.annotation;
        self.annotationLabel.font = [UIFont systemFontOfSize:9.0];
        self.annotationLabel.textColor = [UIColor whiteColor];
        self.annotationLabel.text = @"san francisco";
        [self.annotationLabel sizeToFit];
    }
        return  self;
}
- (void)drawRect:(CGRect)rect
{
//    CustomMapItem *mapItem = (CustomMapItem *)self.annotation;
//    if (mapItem != nil)
//    {
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
         CGRectMake(10.0, 0.0, self.frame.size.width - 10.0, self.frame.size.height) cornerRadius:3.0];
        roundedRect.lineWidth = 2.0;
        [roundedRect fill];
    }
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
