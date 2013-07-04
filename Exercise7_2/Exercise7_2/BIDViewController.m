//
//  BIDViewController.m
//  Exercise7_2
//
//  Created by Nguyen Thanh Son on 5/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"
#import "CustomView.h"

@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize image;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //load text tu file text.txt
//    NSString *pathText=[[NSBundle mainBundle]pathForResource:@"text" ofType:@"txt"];
//    NSString *text=[NSString stringWithContentsOfFile:pathText encoding:NSUTF8StringEncoding error:nil];
   NSString *text=@"There are 2 new notifications";
    //chia cac doan van trong file text.txt
    NSArray *array=[text componentsSeparatedByString:@" "];
    NSString *c1=[[NSString alloc]initWithString:array[0]];
    
    //khai bao font chu
    CTFontRef fontRef=CTFontCreateWithName((CFStringRef)@"Palatino-Bold", 15, NULL);
    CTFontRef fontRefBold=CTFontCreateWithName((CFStringRef)@"Palatino-Bold", 20, NULL);
    //dictionary chua cac attribute
    NSDictionary *attributeDic=[NSDictionary dictionaryWithObjectsAndKeys:(id)fontRef,kCTFontAttributeName , (id)[[UIColor blackColor]CGColor],kCTForegroundColorAttributeName, nil];
    NSDictionary *attributeDicBold=[NSDictionary dictionaryWithObjectsAndKeys:(id)fontRefBold,kCTFontAttributeName , (id)[[UIColor blueColor]CGColor],kCTForegroundColorAttributeName, nil];
    //khai bao image
    image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_notification_normal.png"]];
    //gan cac attributedString
    NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc]initWithString:text];
    [attributedString addAttributes:attributeDic range:NSMakeRange(0, [text length])];
    [attributedString addAttributes:attributeDicBold range:NSMakeRange(0, [c1 length])];
    [(CustomView *)[self view]setAttribute:attributedString];
    CFRelease(fontRef);
    CFRelease(fontRefBold);
    [attributedString release];
//
    
}
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeLeft|UIInterfaceOrientationMaskPortrait;
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
