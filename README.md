## Color

### Getting Started
The fastest way to get started with `EDColor` is to add the `EDColor` directory to your project and...
```objective-c
#import "EDColor.h"
```
This will automatically bring in all of the various categories and classes that make up the library. Alternatively, if you only need the functionality from a single part of `EDColor`, you can just import that specific header as the library was designed to be completely modular and (thus) decoupled.

### UIColor+Hex
```objective-c
UIColor *green  = [UIColor colorWithHex:0x00FF00];
UIColor *blue   = [UIColor colorWithHex:0x0000FF andAlpha:0.5f];
UIColor *gray   = [UIColor colorWithHexString:@"0xCCC"];
```

### UIColor+HSL

### UIColor+Gamma

### UIColor+Crayola

### UIColor+Pantone

---

### Testing
The test suite for `EDColor` is built using OCUnit. To run the test suite, simply open the project in XCode and choose "test" from the Product menu. Please run and augment the tests prior to submitting a pull request.

### ARC