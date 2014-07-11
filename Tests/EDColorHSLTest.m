//
//  EDColorHSLTest.m
//  color
//
//  Created by Andrew Sliwinski on 9/16/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "EDColorHSLTest.h"
#import "UIColor+HSL.h"

@implementation EDColorHSLTest

#pragma mark - Class methods

- (void)testHslCreationRed
{
    UIColor *color = [UIColor colorWithHue:1.0f saturation:1.0f lightness:0.5f alpha:1.0f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testHslCreationWhite
{
    UIColor *color = [UIColor colorWithHue:0.0f saturation:1.0f lightness:1.0f alpha:1.0f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

#pragma mark - Instance methods

- (void)testHslGetterWhite
{
    UIColor *color = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
    
    SPLIT_RESULT_TO_HSLA
    
    STAssertEqualsWithAccuracy(hue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(saturation, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(lightness, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testHslGetterRed
{
    UIColor *color = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    
    SPLIT_RESULT_TO_HSLA
    
    STAssertEqualsWithAccuracy(hue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(saturation, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(lightness, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testHueOffsetRotate
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base offsetWithHue:0.5f saturation:0.0f lightness:0.0f alpha:0.0f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testHueOffsetRotateClamp
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base offsetWithHue:1.0f saturation:0.0f lightness:0.0f alpha:0.0f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testSaturationOffset
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base offsetWithHue:0.0f saturation:-1.0f lightness:0.0f alpha:0.0f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testLightnessOffset
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base offsetWithHue:0.0f saturation:0.0f lightness:1.0f alpha:0.0f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testAlphaOffset
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base offsetWithHue:0.0f saturation:0.0f lightness:0.0f alpha:-0.25f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 0.75f, TEST_ACCURACY, nil);
}

- (void)testSaturate
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base saturate:-1.0f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testDesaturate
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base desaturate:1.0f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testLighten
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base lighten:1.0f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testDarken
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base darken:1.0f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testSpin
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base spin:120.0f];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

@end
