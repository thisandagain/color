//
//  UIColor+HSL.m
//  color
//
//  Created by Andrew Sliwinski on 9/16/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "UIColor+HSL.h"

@implementation UIColor (HSL)

#pragma mark - Public

+ (UIColor *)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha
{
    CGFloat r,g,b;
    HSL_TO_RGB(hue, saturation, lightness, &r, &g, &b);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation lightness:(CGFloat *)lightness alpha:(CGFloat *)alpha
{
    CGFloat r,g,b;
    [self getRed:&r green:&g blue:&b alpha:alpha];
    RGB_TO_HSL(r, g, b, hue, saturation, lightness);
    
    return true;
}

- (UIColor *)offsetWithHue:(CGFloat)hue saturation:(CGFloat)saturation lightness:(CGFloat)lightness alpha:(CGFloat)alpha
{
    // Current values
    CGFloat h,s,l,a;
    [self getHue:&h saturation:&s lightness:&l alpha:&a];
    
    // Calculate offsets
    hue         = fmodf(hue + h, 1.0f);
    saturation  = [self clamp:(saturation + s)];
    lightness   = [self clamp:(lightness + l)];
    alpha       = [self clamp:(alpha + a)];
    
    return [UIColor colorWithHue:hue saturation:saturation lightness:lightness alpha:alpha];
}

- (UIColor *)saturate:(CGFloat)amount
{
    return [self offsetWithHue:0.0f saturation:amount lightness:0.0f alpha:0.0f];
}

- (UIColor *)desaturate:(CGFloat)amount
{
    return [self offsetWithHue:0.0f saturation:-amount lightness:0.0f alpha:0.0f];
}

- (UIColor *)lighten:(CGFloat)amount
{
    return [self offsetWithHue:0.0f saturation:0.0f lightness:amount alpha:0.0f];
}

- (UIColor *)darken:(CGFloat)amount
{
    return [self offsetWithHue:0.0f saturation:0.0f lightness:-amount alpha:0.0f];
}

- (UIColor *)spin:(CGFloat)angle
{
    angle /= 360;
    return [self offsetWithHue:angle saturation:0.0f lightness:0.0f alpha:0.0f];
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

/**
 * HSL to RGB converter.
 * Adapted from: https://github.com/alessani/ColorConverter
 */
static void HSL_TO_RGB (CGFloat h, CGFloat s, CGFloat l, CGFloat *outR, CGFloat *outG, CGFloat *outB)
{
	CGFloat			temp1,
    temp2;
	CGFloat			temp[3];
	int				i;
	
	// Check for saturation. If there isn't any just return the luminance value for each, which results in gray.
	if(s == 0.0) {
		if(outR)
			*outR = l;
		if(outG)
			*outG = l;
		if(outB)
			*outB = l;
		return;
	}
	
	// Test for luminance and compute temporary values based on luminance and saturation
	if(l < 0.5)
		temp2 = l * (1.0 + s);
	else
		temp2 = l + s - l * s;
    temp1 = 2.0 * l - temp2;
	
	// Compute intermediate values based on hue
	temp[0] = h + 1.0 / 3.0;
	temp[1] = h;
	temp[2] = h - 1.0 / 3.0;
    
	for(i = 0; i < 3; ++i) {
		
		// Adjust the range
		if(temp[i] < 0.0)
			temp[i] += 1.0;
		if(temp[i] > 1.0)
			temp[i] -= 1.0;
		
		
		if(6.0 * temp[i] < 1.0)
			temp[i] = temp1 + (temp2 - temp1) * 6.0 * temp[i];
		else {
			if(2.0 * temp[i] < 1.0)
				temp[i] = temp2;
			else {
				if(3.0 * temp[i] < 2.0)
					temp[i] = temp1 + (temp2 - temp1) * ((2.0 / 3.0) - temp[i]) * 6.0;
				else
					temp[i] = temp1;
			}
		}
	}
	
	// Assign temporary values to R, G, B
	if(outR)
		*outR = temp[0];
	if(outG)
		*outG = temp[1];
	if(outB)
		*outB = temp[2];
}

/**
 * RGB to HSL converter.
 * Adapted from: https://github.com/alessani/ColorConverter
 */
static void RGB_TO_HSL (CGFloat r, CGFloat g, CGFloat b, CGFloat *outH, CGFloat *outS, CGFloat *outL)
{    
    CGFloat h,s,l,v,m,vm,r2,g2,b2;
    
    h = 0; s = 0;
    
    v = MAX(r, g);
    v = MAX(v, b);
    m = MIN(r, g);
    m = MIN(m, b);
    
    l = (m+v)/2.0f;
    
    if (l <= 0.0) {
        if(outH)
			*outH = h;
		if(outS)
			*outS = s;
		if(outL)
			*outL = l;
        return;
    }
    
    vm = v - m;
    s = vm;
    
    if (s > 0.0f) {
        s/= (l <= 0.5f) ? (v + m) : (2.0 - v - m);
    } else {
        if(outH)
			*outH = h;
		if(outS)
			*outS = s;
		if(outL)
			*outL = l;
        return;
    }
    
    r2 = (v - r)/vm;
    g2 = (v - g)/vm;
    b2 = (v - b)/vm;
    
    if (r == v){
        h = (g == m ? 5.0f + b2 : 1.0f - g2);
    }else if (g == v){
        h = (b == m ? 1.0f + r2 : 3.0 - b2);
    }else{
        h = (r == m ? 3.0f + g2 : 5.0f - r2);
    }
    
    h/=6.0f;
    
    if(outH)
        *outH = h;
    if(outS)
        *outS = s;
    if(outL)
        *outL = l;
}

@end
