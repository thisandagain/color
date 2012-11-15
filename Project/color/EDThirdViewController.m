//
//  EDThirdViewController.m
//  color
//
//  Created by Andrew Sliwinski on 9/16/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "EDThirdViewController.h"
#import "UIColor+HSL.h"

@interface EDThirdViewController ()

@end

@implementation EDThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"HSL";
        self.tabBarItem.image = [UIImage imageNamed:@"hsl"];
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
    UIColor *base = [UIColor colorWithRed:0.9f green:0.9f blue:0.01f alpha:0.8f];
    self.swatch.backgroundColor = [base offsetWithHue:self.hue.value saturation:self.saturation.value lightness:self.lightness.value alpha:self.alpha.value];
}

#pragma mark - Dealloc

- (void)dealloc
{
    _hue = nil;
    _saturation = nil;
    _lightness = nil;
    _alpha = nil;
    _swatch = nil;
}

@end
