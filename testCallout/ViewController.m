//
//  ViewController.m
//  testCallout
//
//  Created by SUBRAHMANYAM NUKALA on 04/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "ViewController.h"
#import "annotation1.h"
#import "SFAnnotation.h"
#import "CustomMapItem.h"
#import "CustomAnnotationView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView;
+ (CGFloat)annotationPadding;
{
    return 10.0f;
}

+ (CGFloat)calloutHeight;
{
    return 5.0f;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 37.786996;
    newRegion.center.longitude = -122.440100;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
//    annotation1 *ann = [[annotation1 alloc]init];
//    ann.coordinate = newRegion.center;
//    ann.title = @"t";
//    ann.subtitle = @"s";
    mapView.delegate = self;
   // [self.mapView addAnnotation:ann];
    SFAnnotation *sfAnnotation = [[SFAnnotation alloc] init];
    //NSLog(@"%f",sfAnnotation.)
    [self.mapView addAnnotation:sfAnnotation];
    CustomMapItem *item = [[CustomMapItem alloc]init];
    item.latitude = [NSNumber numberWithDouble:44.236804];
    item.longitude = [NSNumber numberWithDouble:-81.452637];
    item.place = @"tea garden";
    item.imageName = @"pop.png";
    [self.mapView addAnnotation:item];
    [self.mapView setRegion:newRegion animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    NSLog(@"entered");

    if ([annotation isKindOfClass:[SFAnnotation class]])   // for City of San Francisco
    {
        static NSString *SFAnnotationIdentifier = @"SFAnnotationIdentifier";
        
        MKAnnotationView *flagAnnotationView =
        [self.mapView dequeueReusableAnnotationViewWithIdentifier:SFAnnotationIdentifier];
        if (flagAnnotationView == nil)
        {
            MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                            reuseIdentifier:SFAnnotationIdentifier];
            annotationView.canShowCallout = YES;
            
            UIImage *flagImage = [UIImage imageNamed:@"himym.jpg"];
            
            // size the flag down to the appropriate size
            CGRect resizeRect;
            resizeRect.size = flagImage.size;
            NSLog(@"%f",resizeRect.size.width);
                       CGSize maxSize = CGRectInset(self.view.bounds,
                                                     [ViewController annotationPadding],
                                                     [ViewController annotationPadding]).size;
            resizeRect.size.height = 40.5f;
            resizeRect.size.width = 20.0f;
                        maxSize.height -= self.navigationController.navigationBar.frame.size.height + [ViewController calloutHeight];
                    if (resizeRect.size.width > maxSize.width)
                           resizeRect.size = CGSizeMake(maxSize.width, resizeRect.size.height / resizeRect.size.width * maxSize.width);
                       // NSLog(@"2nd time %f",flagImage.size);
                        if (resizeRect.size.height > maxSize.height)
                            resizeRect.size = CGSizeMake(resizeRect.size.width / resizeRect.size.height * maxSize.height, maxSize.height);
                      //  NSLog(@"3rd time %f",flagImage.size);

            resizeRect.origin = CGPointMake(0.0, 0.0);
            UIGraphicsBeginImageContext(resizeRect.size);
            [flagImage drawInRect:resizeRect];
            UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            annotationView.image = resizedImage;
            annotationView.opaque = NO;
            
            UIImageView *sfIconView = [[UIImageView alloc] initWithImage:resizedImage];
            annotationView.leftCalloutAccessoryView = sfIconView;
            
            // offset the flag annotation so that the flag pole rests on the map coordinate
           // annotationView.centerOffset = CGPointMake( annotationView.centerOffset.x + annotationView.image.size.width/2, annotationView.centerOffset.y - annotationView.image.size.height/2 );
            
            return annotationView;
        }
        else
        {
            flagAnnotationView.annotation = annotation;
        }
        return flagAnnotationView;
    }
    else if ([annotation isKindOfClass:[CustomMapItem class]])  // for Japanese Tea Garden
    {
        NSLog(@"entrerd");
        static NSString *TeaGardenAnnotationIdentifier = @"TeaGardenAnnotationIdentifier";
        
        CustomAnnotationView *annotationView =
        (CustomAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:TeaGardenAnnotationIdentifier];
        if (annotationView == nil)
        {
            annotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:TeaGardenAnnotationIdentifier];
        }

        
        return annotationView;
    }


}

@end
