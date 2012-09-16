// Settings
#define TEST_ACCURACY 0.002f

// Macros
#define SPLIT_RESULT_TO_RGBA \
CGFloat red; CGFloat green; CGFloat blue; CGFloat alpha;\
[color getRed:&red green:&green blue:&blue alpha:&alpha];