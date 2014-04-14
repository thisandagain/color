//
//  EDFirstViewController.m
//  color
//
//  Created by Andrew Sliwinski on 9/15/12.
//  Copyright (c) 2012 Andrew Sliwinski. All rights reserved.
//

#import "EDFirstViewController.h"
#import "UIColor+Hex.h"
@interface EDFirstViewController ()

@end

@implementation EDFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Hex";
        self.tabBarItem.image = [UIImage imageNamed:@"hex"];
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
    [self.input resignFirstResponder];
    self.swatch.backgroundColor = [UIColor colorWithHexString:self.input.text];
}

#pragma mark - Dealloc

- (void)dealloc
{
    _input = nil;
    _swatch = nil;
}

@end
