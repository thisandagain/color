//
//  UIColor+iOS7.h
//  color
//
//  Created by D. Patrick Caldwell on 2/7/14.
//  Added to EDColor by Daniel Doubrovkine on 4/23/14.
//  Copyright (c) 2014 D. Patrick Caldwell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (iOS7)

#define gradientPair(name)                                 \
+ (instancetype)iOS7##name##GradientStartColor;            \
+ (instancetype)iOS7##name##GradientEndColor;              \
+ (NSArray *)iOS7##name##Gradient;

+ (instancetype)iOS7redColor;
+ (instancetype)iOS7orangeColor;
+ (instancetype)iOS7yellowColor;
+ (instancetype)iOS7greenColor;
+ (instancetype)iOS7tealColor;
+ (instancetype)iOS7blueColor;
+ (instancetype)iOS7violetColor;
+ (instancetype)iOS7magentaColor;
+ (instancetype)iOS7darkGreyColor;
+ (instancetype)iOS7lightGreyColor;
+ (instancetype)iOS7charcoalColor;

+ (NSArray *)iOS7Colors;
+ (NSArray *)iOS7GradientPairs;

gradientPair(red)
gradientPair(orange)
gradientPair(yellow)
gradientPair(green)
gradientPair(teal)
gradientPair(blue)
gradientPair(violet)
gradientPair(magenta)
gradientPair(charcoal)
gradientPair(silver)

#undef gradientPair

@end

