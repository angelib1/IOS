//
//  BIDViewController.m
//  Exercise7_3
//
//  Created by Nguyen Thanh Son on 5/14/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"
#import "CustomView.h"
@interface BIDViewController ()

@end
CustomView *custom;
@implementation BIDViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    custom=[[CustomView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    custom.backgroundColor=[UIColor clearColor];
    [[self view]addSubview:custom.image];
    [[self view] addSubview:custom.imagelarge];
    [self.view addSubview:custom];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
