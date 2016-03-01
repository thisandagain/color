//
//  EDColoriOS7Test.m
//  color
//
//  Created by Daniel Doubrovkine on 4/23/14.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Macros.h"
#import "UIColor+iOS7.h"
#import "UIColor+Hex.h"

@interface EDColoriOS7Test : XCTestCase

@end

@implementation EDColoriOS7Test

- (void)testiOS7ColorsCount
{
    XCTAssertTrue([UIColor iOS7Colors].count == 11, @"Invalid number of colors: %@.", @([UIColor iOS7Colors].count));
}

- (void)testiOS7GradientPairs
{
    XCTAssertTrue([UIColor iOS7GradientPairs].count == 10, @"Invalid number of gradient pairs: %@.", @([UIColor iOS7GradientPairs].count));
}

- (void)testiOS7ColorsRed
{
    UIColor *redColor = (UIColor *)[[UIColor iOS7Colors] firstObject];
    XCTAssertTrue([redColor isEqual:[UIColor iOS7redColor]], @"First color is not red.");
    XCTAssertTrue([redColor isEqual:[UIColor colorWithHex:0xFF3B30]], @"Green color is not 0x4CD964");
}

- (void)testiOS7ColorsGreenGradientPair
{
    NSArray *greenGradientPair = [UIColor iOS7greenGradient];
    XCTAssertTrue(greenGradientPair.count == 2, @"Invalid number of colors in a gradient pair.");
    UIColor *fromColor = (id) [greenGradientPair firstObject];
    UIColor *toColor = (id) [greenGradientPair lastObject];
    XCTAssertTrue([fromColor isEqual:[UIColor iOS7greenGradientStartColor]], @"First color is incorrect.");
    XCTAssertTrue([fromColor isEqual:[UIColor colorWithHex:0x87FC70]], @"First color is incorrect.");
    XCTAssertTrue([toColor isEqual:[UIColor iOS7greenGradientEndColor]], @"Second color is incorrect.");
    XCTAssertTrue([toColor isEqual:[UIColor colorWithHex:0x0BD318]], @"Second color is incorrect.");
}

@end
