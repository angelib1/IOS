//
//  BIDViewController.m
//  Exercise7
//
//  Created by Nguyen Thanh Son on 5/8/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize lblLabel1;
@synthesize lblLabel2;
@synthesize btn;
@synthesize image;
@synthesize imagelarge;
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *txt=@"There are 233 new notifications";
    NSArray *array=[txt componentsSeparatedByString:@" "];
    int i=0;
   // int k=0;
    NSString *test=nil;
        
   
    while(array[i]!=nil)
    {
        NSScanner *scanner=[NSScanner scannerWithString:array[i]];
        [scanner scanCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:&test];
        if(test!=nil)
            break;
        else i++;
    }
    NSString *c1;
    NSString *c2;
  
    NSArray *listItem = [txt componentsSeparatedByString:array[i]];
    c1 = listItem[0];
    c2=listItem[1];
    
    
    image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_notification_normal.png"]];
    imagelarge=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_notification_large.png"]];
    UIFont *a=[UIFont fontWithName:@"Helvetica" size:17];
    CGSize size1 = [c1 sizeWithFont:a];
    CGSize size = [array[i] sizeWithFont:a];
    CGSize size2 = [c2 sizeWithFont:a];
    lblLabel1=[[UILabel alloc]initWithFrame:CGRectMake(20, 50, size1.width, size1.height)];
    btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    if(size.width<image.frame.size.width){
        btn.frame=CGRectMake(lblLabel1.frame.origin.x+size1.width, lblLabel1.frame.origin.y, image.frame.size.width, image.frame.size.height);
        [btn setBackgroundImage:[UIImage imageNamed:@"icon_notification_normal.png"] forState:UIControlStateNormal];
    }
    else
    {
        btn.frame=CGRectMake(lblLabel1.frame.origin.x+size1.width, lblLabel1.frame.origin.y, imagelarge.frame.size.width, imagelarge.frame.size.height);
        [btn setBackgroundImage:[UIImage imageNamed:@"icon_notification_large.png"] forState:UIControlStateNormal];

    }
    
    lblLabel2=[[UILabel alloc]initWithFrame:CGRectMake(btn.frame.origin.x+btn.frame.size.width, lblLabel1.frame.origin.y, size2.width, size2.height)];
       [lblLabel1 setFont:a];
    [lblLabel2 setFont:a];
    [lblLabel1 setBackgroundColor:[UIColor clearColor]];
    [lblLabel1 setText:c1];
    [lblLabel2 setBackgroundColor:[UIColor clearColor]];
    [btn setTitle:array[i] forState:UIControlStateNormal];
    [lblLabel2 setText:c2];
    
    [self.view addSubview:lblLabel1];
    [self.view addSubview:btn];
    [self.view addSubview:lblLabel2];
    NSLog(@"%@",c1);
    NSLog(@"%@",c2);
    NSLog(@"%@",array[i]);
    NSLog(@"%@",lblLabel1.text);
}
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeLeft|UIInterfaceOrientationPortrait;
}
-(BOOL)shouldAutorotate{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
