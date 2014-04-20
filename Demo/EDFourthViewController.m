//
//  EDFourthViewController.m
//  color
//
//  Created by Matthew Smith on 2/11/13.
//  Copyright (c) 2012 Matthew Smith. All rights reserved.
//

#import "EDFourthViewController.h"
#import "UIColor+CIELAB.h"

@interface EDFourthViewController ()

@end

@implementation EDFourthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"LAB";

        // grey base makes the A and B sliders show the their bounds
        //  (A = green to magenta,  B = blue to yellow)
        base = [UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:.5f];

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
    
    self.swatch.backgroundColor = [base offsetWithLightness:(self.lightness.value*100.0f) a:self.a.value*500.0 b:self.b.value*200.0 alpha:self.alpha.value];
}

- (void) setColor:(UIColor *)color
{
    CGFloat lightness,a,b,alpha;
    [color getLightness:&lightness A:&a B:&b alpha:&alpha];
    
    self.lightness.value=0.0;
    self.a.value = 0.0;
    self.b.value = 0.0;
    self.alpha.value = alpha;
    
    base = color;
    self.swatch.backgroundColor = color;
}

- (IBAction)setRed:(id)sender
{
    [self setColor:[UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f]];
    [self setColor:[base offsetWithLightness:25.0 a:0.0 b:0.0 alpha:0.0]];
}

- (IBAction)setGreen:(id)sender
{
    [self setColor:[UIColor colorWithRed:0.0f green:.5f blue:0.0f alpha:1.0f]];
}

- (IBAction)setBlue:(id)sender
{
    [self setColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.5f alpha:1.0f]];
}

- (IBAction)setGrey:(id)sender
{
    [self setColor:[UIColor colorWithRed:0.5f green:0.5f blue:0.5f alpha:1.0f]];
}

#pragma mark - Dealloc

- (void)dealloc
{
    _lightness = nil;
    _a = nil;
    _b = nil;
    _alpha = nil;
    _swatch = nil;
}

@end
