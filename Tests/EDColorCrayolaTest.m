//
//  EDColorCrayolaTest.m
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "EDColorCrayolaTest.h"
#import "UIColor+Crayola.h"

@implementation EDColorCrayolaTest

- (void)testBlack
{
    UIColor *color = [UIColor colorWithCrayola:@"Black"];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testAquamarine
{
    UIColor *color = [UIColor colorWithCrayola:@"aquamarine"];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 0.47058823529411764f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.8588235294117647f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.8862745098039215f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

- (void)testMacaroniAndCheese
{
    UIColor *color = [UIColor colorWithCrayola:@"Macaroni And Cheese"];
    
    SPLIT_RESULT_TO_RGBA
    
    STAssertEqualsWithAccuracy(red, 1.0f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(green, 0.7411764705882353f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(blue, 0.5333333333333333f, TEST_ACCURACY, nil);
    STAssertEqualsWithAccuracy(alpha, 1.0f, TEST_ACCURACY, nil);
}

@end
