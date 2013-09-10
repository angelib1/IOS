//
//  BIDViewFour.m
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewFour.h"
#import "BIDAddTableViewController.h"
#import <QuartzCore/QuartzCore.h>
BIDAddTableViewController *addTable;
@implementation BIDViewFour
@synthesize btn,tableView,item;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        item=@[@{@"label1": @"",@"label2":@"rank",@"label3":@"engagement"},
               @{@"label1": @"Japan",@"label2":@"200",@"label3":@"2500232"},
               @{@"label1": @"Tokyo",@"label2":@"1200",@"label3":@"112200"},
               @{@"label1": @"Shibuya",@"label2":@"30500",@"label3":@"30500"}
               ];
        btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width-10, 30);
        [btn setTitle:@"Your community this week!" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor colorWithRed:22.f/255 green:103.f/255 blue:125.f/255 alpha:1]];
        btn.titleLabel.textColor=[UIColor whiteColor];
        [self setBackgroundColor:[UIColor whiteColor]];
        btn.layer.borderWidth=1;
        btn.layer.borderColor=[[UIColor whiteColor]CGColor];
        
        //Tableview
        tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, btn.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width-10, 100) style:UITableViewStylePlain];
        addTable=[[BIDAddTableViewController alloc]init];
        tableView.delegate=addTable;
        tableView.dataSource=addTable;
        addTable.item=item;
        
        [self addSubview:btn];
        [self addSubview:tableView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
