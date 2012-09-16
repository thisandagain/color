## Color

### Getting Started
The quickest way to get started with `EDColor` is to add the `EDColor` directory to your project and...
```objective-c
#import "EDColor.h"
```
This will automatically bring in all of the various categories and classes that make up the library. Alternatively, if you only need the functionality from a single part of `EDColor`, you can just import that specific header as the library was designed to be completely modular and (thus) decoupled.

### UIColor+Hex
```objective-c
UIColor *green   = [UIColor colorWithHex:0x00FF00];
UIColor *blue    = [UIColor colorWithHex:0x0000FF andAlpha:0.5f];
UIColor *gray    = [UIColor colorWithHexString:@"0xCCC"];
```

### UIColor+HSB
```objective-c
UIColor *red     = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
UIColor *blue    = [red offsetWithHue:-0.5f saturation:0.0f brightness:0.0f alpha:0.0f];
UIColor *beige   = [red offsetWithHue:0.27f saturation:-0.93f brightness:0.0f alpha:0.0f];
```

### UIColor+Crayola
```objective-c
UIColor *mint    = [UIColor colorWithCrayola:@"Magic Mint"];
UIColor *blue    = [UIColor colorWithCrayola:@"Midnight Blue"];
UIColor *rorange = [UIColor colorWithCrayola:@"Orange Red"];
```

---

### Testing
The test suite for `EDColor` is built using OCUnit. To run the test suite, simply open the project in XCode and choose "test" from the Product menu. Please run and augment the tests prior to submitting a pull request.

### iOS Support
EDColor is tested on iOS 5 and up. Older versions of iOS may work but are not currently supported.

### ARC
EDColor is built using ARC. If you are including EDColor in a project that **does not** use [Automatic Reference Counting (ARC)](http://developer.apple.com/library/ios/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html), you will need to set the `-fobjc-arc` compiler flag on all of the EDColor source files. To do this in Xcode, go to your active target and select the "Build Phases" tab. Now select all EDColor source files, press Enter, insert `-fobjc-arc` and then "Done" to enable ARC for EDColor.
