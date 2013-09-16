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
#define HEIGHT_VIEW 150
#define WIDTH_VIEW 320
#define WIDTH_IMAGE 100
#define WIDTH_TEXT 120
#define HEIGHT_BUTTON_BIG 40
#define HEIGHT_BUTTON_SMALL 30
#define HEIGHT_BUTTON_SMALLER 20
BIDAddTableViewController *addTable;
@implementation BIDViewFour
@synthesize btn,btn1,tableView,item;
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
        btn.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_BUTTON_BIG);
        [btn setTitle:@"Your community this week!" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:20];
        [self setBackgroundColor:[UIColor whiteColor]];
        btn.layer.borderWidth=1;
        btn.layer.borderColor=[[UIColor whiteColor]CGColor];
        
        btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame=CGRectMake(WIDTH_VIEW-30-5, (HEIGHT_BUTTON_BIG-20)/2, 30, 20);
        [btn1 setBackgroundImage:[self imageWithImage:[UIImage imageNamed:@"info.png"] scaledToSize:CGSizeMake(30, 20)] forState:UIControlStateNormal];
        
        //Tableview
        tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, btn.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW-HEIGHT_BUTTON_BIG) style:UITableViewStylePlain];
        addTable=[[BIDAddTableViewController alloc]init];
        tableView.delegate=addTable;
        tableView.dataSource=addTable;
        addTable.item=item;
        
        [self addSubview:btn];
        [self addSubview:btn1];
        [self addSubview:tableView];
    }
    return self;
}
-(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
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
