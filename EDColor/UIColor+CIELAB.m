//
//  UIColor+CIELAB.m
//  color
//
//  Created by Matthew Smith on 2/11/13.
//  Copyright (c) 2013 Matthew Smith. All rights reserved.
//

#import "UIColor+CIELAB.h"

// Observer 2°, D65 Illuminant
#define REFX_O2_D65 95.047
#define REFY_O2_D65 100.0
#define REFZ_O2_D65 108.883

// Coordinate bounds for device and whitepoint
#define REFMIN_L 0.0
#define REFMAX_L 100.0
#define REFMIN_A_02_D65 -86.184593
#define REFMAX_A_02_D65 98.254173
#define REFMIN_B_02_D65 -107.863632
#define REFMAX_B_02_D65 94.482437

/**
 *   LAB is a non-linear colorspace which takes into account perceptual characteristics of the
 *   human eye/brain.  The 'L' correlate to the _perceived_ lightness, while A and B represent
 *   color-opponents. (More info at: http://en.wikipedia.org/wiki/Lab_color_space)
 *
 *   On current iOS devices with our default whitepoint,
 *   Coordinate ranges are:
 *    L    0 to 100
 *    A   -86.184593 to 98.254173
 *    B   -107.863632 to 94.482437
 *
 *   RGB->XYZ->CieLAB, and CieLAB->XYZ->RGB formulas from:
 *      http://www.easyrgb.com/index.php?X=MATH
 */
@implementation UIColor (CIELAB)

#pragma mark - Public
+ (UIColor *)colorWithLightness:(CGFloat)lightness A:(CGFloat)A B:(CGFloat)B alpha:(CGFloat)alpha
{
    CGFloat x,y,z;
    [UIColor labToXyzL:lightness A:A B:B X:&x Y:&y Z:&z];

    CGFloat r,g,b;
    [UIColor xyzToRgbx:x y:y z:z r:&r g:&g b:&b];
    
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
}

- (void)getLightness:(CGFloat *)lightnessOut A:(CGFloat *)aOut B:(CGFloat *)bOut alpha:(CGFloat *)alphaOut
{
    CGFloat R,G,B,alphaIn;
    [self getRed:&R green:&G blue:&B alpha:&alphaIn];
    
    CGFloat x,y,z;
    [UIColor rgbToXYZr:R g:G b:B x:&x y:&y z:&z];
    [UIColor xyzToLabx:x y:y z:z l:lightnessOut a:aOut b:bOut];

    // L range is 0 to 100.   a and b range ??? 'independent of colorspace' according to wikipedia.  Looks like 500 for A, 200 for B in these formulas (converting from XYZ)
    
    *alphaOut = alphaIn;
}

- (UIColor *)offsetWithLightness:(CGFloat)lightnessOffset a:(CGFloat)aOffset b:(CGFloat)bOffset alpha:(CGFloat)alphaOffset
{
    CGFloat l,a,b,alpha;
    [self getLightness:&l A:&a B:&b alpha:&alpha];
    
    l += lightnessOffset;
    a += aOffset;
    b += bOffset;
    alpha += alphaOffset;
    
    return [UIColor colorWithLightness:l A:a B:b alpha:alpha];
}

#pragma mark - Public intermediate XYZ colorspace methods (mostly for tests)
- (void)getX:(CGFloat *)xOut Y:(CGFloat *)yOut Z:(CGFloat *)zOut alpha:(CGFloat *)alphaOut
{
    CGFloat r,g,b,alpha;
    [self getRed:&r green:&g blue:&b alpha:&alpha];
    
    CGFloat x,y,z;
    [UIColor rgbToXYZr:r g:g b:b x:&x y:&y z:&z];
    
    *xOut = x;
    *yOut = y;
    *zOut = z;
    *alphaOut = alpha;
}

#pragma mark - Private: RGB->XYZ->LAB

