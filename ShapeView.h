/* ShapeView */

#import <Cocoa/Cocoa.h>

@interface ShapeView : NSView
{
    NSMutableArray *paths;
    NSMutableArray *colours;
    NSPoint downPoint;
    NSPoint currentPoint;
    IBOutlet id colourWell;
    NSColor *penColour;
}
- (NSRect)currentRect;
- (NSRect)constrainedCurrentRect;
- (void)strokeAllPaths;
- (IBAction)setPenColour:(id)sender;
@end
