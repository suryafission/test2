//
//  MyDocument.h
//  ShapeThing
//
//  Created by Matt Gemmell on Sun Dec 30 2001.
//  Copyright (c) 2001 Scotland Software. All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import "ShapeView.h"

@interface MyDocument : NSDocument
{
    IBOutlet id shapeView;
}
@end
