//
//  CustomMapItem.m
//  testCallout
//
//  Created by SUBRAHMANYAM NUKALA on 04/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "CustomMapItem.h"

@implementation CustomMapItem
- (CLLocationCoordinate2D)coordinate
{
    coordinate.latitude = [self.latitude doubleValue];
    coordinate.longitude = [self.longitude doubleValue];
    return coordinate;
}

@end
