//
//  EDColorHSBTest.m
//  color
//
//  Created by Andrew Sliwinski on 9/16/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "EDColorHSBTest.h"
#import "UIColor+HSB.h"

@implementation EDColorHSBTest

- (void)testHueOffset
{
    UIColor *base = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color = [base offsetWithHue:-0.5f saturation:0.0f brightness:0.0f alpha:0.0f];
    
    SPLIT_RESULT_TO_HSBA
    
    STAssertEqualsWithAccuracy(hue, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(saturation, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(brightness, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testHueOffsetRotate
{
    UIColor *base = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color = [base offsetWithHue:1.0f saturation:0.0f brightness:0.0f alpha:0.0f];
    
    SPLIT_RESULT_TO_HSBA
    
    STAssertEqualsWithAccuracy(hue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(saturation, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(brightness, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testHueOffsetBack180
{
    UIColor *base = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color = [base offsetWithHue:-0.5f saturation:0.0f brightness:0.0f alpha:0.0f];
    
    SPLIT_RESULT_TO_HSBA
    
    STAssertEqualsWithAccuracy(hue, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(saturation, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(brightness, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testHueOffsetBack720
{
    UIColor *base = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color = [base offsetWithHue:-2.0f saturation:0.0f brightness:0.0f alpha:0.0f];
    
    SPLIT_RESULT_TO_HSBA
    
    STAssertEqualsWithAccuracy(hue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(saturation, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(brightness, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testSaturationOffset
{
    UIColor *base = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color = [base offsetWithHue:0.0f saturation:-0.5f brightness:0.0f alpha:0.0f];
    
    SPLIT_RESULT_TO_HSBA
    
    STAssertEqualsWithAccuracy(hue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(saturation, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(brightness, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testBrightnessOffset
{
    UIColor *base = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color = [base offsetWithHue:0.0f saturation:0.0f brightness:-0.5f alpha:0.0f];
    
    SPLIT_RESULT_TO_HSBA
    
    STAssertEqualsWithAccuracy(hue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(saturation, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(brightness, 0.5f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testBrightnessOffsetClamp
{
    UIColor *base = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color = [base offsetWithHue:0.0f saturation:0.0f brightness:1.0f alpha:0.0f];
    
    SPLIT_RESULT_TO_HSBA
    
    STAssertEqualsWithAccuracy(hue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(saturation, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(brightness, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testAlphaOffset
{
    UIColor *base = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color = [base offsetWithHue:0.0f saturation:0.0f brightness:0.0f alpha:-1.0f];
    
    SPLIT_RESULT_TO_HSBA
    
    STAssertEqualsWithAccuracy(hue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(saturation, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(brightness, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 0.0f, TEST_ACCURACY, nil);
}

- (void)testAlphaOffsetClamp
{
    UIColor *base = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color = [base offsetWithHue:0.0f saturation:0.0f brightness:0.0f alpha:-2.0f];
    
    SPLIT_RESULT_TO_HSBA
    
    STAssertEqualsWithAccuracy(hue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(saturation, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(brightness, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 0.0f, TEST_ACCURACY, nil);
}

@end
