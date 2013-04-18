//
//  annotation1.h
//  testCallout
//
//  Created by SUBRAHMANYAM NUKALA on 04/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface annotation1 : NSObject<MKAnnotation>
@property CLLocationCoordinate2D coordinate;
@property (strong , nonatomic) NSString *title;
@property (strong , nonatomic) NSString *subtitle;

@end
