//
//  UIColor+Hex.m
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

/**
 * Creates a new UIColor instance using a hex input and alpha value.
 *
 * @param {UInt32} Hex
 * @param {CGFloat} Alpha
 *
 * @return {UIColor}
 */
+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha
{
    int r = (hex >> 16) & 0xFF;
	int g = (hex >> 8) & 0xFF;
	int b = (hex) & 0xFF;
    
	return [UIColor colorWithRed:r / 255.0f
						   green:g / 255.0f
							blue:b / 255.0f
						   alpha:alpha];
}

/**
 * Creates a new UIColor instance using a hex input.
 *
 * @param {UInt32} Hex
 *
 * @return {UIColor}
 */
+ (UIColor *)colorWithHex:(UInt32)hex
{
    return [self colorWithHex:hex andAlpha:1.0];
}

/**
 * Creates a new UIColor instance using a hex string input.
 *
 * @param {NSString} Hex string (ie: @"#fff", @"ff0000", or @"ff00ffcc")
 *
 * @return {UIColor}
 */
+ (UIColor *)colorWithHexString:(id)hexString
{
    @try {
        // Nil or non-string
        if (hexString == nil) @throw [NSException exceptionWithName:@"Nil string" reason:@"Invalid hex string" userInfo:nil];
        if (![hexString isKindOfClass:[NSString class]]) @throw [NSException exceptionWithName:@"Not a string" reason:@"Invalid hex string" userInfo:nil];
        
        // Filter
        hexString = [hexString stringByReplacingOccurrencesOfString:@" " withString:@""];
        hexString = [hexString uppercaseString];
        if ([[NSString stringWithFormat:@"%c",[hexString characterAtIndex:0]] isEqualToString: @"#"]) {
            hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
        }
        
        // #ffffff
        if ([hexString length] == 6) {
            hexString = [NSString stringWithFormat:@"%@%@", hexString, @"FF"];
        }
        
        // #fff
        if ([hexString length] == 3) {
            hexString = [NSString stringWithFormat:@"%c%c%c%c%c%c%@",[hexString characterAtIndex:0], [hexString characterAtIndex:0], [hexString characterAtIndex:1], [hexString characterAtIndex:1], [hexString characterAtIndex:2], [hexString characterAtIndex:2], @"FF"];
        }
        
        // #ff
        if ([hexString length] == 2) {
            hexString = [NSString stringWithFormat:@"%c%c%c%c%c%c%@",[hexString characterAtIndex:0], [hexString characterAtIndex:1], [hexString characterAtIndex:0], [hexString characterAtIndex:1], [hexString characterAtIndex:0], [hexString characterAtIndex:1], @"FF"];
        }
        
        NSArray *hex = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",nil];
        float r = ([hex indexOfObject:[NSString stringWithFormat:@"%c",[hexString characterAtIndex:0]]]*16)+[hex indexOfObject:[NSString stringWithFormat:@"%c",[hexString characterAtIndex:1]]];
        float g = ([hex indexOfObject:[NSString stringWithFormat:@"%c",[hexString characterAtIndex:2]]]*16)+[hex indexOfObject:[NSString stringWithFormat:@"%c",[hexString characterAtIndex:3]]];
        float b = ([hex indexOfObject:[NSString stringWithFormat:@"%c",[hexString characterAtIndex:4]]]*16)+[hex indexOfObject:[NSString stringWithFormat:@"%c",[hexString characterAtIndex:5]]];
        float a = ([hex indexOfObject:[NSString stringWithFormat:@"%c",[hexString characterAtIndex:6]]]*16)+[hex indexOfObject:[NSString stringWithFormat:@"%c",[hexString characterAtIndex:7]]];
    
        return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a/255.0f];
    }
    @catch (NSException *exception) {
        return [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
    }
}

@end
