//
//  AXCoreAnimation.h
//  AXAnimationChain
//
//  Created by devedbox on 2017/1/11.
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

#ifndef AXCoreAnimation_h
#define AXCoreAnimation_h

#import "AXDecayAnimation.h"
#import "AXSpringAnimation.h"
#import "CAAnimation+Convertable.h"
#import "CAAnimation+ImmediateValue.h"
#import "CAMediaTimingFunction+Extends.h"

#endif /* AXCoreAnimation_h */
/// Set the frame count of keyframe animation. Default is 69ps.
///
/// @param count count of frames of keyframe animation.
///
extern void CACVTSetFrameCountOfKeyframe(NSUInteger count);
