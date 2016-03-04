//
//  UIColor+HSL.h
//  color
//
//  Created by Andrew Sliwinski on 9/16/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HSL)

+ (UIColor *)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha;
- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation lightness:(CGFloat *)lightness alpha:(CGFloat *)alpha;
- (UIColor *)offsetWithHue:(CGFloat)h saturation:(CGFloat)s lightness:(CGFloat)l alpha:(CGFloat)alpha;
- (UIColor *)saturate:(CGFloat)amount;
- (UIColor *)desaturate:(CGFloat)amount;
- (UIColor *)lighten:(CGFloat)amount;
- (UIColor *)darken:(CGFloat)amount;
- (UIColor *)spin:(CGFloat)angle;

@end
