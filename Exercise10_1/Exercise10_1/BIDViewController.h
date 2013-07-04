//
//  BIDViewController.h
//  Exercise10_1
//
//  Created by Nguyen Thanh Son on 6/7/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDAddImageLoad.h"

@interface BIDViewController : UIViewController<LoadImageDelegate>
@property (nonatomic,strong) UIImage *img;
@property (nonatomic,strong) IBOutlet UIImageView *imageBackground;
@property (nonatomic, strong) IBOutlet UIButton *button;
-(IBAction)btnClick:(id)sender;
@end