+ (void) rgbToXYZr:(CGFloat)r g:(CGFloat)g b:(CGFloat)b x:(CGFloat *)outX y:(CGFloat *)outY z:(CGFloat *)outZ
{
    if(r > 0.04045) { r = pow(((r + 0.055) / 1.055),2.4); }
    else { r = r / 12.92; }
    if(g > 0.04045) { g = pow(((g + 0.055) / 1.055),2.4); }
    else { g = g / 12.92; }
    if(b > 0.04045) { b = pow(((b + 0.055) / 1.055),2.4); }
    else { b = b / 12.92; }
    
    r *= 100.0;
    g *= 100.0;
    b *= 100.0;
    
    *outX = (r * 0.4124) + (g * 0.3576) + (b * 0.1805);
    *outY = (r * 0.2126) + (g * 0.7152) + (b * 0.0722);
    *outZ = (r * 0.0193) + (g * 0.1192) + (b * 0.9505);
}

+ (void) xyzToLabx:(CGFloat)x y:(CGFloat)y z:(CGFloat)z l:(CGFloat *)outL a:(CGFloat *)outA b:(CGFloat *)outB
{
    x /= REFX_O2_D65;
    y /= REFY_O2_D65;
    z /= REFZ_O2_D65;
    
    if(x > 0.008856) { x = pow(x, 1.0/3.0);} else {x = (7.787 * x) +(16.0/116.0);}
    if(y > 0.008856) { y = pow(y, 1.0/3.0);} else {y = (7.787 * y) +(16.0/116.0);}
    if(z > 0.008856) { z = pow(z, 1.0/3.0);} else {z = (7.787 * z) +(16.0/116.0);}
    
    *outL = (116.0 * y) - 16.0;
    *outA = 500.0 * (x - y);
    *outB = 200.0 * (y - z);
}

#pragma mark - Private: LAB->XYZ->RGB

+ (void)labToXyzL:(CGFloat)L A:(CGFloat)A B:(CGFloat)B X:(CGFloat *)outX Y:(CGFloat *)outY Z:(CGFloat *)outZ
{
    CGFloat x,y,z;
    y = (L + 16.0) / 116.0;
    x = A / 500.0 + y;
    z = y - B / 200.0;
    
    if(pow(y, 3.0) > 0.008856) { y = pow(y, 3.0); } else { y = (y - 16.0/116.0) / 7.787; }
    if(pow(x, 3.0) > 0.008856) { x = pow(x, 3.0); } else { x = (x - 16.0/116.0) / 7.787; }
    if(pow(z, 3.0) > 0.008856) { z = pow(z, 3.0); } else { z = (z - 16.0/116.0) / 7.787; }
    
    *outX = REFX_O2_D65 * x;
    *outY = REFY_O2_D65 * y;
    *outZ = REFZ_O2_D65 * z;
}

+ (void) xyzToRgbx:(CGFloat)x y:(CGFloat)y z:(CGFloat)z r:(CGFloat *)outR g:(CGFloat *)outG b:(CGFloat *)outB
{
    x /= 100.0;
    y /= 100.0;
    z /= 100.0;
    
    CGFloat r,g,b;
    
    r = x * 3.2406 + y * -1.5372 + z * -0.4986;
    g = x * -0.9689 + y * 1.8758 + z * 0.0415;
    b = x * 0.0557 + y * -0.2040 + z * 1.0570;
    
    if(r > 0.0031308) { r = 1.055 * pow(r, (1 / 2.4)) - 0.055; } else { r = 12.92 * r; }
    if(g > 0.0031308) { g = 1.055 * pow(g, (1 / 2.4)) - 0.055; } else { g = 12.92 * g; }
    if(b > 0.0031308) { b = 1.055 * pow(b, (1 / 2.4)) - 0.055; } else { b = 12.92 * b; }
    
    *outR = r * 255.0;
    *outG = g * 255.0;
    *outB = b * 255.0;
}

@end
