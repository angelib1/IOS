//
//  NHAViewController.m
//  drawMoon
//
//  Created by Nguyễn Hữu Anh on 8/28/13.
//  Copyright (c) 2013 anhnh. All rights reserved.
//

#import "NHAViewController.h"

@interface NHAViewController ()

@end

@implementation NHAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    float op=0.2;
    NHADrawMoon *draw =[[NHADrawMoon alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)  andRadius:100.0 option:op andPhase:0.0];
    draw.backgroundColor= [UIColor grayColor];
    [self.view addSubview:draw];
	// Do any additional setup after loading the view, typically from a nib.
}

-(float)getPhaseFromDay:(int)day
{
    if (day<=15) {
        return M_PI* (float)day/30.0+0.75*M_PI;

    }
    else return M_PI* (float)day/30.0-0.75*M_PI;
    }
-(float)getOptionFromDay:(int)day
{
//    if (day<=15){
//        return ((float)day/15.0);}
//    else return ((float)(30-day)/15.0);
    return 0.125*(float)day;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
