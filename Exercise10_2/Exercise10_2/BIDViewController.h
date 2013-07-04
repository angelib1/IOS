//
//  BIDViewController.h
//  Exercise10_2
//
//  Created by Nguyen Thanh Son on 6/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDAddImageLoad.h"

@interface BIDViewController : UIViewController<DownloadFinish>
@property (nonatomic,strong) UIImage *img;
@property (nonatomic,strong) IBOutlet UIImageView *imageBackground;
@property (nonatomic, strong) IBOutlet UIButton *button;
-(IBAction)btnClick:(id)sender;

@end
