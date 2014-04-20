//
//  EDSecondViewController.m
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "EDSecondViewController.h"

@interface EDSecondViewController ()

@end

@implementation EDSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"HSB";
        self.tabBarItem.image = [UIImage imageNamed:@"hsb"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(update:) withObject:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - UI events

- (IBAction)update:(id)sender
{
    UIColor *base = [UIColor colorWithRed:0.808f green:0.373f blue:0.306f alpha:0.5f];
    self.swatch.backgroundColor = [base offsetWithHue:self.hue.value saturation:self.saturation.value brightness:self.brightness.value alpha:self.alpha.value];
}

#pragma mark - Dealloc

- (void)dealloc
{
    _hue = nil;
    _saturation = nil;
    _brightness = nil;
    _alpha = nil;
    _swatch = nil;
}

@end
