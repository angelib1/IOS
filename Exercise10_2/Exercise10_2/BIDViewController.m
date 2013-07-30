//
//  BIDViewController.m
//  Exercise10_2
//
//  Created by Nguyen Thanh Son on 6/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"
#import "BIDAddImageLoad.h"

@interface BIDViewController ()

@end
BIDAddImageLoad *imageload;
BIDProgressLoading *progress;
@implementation BIDViewController
@synthesize imageBackground,img,button;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    img=[UIImage imageNamed:@"image3.png"];
    imageBackground=[[UIImageView alloc]initWithImage:img];
    imageBackground.frame=CGRectMake(0, 0, imageBackground.frame.size.width, imageBackground.frame.size.height);
    
    button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Press Image" forState:UIControlStateNormal];
    button.frame=CGRectMake(110, 420, 100, 40);
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    imageload=[[BIDAddImageLoad alloc]init];
    imageload.delegate=self;
    
    
    [self.view addSubview:imageBackground];
    [self.view addSubview:button];
    
    //check device co ho tro MultiTasking hay khong
    UIDevice *device=[UIDevice currentDevice];
    BOOL deviceMultiTasking=NO;
    if([device isMultitaskingSupported]){
        deviceMultiTasking=YES;
    }
    
}

-(IBAction)btnClick:(id)sender{
    [imageload loadImage:sender];
    [self.view addSubview:imageload.imageload];
}
-(void)imagefinish:(UIImage *)image{
    imageBackground.image=image;
}
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeLeft|UIInterfaceOrientationPortrait;
}
-(BOOL)shouldAutorotate{
    return  YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
