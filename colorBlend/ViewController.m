//
//  ViewController.m
//  colorBlend
//
//  Created by Songwut on 1/4/13.
//  Copyright (c) 2013 Songwut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (UIImage *)blendColor:(UIImage *)originalImage withColor:(UIColor *)addColor
{
    UIImage *img = originalImage;
    
    // begin a new image context, to draw our colored image onto
    UIGraphicsBeginImageContext(img.size);
    
    // get a reference to that context we created
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // set the fill color
    [addColor setFill];
    
    // translate/flip the graphics context (for transforming from CG* coords to UI* coords
    CGContextTranslateCTM(context, 0, img.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // set the blend mode to color burn, and the original image
    CGContextSetBlendMode(context, kCGBlendModeColorBurn);
    CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
    CGContextDrawImage(context, rect, img.CGImage);
    
    // set a mask that matches the shape of the image, then draw (color burn) a colored rectangle
    CGContextClipToMask(context, rect, img.CGImage);
    CGContextAddRect(context, rect);
    CGContextDrawPath(context,kCGPathFill);
    
    // generate a new UIImage from the graphics context we drew onto
    UIImage *coloredImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //UIColor *coloredPattern = [UIColor colorWithPatternImage:coloredImg];
    //self.imgShow.backgroundColor = [UIColor colorWithPatternImage:coloredImg];
    //[self.view addSubview:coloredImg];
    //return the color-burned image
    return coloredImg;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *originalImage = [[UIImage alloc] init];
    originalImage = [UIImage imageNamed:@"woodter.jpeg"];
    [self.imgShowOld setBackgroundColor:[UIColor colorWithPatternImage:originalImage]];
    
    UIImage *newImage = [self blendColor:originalImage withColor:[UIColor redColor]];
    [self.imgShow setBackgroundColor:[UIColor colorWithPatternImage:newImage]];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
