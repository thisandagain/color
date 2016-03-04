//
//  EDSecondViewController.h
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDSecondViewController : UIViewController

@property IBOutlet UISlider *hue;
@property IBOutlet UISlider *saturation;
@property IBOutlet UISlider *brightness;
@property IBOutlet UISlider *alpha;
@property IBOutlet UIView *swatch;

- (IBAction)update:(id)sender;

@end