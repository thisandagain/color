//
//  EDColorHexTest.m
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "EDColorHexTest.h"
#import "UIColor+Hex.h"

@implementation EDColorHexTest

#pragma mark - UInt32

- (void)testBlackInt
{
    UIColor *color = [UIColor colorWithHex:0x000000];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testWhiteInt
{
    UIColor *color = [UIColor colorWithHex:0xFFFFFF];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testAlphaInt
{
    UIColor *color = [UIColor colorWithHex:0xFFFFFF andAlpha:0.8];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 0.8f, TEST_ACCURACY, nil);
}

#pragma mark - String

- (void)testPound
{
    UIColor *color = [UIColor colorWithHexString:@"#123456"];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, (0x12/255.0f), TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, (0x34/255.0f), TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, (0x56/255.0f), TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}


- (void)testStringLen2
{
    UIColor *color = [UIColor colorWithHexString:@"80"];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testRedString
{
    UIColor *color = [UIColor colorWithHexString:@"f00"];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testGreenString
{
    UIColor *color = [UIColor colorWithHexString:@"0F0"];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testBlueString
{
    UIColor *color = [UIColor colorWithHexString:@"0000ff"];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testAlphaString
{
    UIColor *color = [UIColor colorWithHexString:@"ffffffcc"];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 0.8f, TEST_ACCURACY, nil);
}

- (void)testNilString
{
    UIColor *color = [UIColor colorWithHexString:nil];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testNotString
{
    UIColor *color = [UIColor colorWithHexString:@5];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

#pragma mark - Getter

- (void)testHexValueRed
{
    UIColor *color = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    UInt32 hex = [color hexValue];
    
    STAssertEqualsWithAccuracy(hex, (UInt32) 0xff0000, TEST_ACCURACY, nil);
}

- (void)testHexValueGreen
{
    UIColor *color = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
    UInt32 hex = [color hexValue];
    
    STAssertEqualsWithAccuracy(hex, (UInt32) 0x00ff00, TEST_ACCURACY, nil);
}

- (void)testHexValueBlue
{
    UIColor *color = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];
    UInt32 hex = [color hexValue];
    
    STAssertEqualsWithAccuracy(hex, (UInt32) 0x0000ff, TEST_ACCURACY, nil);
}

- (void)testHexValueGray
{
    UIColor *color = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.0];
    UInt32 hex = [color hexValue];
    
    STAssertEqualsWithAccuracy(hex, (UInt32) 0x666666, TEST_ACCURACY, nil);
}

@end
