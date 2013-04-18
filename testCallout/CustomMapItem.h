//
//  CustomMapItem.h
//  testCallout
//
//  Created by SUBRAHMANYAM NUKALA on 04/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface CustomMapItem : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, strong) NSString *place;
@property (nonatomic, strong) NSString *imageName;

@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@end