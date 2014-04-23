//
//  UIColor+iOS7.h
//  color
//
//  Created by D. Patrick Caldwell on 2/7/14.
//  Added to EDColor by Daniel Doubrovkine on 4/23/14.
//  Copyright (c) 2014 D. Patrick Caldwell. All rights reserved.
//

#import "UIColor+iOS7.h"
#import "UIColor+Hex.h"

@implementation UIColor (iOS7)

#define gradientPair(name, start, end)                                              \
+ (instancetype)iOS7##name##GradientStartColor { return [UIColor colorWithHex:start]; }  \
+ (instancetype)iOS7##name##GradientEndColor { return [UIColor colorWithHex:end]; }      \
+ (NSArray *)iOS7##name##Gradient { return @[(id)UIColor.iOS7##name##GradientStartColor, (id)UIColor.iOS7##name##GradientEndColor]; }

+ (NSArray *)iOS7GradientPairs
{
    return @[
             [self.class iOS7redGradient],
             [self.class iOS7orangeGradient],
             [self.class iOS7yellowGradient],
             [self.class iOS7greenGradient],
             [self.class iOS7tealGradient],
             [self.class iOS7blueGradient],
             [self.class iOS7violetGradient],
             [self.class iOS7magentaGradient],
             [self.class iOS7charcoalGradient],
             [self.class iOS7silverGradient],
             ];
}

+ (NSArray *)iOS7Colors
{
    return @[
             [self.class iOS7redColor],
             [self.class iOS7orangeColor],
             [self.class iOS7yellowColor],
             [self.class iOS7greenColor],
             [self.class iOS7tealColor],
             [self.class iOS7blueColor],
             [self.class iOS7violetColor],
             [self.class iOS7magentaColor],
             [self.class iOS7darkGreyColor],
             [self.class iOS7lightGreyColor],
             [self.class iOS7charcoalColor],
             ];
}

+ (instancetype)iOS7redColor { return [UIColor colorWithHex:0xFF3B30]; }
+ (instancetype)iOS7orangeColor { return [UIColor colorWithHex:0xFF9500]; }
+ (instancetype)iOS7yellowColor { return [UIColor colorWithHex:0xFFCC00]; }
+ (instancetype)iOS7greenColor { return [UIColor colorWithHex:0x4CD964]; }
+ (instancetype)iOS7tealColor { return [UIColor colorWithHex:0x34AADC]; }
+ (instancetype)iOS7blueColor { return [UIColor colorWithHex:0x007AFF]; }
+ (instancetype)iOS7violetColor { return [UIColor colorWithHex:0x5856D6]; }
+ (instancetype)iOS7magentaColor { return [UIColor colorWithHex:0xFF2D55]; }
+ (instancetype)iOS7darkGreyColor { return [UIColor colorWithHex:0x8E8E93]; }
+ (instancetype)iOS7lightGreyColor { return [UIColor colorWithHex:0xC7C7CC]; }
+ (instancetype)iOS7charcoalColor { return [UIColor colorWithHex:0x4A4A4A]; }

gradientPair(red, 0xFF5E3A, 0xFF2A68)
gradientPair(orange, 0xFF9500, 0xFF5E3A)
gradientPair(yellow, 0xFFDB4C, 0xFFCD02)
gradientPair(green, 0x87FC70, 0x0BD318)
gradientPair(teal, 0x52EDC7, 0x5AC8FB)
gradientPair(blue, 0x1AD6FD, 0x1D62F0)
gradientPair(violet, 0xC644FC, 0x5856D6)
gradientPair(magenta, 0xEF4DB6, 0xC643FC)
gradientPair(charcoal, 0x4A4A4A, 0x2B2B2B)
gradientPair(silver, 0xDBDDDE, 0x898C90)

@end

#undef gradientPair
#undef colorFromInteger
