//
//  annotation1.h
//  coreLocation
//
//  Created by SUBRAHMANYAM NUKALA on 03/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface annotation1 : NSObject<MKAnnotation>
@property CLLocationCoordinate2D coordinate;
@property NSString * title;
@property NSString *subtitle;

@end
