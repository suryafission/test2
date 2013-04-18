//
//  SFAnnotation.m
//  testCallout
//
//  Created by SUBRAHMANYAM NUKALA on 04/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "SFAnnotation.h"

@implementation SFAnnotation

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = 37.786996;
    theCoordinate.longitude = -122.419281;
    return theCoordinate;
}

- (NSString *)title
{
    return @"San Francisco";
}

// optional
- (NSString *)subtitle
{
    return @"Founded: June 29, 1776";
}

@end
