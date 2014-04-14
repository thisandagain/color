// Settings
#define TEST_ACCURACY 0.002f

// Macros
#define SPLIT_RESULT_TO_RGBA \
CGFloat red,green,blue,alpha;\
[color getRed:&red green:&green blue:&blue alpha:&alpha];

#define SPLIT_RESULT_TO_HSBA \
CGFloat hue,saturation,brightness,alpha;\
[color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];

#define SPLIT_RESULT_TO_HSLA \
CGFloat hue,saturation,lightness,alpha;\
[color getHue:&hue saturation:&saturation lightness:&lightness alpha:&alpha];

#define SPLIT_RESULT_TO_LAB \
CGFloat lightness,a,b,alpha;\
[color getLightness:&lightness A:&a B:&b alpha:&alpha];