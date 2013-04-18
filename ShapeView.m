#import "ShapeView.h"

@implementation ShapeView

- (void)mouseDown:(NSEvent *)event
{
    NSPoint p = [event locationInWindow];
    downPoint = [self convertPoint:p fromView:nil];
    currentPoint = downPoint;
    [self setNeedsDisplay:YES];
}

- (void)mouseDragged:(NSEvent *)event
{
    NSPoint p = [event locationInWindow];
    currentPoint = [self convertPoint:p fromView:nil];
    [[self superview] autoscroll:event];
    [self setNeedsDisplay:YES];
}

- (void)mouseUp:(NSEvent *)event
{
    NSPoint p = [event locationInWindow];
    currentPoint = [self convertPoint:p fromView:nil];
    
    if ([[NSApp currentEvent] modifierFlags] & NSShiftKeyMask) {
        [paths addObject:[NSBezierPath bezierPathWithOvalInRect:[self constrainedCurrentRect]]];
    }
    else {
        [paths addObject:[NSBezierPath bezierPathWithOvalInRect:[self currentRect]]];
    }
    [[paths objectAtIndex:[paths count] - 1] setLineWidth:3];
    [colours addObject:penColour];
    
    [self setNeedsDisplay:YES];
}

- (NSRect)currentRect
{
    float minX = MIN(downPoint.x, currentPoint.x);
    float maxX = MAX(downPoint.x, currentPoint.x);
    float minY = MIN(downPoint.y, currentPoint.y);
    float maxY = MAX(downPoint.y, currentPoint.y);
    
    return NSMakeRect(minX, minY, maxX-minX, maxY-minY);
}

- (NSRect)constrainedCurrentRect
{
    // For use when the Shift key is held down during mouseDragged or mouseUp
    float minX = MIN(downPoint.x, currentPoint.x);
    float maxX = MAX(downPoint.x, currentPoint.x);
    float minY = MIN(downPoint.y, currentPoint.y);
    float maxY = MAX(downPoint.y, currentPoint.y);
    float squareSide = MIN(maxX-minX, maxY-minY); // length of side of square (constrained rect)
    float originX;
    float originY;
    
    if (downPoint.x <= currentPoint.x) {
        if (downPoint.y <= currentPoint.y) {
            // 2nd Quadrant
            originX = downPoint.x;
            originY = downPoint.y;
        }
        else {
            // 1st Quadrant
            originX = downPoint.x;
            originY = downPoint.y - squareSide;
        }
    }
    else {
        if (downPoint.y <= currentPoint.y) {
            // 3rd Quadrant
            originX = downPoint.x - squareSide;
            originY = downPoint.y;
        }
        else {
            // 4th Quadrant
            originX = downPoint.x - squareSide;
            originY = downPoint.y - squareSide;
        }
    }
    
    return NSMakeRect(originX, originY, squareSide, squareSide);
}

- (void)strokeAllPaths
{
    NSEnumerator *coloursEnumerator = [colours objectEnumerator];
    NSEnumerator *pathsEnumerator = [paths objectEnumerator];
    id currentColour, currentPath;
    
    if (paths && [paths count] > 0) {
        while ((currentColour = [coloursEnumerator nextObject])) {
            [currentColour set];
            currentPath = [pathsEnumerator nextObject];
            [currentPath fill];
            [[NSColor blackColor] set];
            [currentPath stroke];
        }
    }
}

- (id)initWithFrame:(NSRect)rect
{
    if (self = [super initWithFrame:rect]) {
        if (!paths) {
            paths = [[NSMutableArray alloc] init];
        }
        if (!colours) {
            colours = [[NSMutableArray alloc] init];
        }
        penColour = [NSColor blueColor];
    }
    return self;
}

- (void)drawRect:(NSRect)rect
{
    NSBezierPath *tempPath;
    
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:[self bounds]];
    [[NSColor blackColor] set];
    [self strokeAllPaths];
    if ([[NSApp currentEvent] type] == NSLeftMouseDragged) {
        if ([[NSApp currentEvent] modifierFlags] & NSShiftKeyMask) {
            tempPath = [NSBezierPath bezierPathWithOvalInRect:[self constrainedCurrentRect]];
        }
        else {
            tempPath = [NSBezierPath bezierPathWithOvalInRect:[self currentRect]];
        }
        [tempPath setLineWidth:3];
        [[penColour colorWithAlphaComponent:0.7] set];
        [tempPath fill];
        [[[NSColor blackColor] colorWithAlphaComponent:0.8] set];
        [tempPath stroke];
    }
}

- (IBAction)setPenColour:(id)sender
{
    penColour = [sender color];
}

- (void)dealloc
{
    [paths release];
    [colours release];
    [super dealloc];
}

@end
