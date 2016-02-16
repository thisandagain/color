## Color

[![Build Status](http://img.shields.io/travis/thisandagain/color.svg?style=flat)](https://travis-ci.org/thisandagain/color)
[![Version](http://img.shields.io/cocoapods/v/EDColor.svg?style=flat)](http://cocoadocs.org/docsets/EDColor)
[![Platform](http://img.shields.io/badge/platform-iOS-blue.svg?style=flat)](http://cocoadocs.org/docsets/EDColor)


### Getting Started
The quickest way to get started with `EDColor` is with [CocoaPods](http://cocoapods.org), but otherwise you can add the `EDColor` directory to your project and...
```objective-c
#import "EDColor.h"
```
This will automatically bring in all of the various categories and classes that make up the library. Alternatively, if you only need the functionality from a single part of `EDColor`, you can just import that specific header as the library was designed to be completely modular and (thus) decoupled.

### UIColor+Hex
```objective-c
UIColor *green   = [UIColor colorWithHex:0x00FF00];
UIColor *blue    = [UIColor colorWithHex:0x0000FF andAlpha:0.5f];
UIColor *gray    = [UIColor colorWithHexString:@"#CCC"];
```

![](https://raw.github.com/thisandagain/color/master/Demo/Images/example_rgb.png)

### UIColor+HSB
```objective-c
UIColor *red     = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
UIColor *blue    = [red offsetWithHue:-0.56f saturation:0.0f brightness:0.0f alpha:0.0f];
```

![](https://raw.github.com/thisandagain/color/master/Demo/Images/example_hsb.png)

### UIColor+HSL
```objective-c
UIColor *red     = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
UIColor *pink    = [red offsetWithHue:0.0f saturation:0.0f lightness:0.82f alpha:0.0f];
```

![](https://raw.github.com/thisandagain/color/master/Demo/Images/example_hsl.png)

### UIColor+CIELAB

```objective-c
UIColor *red            = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
UIColor *brighterRed    = [red offsetWithLightness:15.0f a:0.0f b:0.0f alpha:0.0f];
```

![](https://raw.github.com/thisandagain/color/master/Demo/Images/example_cielab.png)


### UIColor+Crayola
Because crayons are fun! Full list of colors: http://en.wikipedia.org/wiki/List_of_Crayola_crayon_colors
```objective-c
UIColor *mint    = [UIColor colorWithCrayola:@"Magic Mint"];
UIColor *blue    = [UIColor colorWithCrayola:@"Midnight Blue"];
UIColor *rorange = [UIColor colorWithCrayola:@"Orange Red"];
```
![](https://raw.github.com/thisandagain/color/master/Demo/Images/example_crayola.png)


### UIColor+iOS7
Some of the iOS7 colors from [ios7colors.com](http://ios7colors.com/).
```objective-c
UIColor *yellow    = [UIColor iOS7yellowColor];

UIColor *greenGradientStart = [UIColor iOS7greenGradientStartColor];
UIColor *greenGradientEnd = [UIColor iOS7greenGradientEndColor];
```
![](Demo/Images/example_ios7.png)


---

### Contributing
Install CocoaPods with `gem install cocoapods`. Run `pod install`. Open EDColor.xcworkspace.

### Testing
The test suite for `EDColor` is built using OCUnit. To run the test suite, simply open the project in Xcode and choose "test" from the Product menu. Please run and augment the tests prior to submitting a pull request.

### iOS Support
EDColor is tested on iOS 5 and up. Older versions of iOS may work but are not currently supported.

### ARC
EDColor is built using ARC. If you are including EDColor in a project that **does not** use [Automatic Reference Counting (ARC)](http://developer.apple.com/library/ios/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html), you will need to set the `-fobjc-arc` compiler flag on all of the EDColor source files. To do this in Xcode, go to your active target and select the "Build Phases" tab. Now select all EDColor source files, press Enter, insert `-fobjc-arc` and then "Done" to enable ARC for EDColor.
