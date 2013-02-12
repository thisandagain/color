//
//  EDColorCIELABTest.m
//  color
//
//  Created by Matthew Smith on 2/11/13.
//  Copyright (c) 2012 Matthew Smith. All rights reserved.
//

#import "EDColorCIELABTest.h"
#import "UIColor+CIELAB.h"

#define TEST_ACCURACY_XYZ TEST_ACCURACY*100  //XYZ on scale of 0 to 100
#define TEST_ACCURACY_L TEST_ACCURACY*100  //L scale of 0 to 100
#define TEST_ACCURACY_A TEST_ACCURACY*200  //a scale of 0 to 200
#define TEST_ACCURACY_B TEST_ACCURACY*500  //b scale of 0 to 500

@implementation EDColorCIELABTest

#pragma mark - Class methods
- (void)testLabCreationRed
{
    
    UIColor *color = [UIColor colorWithLightness:53.233 A:80.109 B:67.220 alpha:1.0];
 
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testLabCreationWhite
{
    UIColor *color = [UIColor colorWithLightness:100.0 A:.005 B:-0.010 alpha:1.0];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

#pragma mark - Instance methods

- (void)testLabGetterWhite
{
    UIColor *color = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
    
    SPLIT_RESULT_TO_LAB
    
    STAssertEqualsWithAccuracy(lightness, 100.0f, TEST_ACCURACY_L, nil);
    STAssertEqualsWithAccuracy(a, 0.005f, TEST_ACCURACY_A, nil);
    STAssertEqualsWithAccuracy(b, -0.10f, TEST_ACCURACY_B, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testLabGetterRed
{
    UIColor *color = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    
    SPLIT_RESULT_TO_LAB
    
    STAssertEqualsWithAccuracy(lightness,  53.233f, TEST_ACCURACY_L, nil);
    STAssertEqualsWithAccuracy(a, 80.109f, TEST_ACCURACY_A, nil);
    STAssertEqualsWithAccuracy(b, 67.220f, TEST_ACCURACY_B, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testLabGetterRed2
{
    UIColor *color = [UIColor colorWithRed:.5f green:0.1f blue:0.1f alpha:1.0f];
    
    SPLIT_RESULT_TO_LAB
    
    STAssertEqualsWithAccuracy(lightness,  27.681f, TEST_ACCURACY_L, nil);
    STAssertEqualsWithAccuracy(a, 42.666f, TEST_ACCURACY_A, nil);
    STAssertEqualsWithAccuracy(b, 27.526f, TEST_ACCURACY_B, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
    
}

- (void)testLabOffsetLighten
{
    UIColor *base   = [UIColor colorWithRed:.5f green:0.1f blue:0.1f alpha:1.0f];
    UIColor *color  = [base offsetWithLightness:25.0 a:0.0 b:0.0 alpha:0.0];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.79026f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, .36124f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, .31736f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testLabOffsetDarken
{
    UIColor *base   = [UIColor colorWithRed:.5f green:0.1f blue:0.1f alpha:1.0f];
    UIColor *color  = [base offsetWithLightness:-5.0 a:0.0 b:0.0 alpha:0.0];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.44322f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, .02904f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.05985f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testLabOffsetMaxBrightness
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base offsetWithLightness:500.0 a:0.0 b:0.0 alpha:0.0];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}


- (void)testAOffset
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base offsetWithLightness:0.0f a:10.0f b:0.0f alpha:0.0];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, .024611f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testBOffset
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:.75f];
    UIColor *color  = [base offsetWithLightness:0.0f a:0.0f b:-15.0f alpha:0.0];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, .99518f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.01204f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.16471f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 0.75f, TEST_ACCURACY, nil);
}

#pragma mark - test intermediate colorspace used for LAB conversion.

- (void)testLabXyzFromLAB
{
    UIColor *color = [UIColor colorWithLightness:53.233 A:80.109 B:67.220 alpha:1.0];
    
    CGFloat x,y,z,a;
    [color getX:&x Y:&y Z:&z alpha:&a];
    
    STAssertEqualsWithAccuracy(x, 41.240f, TEST_ACCURACY_XYZ, nil);
    STAssertEqualsWithAccuracy(y, 21.260f, TEST_ACCURACY_XYZ, nil);
    STAssertEqualsWithAccuracy(z, 1.930f, TEST_ACCURACY_XYZ, nil);
    STAssertEqualsWithAccuracy(a, 1.0f, TEST_ACCURACY, nil);
}

- (void)testLabXyzFromRGB
{
    UIColor *color = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];

    CGFloat x,y,z,a;
    [color getX:&x Y:&y Z:&z alpha:&a];
    
    STAssertEqualsWithAccuracy(x, 41.240f, TEST_ACCURACY_XYZ, nil);
    STAssertEqualsWithAccuracy(y, 21.260f, TEST_ACCURACY_XYZ, nil);
    STAssertEqualsWithAccuracy(z, 1.930f, TEST_ACCURACY_XYZ, nil);
    STAssertEqualsWithAccuracy(a, 1.0f, TEST_ACCURACY, nil);
}

@end
