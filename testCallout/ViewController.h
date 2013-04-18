//
//  ViewController.h
//  testCallout
//
//  Created by SUBRAHMANYAM NUKALA on 04/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
