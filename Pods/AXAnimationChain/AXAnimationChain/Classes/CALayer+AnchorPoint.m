//
//  CALayer+AnchorPoint.m
//  AXAnimationChain
//
//  Created by devedbox on 2017/2/10.
//  Copyright © 2017年 devedbox. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "CALayer+AnchorPoint.h"

@implementation CALayer (AnchorPoint)
- (void)moveAnchorToPoint:(CGPoint)point {
    // If the new point is equal to the old anchor point, return immediately。
    if (CGPointEqualToPoint(point, self.anchorPoint)) return;
    
    CGPoint newPoint = CGPointMake(self.bounds.size.width * point.x, self.bounds.size.height * point.y);
    CGPoint oldPoint = CGPointMake(self.bounds.size.width * self.anchorPoint.x, self.bounds.size.height * self.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, self.affineTransform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, self.affineTransform);
    
    CGPoint position = self.position;
    
    position.x += newPoint.x - oldPoint.x;
    position.y += newPoint.y - oldPoint.y;
    
    self.position = position;
    self.anchorPoint = point;
}

- (void)anchorToDefault {
    [self anchorToCenter];
}

- (void)anchorToCenter {
    [self moveAnchorToPoint:CGPointMake(.5, .5)];
}

- (void)anchorToTop {
    [self moveAnchorToPoint:CGPointMake(.5, .0)];
}

- (void)anchorToLeft {
    [self moveAnchorToPoint:CGPointMake(.0, .5)];
}

- (void)anchorToBottom {
    [self moveAnchorToPoint:CGPointMake(.5, 1.0)];
}

- (void)anchorToRight {
    [self moveAnchorToPoint:CGPointMake(1.0, .5)];
}

- (void)anchorToLeftTop {
    [self moveAnchorToPoint:CGPointMake(.0, .0)];
}

- (void)anchorToLeftBottom {
    [self moveAnchorToPoint:CGPointMake(.0, 1.0)];
}

- (void)anchorToRightTop {
    [self moveAnchorToPoint:CGPointMake(1.0, .0)];
}

- (void)anchorToRightBottom {
    [self moveAnchorToPoint:CGPointMake(1.0, 1.0)];
}
@end
