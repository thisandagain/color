//
//  UIColor+HSB.m
//  color
//
//  Created by Andrew Sliwinski on 9/16/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "UIColor+HSB.h"

@implementation UIColor (HSB)

#pragma mark - Public

/**
 * Returns a UIColor that is offset from the current UIColor instance.
 *
 * @param {CGFloat} Hue offset (-1.0 to 1.0)
 * @param {CGFloat} Saturation offset (-1.0 to 1.0)
 * @param {CGFloat} Brightness offset (-1.0 to 1.0)
 * @param {CGFloat} Alpha offset (-1.0 to 1.0)
 *
 * @return {UIColor}
 */
- (UIColor *)offsetWithHue:(CGFloat)h saturation:(CGFloat)s brightness:(CGFloat)b alpha:(CGFloat)a
{
    // Current values
    CGFloat hue,saturation,brightness,alpha;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    
    // Calculate offsets
    h = fmodf(hue + h, 1.0f);
    s = [self clamp:(saturation + s)];
    b = [self clamp:(brightness + b)];
    a = [self clamp:(alpha + a)];
    
    return [UIColor colorWithHue:h saturation:s brightness:b alpha:a];
}

#pragma mark - Private

/**
 * Ternary clamp (0.0f to 1.0f)
 *
 * @param {CGFloat} Input
 *
 * @return {CGFloat}
 */
- (CGFloat)clamp:(CGFloat)a
{
    static const CGFloat min = 0.0f;
    static const CGFloat max = 1.0f;
    
    return (a > max) ? max : ((a < min) ? min : a);
}

@end
