//
//  EDColorCIELABBoundsTest.m
//  color
//
//  Created by Matthew Smith on 2/11/13.
//  Copyright (c) 2012 Matthew Smith. All rights reserved.
//

#import "EDColorCIELABBoundsTest.h"
#import "UIColor+CIELAB.h"

@implementation EDColorCIELABBoundsTest

/* While L has a range of 0 to 100, A and B's range depends on the color gamut of the device and whitepoint in use.
 
    Uncomment and run this on the device, to find the bounds given the whitepoint in use.
 
    i.e. - iPad Mini (gen1), D65, 2deg:  -86.184593 < A < 98.254173
                                        -107.863632 < B < 94.482437
*/
//- (void)testBruteForceMeasureABboundsForDeviceAndWhitepoint
//{
//    CGFloat r = 0.0,g = 0.0,b = 0.0;
//    
//    CGFloat minA = 0.0, maxA = 0.0, minB = 0.0, maxB = 0.0, minL = 0.0, maxL = 0.0;
//    
//    for(r=0.0;r<=1.0;r+=.01)
//    {
//        for(g=0.0;g<=1.0;g+=.01)
//        {
//            for(b=0.0;b<=1.0;b+=.01)
//            {
//                UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
//                CGFloat L,A,B,alpha;
//                [color getLightness:&L A:&A B:&B alpha:&alpha];
//                
//                if(A<minA)
//                {
//                    minA=A;
//                    NSLog(@"Found new minA: %f for rgb %f,%f,%f", minA, r, g, b);
//                }
//
//                if(B<minB)
//                {
//                    minB=B;
//                    NSLog(@"Found new minB: %f for rgb %f,%f,%f", minB, r, g, b);
//                }
//
//                if(A>maxA)
//                {
//                    maxA=A;
//                    NSLog(@"Found new maxA: %f for rgb %f,%f,%f", maxA, r, g, b);
//                }
//
//                if(B>maxB)
//                {
//                    maxB=B;
//                    NSLog(@"Found new maxB: %f for rgb %f,%f,%f", maxB, r, g, b);
//                }
//                
//                if(L<minL)
//                {
//                    minL=L;
//                    NSLog(@"Found new minL: %f for rgb %f,%f,%f", minL, r, g, b);
//                }
//                
//                if(L>maxL)
//                {
//                    maxL=L;
//                    NSLog(@"Found new maxL: %f for rgb %f,%f,%f", maxL, r, g, b);
//                }
//            }
//        }
//    }
//    
//    NSLog(@"minA = %f, maxA = %f, minB = %f, maxB = %f, minL = %f, maxL = %f", minA, maxA, minB, maxB, minL, maxL);
//}


@end
