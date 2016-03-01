//
//  EDFourthViewController.h
//  color
//
//  Created by Matthew Smith on 2/11/13.
//  Copyright (c) 2012 Matthew Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDFourthViewController : UIViewController
{
    UIColor *base;
}

@property IBOutlet UISlider *lightness;
@property IBOutlet UISlider *a;
@property IBOutlet UISlider *b;
@property IBOutlet UISlider *alpha;
@property IBOutlet UIView *swatch;

- (IBAction)update:(id)sender;

@end