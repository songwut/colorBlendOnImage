//
//  ViewController.h
//  colorBlend
//
//  Created by Songwut on 1/4/13.
//  Copyright (c) 2013 Songwut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imgShow;
@property (weak, nonatomic) IBOutlet UIImageView *imgShowOld;
- (UIImage*)blendColor:(UIImage *)originalImage withColor:(UIColor *)addColor;
//+ (UIImage *)imageNamed:(NSString *)name withColor:(UIColor *)color;

@end
