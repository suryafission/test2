//
//  customAnnotation.h
//  coreLocation
//
//  Created by SUBRAHMANYAM NUKALA on 04/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface customAnnotation : MKAnnotationView
@property (nonatomic, strong) UILabel *annotationLabel;
@property (nonatomic, strong) UIImageView *annotationImage;


@end
