//
//  BIDViewController.m
//  Exercise10_1
//
//  Created by Nguyen Thanh Son on 6/7/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"
#import "BIDAddImageLoad.h"

@interface BIDViewController ()

@end
BIDAddImageLoad *imageLoad;
@implementation BIDViewController
@synthesize imageBackground,img,button;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    imageLoad=[[BIDAddImageLoad alloc]init];
    imageLoad.delegate = self;
    
    img=[UIImage imageNamed:@"image3.png"];
    imageBackground=[[UIImageView alloc]initWithImage:img];
    imageBackground.frame=CGRectMake(0, 0, imageBackground.frame.size.width, imageBackground.frame.size.height);
    
    button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Press Image" forState:UIControlStateNormal];
    button.frame=CGRectMake(110, 420, 100, 40);
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:imageBackground];
    [self.view addSubview:button];
}
-(IBAction)btnClick:(id)sender{
    imageLoad.myURL=[NSURL URLWithString:@"http://www.dailyscreens.com/wp-content/uploads/2013/01/nature-wallpaper-backgrounds.jpg"];
    [imageLoad load:sender];
    //imageLoad.imageload.frame=CGRectMake(100, 100, 79, 69);
    [self.view addSubview:imageLoad.imageload];
    //[self.view addSubview:button];
}
-(void)downloadedImage:(UIImage *)image{
    imageBackground.image=image;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
