//
//  EDColorCIELABTest.m
//  color
//
//  Created by Matthew Smith on 2/11/13.
//  Copyright (c) 2012 Matthew Smith. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Macros.h"
#import "UIColor+CIELAB.h"

#define TEST_ACCURACY_XYZ TEST_ACCURACY*100  //XYZ on scale of 0 to 100
#define TEST_ACCURACY_L TEST_ACCURACY*100  //L scale of 0 to 100
#define TEST_ACCURACY_A TEST_ACCURACY*200  //a scale of 0 to 200
#define TEST_ACCURACY_B TEST_ACCURACY*500  //b scale of 0 to 500

@interface EDColorCIELABTest : XCTestCase

@end

@implementation EDColorCIELABTest

#pragma mark - Class methods
- (void)testLabCreationRed
{
    
    UIColor *color = [UIColor colorWithLightness:53.233 A:80.109 B:67.220 alpha:1.0];
 
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testLabCreationWhite
{
    UIColor *color = [UIColor colorWithLightness:100.0 A:.005 B:-0.010 alpha:1.0];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

#pragma mark - Instance methods

- (void)testLabGetterWhite
{
    UIColor *color = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
    
    SPLIT_RESULT_TO_LAB
    
    XCTAssertEqualWithAccuracy(lightness, 100.0f, TEST_ACCURACY_L);
    XCTAssertEqualWithAccuracy(a, 0.005f, TEST_ACCURACY_A);
    XCTAssertEqualWithAccuracy(b, -0.10f, TEST_ACCURACY_B);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testLabGetterRed
{
    UIColor *color = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    
    SPLIT_RESULT_TO_LAB
    
    XCTAssertEqualWithAccuracy(lightness,  53.233f, TEST_ACCURACY_L);
    XCTAssertEqualWithAccuracy(a, 80.109f, TEST_ACCURACY_A);
    XCTAssertEqualWithAccuracy(b, 67.220f, TEST_ACCURACY_B);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testLabGetterRed2
{
    UIColor *color = [UIColor colorWithRed:.5f green:0.1f blue:0.1f alpha:1.0f];
    
    SPLIT_RESULT_TO_LAB
    
    XCTAssertEqualWithAccuracy(lightness,  27.681f, TEST_ACCURACY_L);
    XCTAssertEqualWithAccuracy(a, 42.666f, TEST_ACCURACY_A);
    XCTAssertEqualWithAccuracy(b, 27.526f, TEST_ACCURACY_B);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
    
}

- (void)testLabOffsetLighten
{
    UIColor *base   = [UIColor colorWithRed:.5f green:0.1f blue:0.1f alpha:1.0f];
    UIColor *color  = [base offsetWithLightness:25.0 a:0.0 b:0.0 alpha:0.0];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 0.79026f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, .36124f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, .31736f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testLabOffsetDarken
{
    UIColor *base   = [UIColor colorWithRed:.5f green:0.1f blue:0.1f alpha:1.0f];
    UIColor *color  = [base offsetWithLightness:-5.0 a:0.0 b:0.0 alpha:0.0];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 0.44322f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, .02904f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.05985f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testLabOffsetMaxBrightness
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base offsetWithLightness:500.0 a:0.0 b:0.0 alpha:0.0];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}


- (void)testAOffset
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
    UIColor *color  = [base offsetWithLightness:0.0f a:10.0f b:0.0f alpha:0.0];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, 1.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.0f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, .024611f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 1.0f, TEST_ACCURACY);
}

- (void)testBOffset
{
    UIColor *base   = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:.75f];
    UIColor *color  = [base offsetWithLightness:0.0f a:0.0f b:-15.0f alpha:0.0];
    
    SPLIT_RESULT_TO_RGBA
    
    XCTAssertEqualWithAccuracy(red, .99518f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(green, 0.01204f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(blue, 0.16471f, TEST_ACCURACY);
    XCTAssertEqualWithAccuracy(alpha, 0.75f, TEST_ACCURACY);
}

#pragma mark - test intermediate colorspace used for LAB conversion.

- (void)testLabXyzFromLAB
{
    UIColor *color = [UIColor colorWithLightness:53.233 A:80.109 B:67.220 alpha:1.0];
    
    CGFloat x,y,z,a;
    [color getX:&x Y:&y Z:&z alpha:&a];
    
    XCTAssertEqualWithAccuracy(x, 41.240f, TEST_ACCURACY_XYZ);
    XCTAssertEqualWithAccuracy(y, 21.260f, TEST_ACCURACY_XYZ);
    XCTAssertEqualWithAccuracy(z, 1.930f, TEST_ACCURACY_XYZ);
    XCTAssertEqualWithAccuracy(a, 1.0f, TEST_ACCURACY);
}

- (void)testLabXyzFromRGB
{
    UIColor *color = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];

    CGFloat x,y,z,a;
    [color getX:&x Y:&y Z:&z alpha:&a];
    
    XCTAssertEqualWithAccuracy(x, 41.240f, TEST_ACCURACY_XYZ);
    XCTAssertEqualWithAccuracy(y, 21.260f, TEST_ACCURACY_XYZ);
    XCTAssertEqualWithAccuracy(z, 1.930f, TEST_ACCURACY_XYZ);
    XCTAssertEqualWithAccuracy(a, 1.0f, TEST_ACCURACY);
}

@end
