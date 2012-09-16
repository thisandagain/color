//
//  EDFirstViewController.h
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EDFirstViewController : UIViewController

@property IBOutlet UITextField *input;
@property IBOutlet UIView *swatch;

- (IBAction)update:(id)sender;

@end
