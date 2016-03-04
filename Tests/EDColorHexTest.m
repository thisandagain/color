//
//  EDColorHexTest.m
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Macros.h"
#import "UIColor+Hex.h"

@interface EDColorHexTest : XCTestCase

@end


@implementation EDColorHexTest

#pragma mark - UInt32

- (void)testBlackInt
{
    UIColor *color = [UIColor colorWithHex:0x000000];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testWhiteInt
{
    UIColor *color = [UIColor colorWithHex:0xFFFFFF];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testAlphaInt
{
    UIColor *color = [UIColor colorWithHex:0xFFFFFF andAlpha:0.8];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 0.8f, TEST_ACCURACY);
}

#pragma mark - String

- (void)testPound
{
    UIColor *color = [UIColor colorWithHexString:@"#123456"];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, (0x12/255.0f), TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, (0x34/255.0f), TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, (0x56/255.0f), TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}


- (void)testStringLen2
{
    UIColor *color = [UIColor colorWithHexString:@"80"];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 0.5f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.5f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.5f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testRedString
{
    UIColor *color = [UIColor colorWithHexString:@"f00"];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testGreenString
{
    UIColor *color = [UIColor colorWithHexString:@"0F0"];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testBlueString
{
    UIColor *color = [UIColor colorWithHexString:@"0000ff"];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testAlphaString
{
    UIColor *color = [UIColor colorWithHexString:@"ffffffcc"];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 0.8f, TEST_ACCURACY);
}

- (void)testNilString
{
    UIColor *color = [UIColor colorWithHexString:nil];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testNotString
{
    UIColor *color = [UIColor colorWithHexString:@5];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

#pragma mark - Getter

- (void)testHexValueRed
{
    UIColor *color = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    UInt32 hex = [color hexValue];
    
    XCTAssertEqualWithAccuracy(hex, (UInt32) 0xff0000, TEST_ACCURACY);
}

- (void)testHexValueGreen
{
    UIColor *color = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
    UInt32 hex = [color hexValue];
    
    XCTAssertEqualWithAccuracy(hex, (UInt32) 0x00ff00, TEST_ACCURACY);
}

- (void)testHexValueBlue
{
    UIColor *color = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];
    UInt32 hex = [color hexValue];
    
    XCTAssertEqualWithAccuracy(hex, (UInt32) 0x0000ff, TEST_ACCURACY);
}

- (void)testHexValueGray
{
    UIColor *color = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.0];
    UInt32 hex = [color hexValue];
    
    XCTAssertEqualWithAccuracy(hex, (UInt32) 0x666666, TEST_ACCURACY);
}

@end
