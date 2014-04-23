//
//  EDColoriOS7ViewController.m
//  Demo
//
//  Created by Daniel Doubrovkine on 4/23/14.
//  Copyright (c) 2014 Andrew Sliwinski. All rights reserved.
//

#import "EDColoriOS7ViewController.h"
#import <EDColor/UIColor+iOS7.h>
#import <Foundation/Foundation.h>

@interface EDColoriOS7ViewController ()
@property(nonatomic, strong, readonly) NSArray *colors;
@end

@implementation EDColoriOS7ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"iOS7";
        NSMutableArray *colors = [[NSMutableArray alloc] init];
        [colors addObjectsFromArray:[UIColor iOS7Colors]];
        [colors addObjectsFromArray:[UIColor iOS7GradientPairs]];
        _colors = colors;
    }
    return self;
}

- (void)viewDidLoad
{
    UINib *cellNib = [UINib nibWithNibName:@"EDColoriOS7ViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"EDColoriOS7ViewCell"];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(160, 160)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:flowLayout];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.colors.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"EDColoriOS7ViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    id colorOrColors = self.colors[indexPath.row];
    UIColor *fromColor;
    UIColor *toColor;
    NSString *title;
    if ([[colorOrColors class] isSubclassOfClass:[NSArray class]]) {
        fromColor = (id) [(NSArray *)colorOrColors firstObject];
        toColor = (id) [(NSArray *)colorOrColors lastObject];
        title = [NSString stringWithFormat:@"0x%x - 0x%x", (unsigned int)fromColor.hexValue, (unsigned int)toColor.hexValue];
    } else {
        fromColor = toColor = (UIColor *) colorOrColors;
        title = [NSString stringWithFormat:@"0x%x", (unsigned int) fromColor.hexValue];
    }

    UIImageView *imageView = (UIImageView *)[cell viewWithTag:200];
    [imageView setImage:[self drawGradientImageFromColor:fromColor toColor:toColor imageSize:imageView.frame.size]];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    [titleLabel setText:title];

    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

// http://carlos-blog.logdown.com/posts/2013/09/14/ios-uiimage-with-gradient-color
- (UIImage *)drawGradientImageFromColor:(UIColor *)beginColor toColor:(UIColor *)endColor imageSize:(CGSize)imageSize
{
    //   set sideline width
    CGFloat lineWidth = 3.0f;
    //   set a canvas, and use the imageSize
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    //   set RGB color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //   set draw context
    CGContextRef context = UIGraphicsGetCurrentContext();
    //   set color to array
    NSArray *gradientColors = [NSArray arrayWithObjects:(id) beginColor.CGColor, (id) endColor.CGColor, nil];
    //   set range 0~1
    //   two value, cause two color
    //   if more color, add more value
    CGFloat gradientLocation[] = { 0, 1 };
    //   set gradient info
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocation);
    //   set rectangle path for bezier path
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    CGContextSaveGState(context);
    [bezierPath addClip];
    //   set gradient start point and end point
    CGPoint beginPoint = CGPointMake(imageSize.width / 2, 0);
    CGPoint endPoint = CGPointMake(imageSize.width / 2, imageSize.height);
    //   add position to linear gradient
    CGContextDrawLinearGradient(context, gradient, beginPoint, endPoint, 0);
    //   set sideline info
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    //   draw sideline
    [bezierPath setLineWidth:lineWidth];
    //   fill gradient color
    [bezierPath stroke];
    CGContextRestoreGState(context);
    //   output context to image
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //   context end and release
    UIGraphicsEndImageContext();
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    return image;
}

@end
