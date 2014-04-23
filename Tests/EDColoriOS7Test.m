//
//  EDColoriOS7Test.m
//  color
//
//  Created by Daniel Doubrovkine on 4/23/14.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "EDColoriOS7Test.h"
#import <EDColor/UIColor+iOS7.h>
#import <EDColor/UIColor+Hex.h>

@implementation EDColoriOS7Test

- (void)testiOS7ColorsCount
{
    STAssertTrue([UIColor iOS7Colors].count == 11, @"Invalid number of colors: %@.", @([UIColor iOS7Colors].count));
}

- (void)testiOS7GradientPairs
{
    STAssertTrue([UIColor iOS7GradientPairs].count == 10, @"Invalid number of gradient pairs: %@.", @([UIColor iOS7GradientPairs].count));
}

- (void)testiOS7ColorsRed
{
    UIColor *redColor = (UIColor *)[[UIColor iOS7Colors] firstObject];
    STAssertTrue([redColor isEqual:[UIColor iOS7redColor]], @"First color is not red.");
    STAssertTrue([redColor isEqual:[UIColor colorWithHex:0xFF3B30]], @"Green color is not 0x4CD964");
}

- (void)testiOS7ColorsGreenGradientPair
{
    NSArray *greenGradientPair = [UIColor iOS7greenGradient];
    STAssertTrue(greenGradientPair.count == 2, @"Invalid number of colors in a gradient pair.");
    UIColor *fromColor = (id) [greenGradientPair firstObject];
    UIColor *toColor = (id) [greenGradientPair lastObject];
    STAssertTrue([fromColor isEqual:[UIColor iOS7greenGradientStartColor]], @"First color is incorrect.");
    STAssertTrue([fromColor isEqual:[UIColor colorWithHex:0x87FC70]], @"First color is incorrect.");
    STAssertTrue([toColor isEqual:[UIColor iOS7greenGradientEndColor]], @"Second color is incorrect.");
    STAssertTrue([toColor isEqual:[UIColor colorWithHex:0x0BD318]], @"Second color is incorrect.");
}

@end
