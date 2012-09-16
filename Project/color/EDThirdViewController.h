//
//  EDThirdViewController.h
//  color
//
//  Created by Andrew Sliwinski on 9/16/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDThirdViewController : UIViewController

@property IBOutlet UISlider *hue;
@property IBOutlet UISlider *saturation;
@property IBOutlet UISlider *lightness;
@property IBOutlet UISlider *alpha;
@property IBOutlet UIView *swatch;

- (IBAction)update:(id)sender;

@end