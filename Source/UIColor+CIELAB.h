//
//  UIColor+CIELAB.h
//  color
//
//  Created by Matthew Smith on 2/11/13.
//  Copyright (c) 2013 Matthew Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CIELAB)

+ (UIColor *)colorWithLightness:(CGFloat)lightness A:(CGFloat)A B:(CGFloat)B alpha:(CGFloat)alpha;
- (void)getLightness:(CGFloat *)lightness A:(CGFloat *)a B:(CGFloat *)b alpha:(CGFloat *)alpha;
- (UIColor *)offsetWithLightness:(CGFloat)lightness a:(CGFloat)a b:(CGFloat)b alpha:(CGFloat)alpha;

#pragma mark - Intermediate Colorspace XYZ
- (void)getX:(CGFloat *)xOut Y:(CGFloat *)yOut Z:(CGFloat *)zOut alpha:(CGFloat *)alphaOut;

@end
