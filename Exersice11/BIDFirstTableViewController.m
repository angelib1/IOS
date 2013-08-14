//
//  BIDFirstTableViewController.m
//  Exersice11
//
//  Created by Nguyen Thanh Son on 8/14/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDFirstTableViewController.h"
#import "BIDFirstCell.h"
#import <QuartzCore/QuartzCore.h>
@interface BIDFirstTableViewController ()

@end
static NSString *Identifier=@"Identifier";
BIDFirstCell *cell;
@implementation BIDFirstTableViewController
@synthesize item,Button,firstDelegate,arrayButton;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        item=[[NSMutableArray alloc]init];
        cell=[[BIDFirstCell alloc]init];
        arrayButton=[[NSMutableArray alloc]init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [item count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIFont *a=[UIFont fontWithName:@"Helvetica" size:17];
    NSString *str=@" ";
    CGSize size;
    size=[str sizeWithFont:a];
    [tableView registerClass:[BIDFirstCell class] forCellReuseIdentifier:Identifier];
    //khai bao cell va cac thuoc tinh
    cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    NSString *string=[NSString stringWithFormat:@"  %@  " ,[item objectAtIndex:indexPath.row]];
    //cell.Label.frame=CGRectMake(10  ,0, [string sizeWithFont:a].width+20, 30);
    cell.Label.text=string;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    if([arrayButton count]<=(indexPath.row)){
        Button=[UIButton buttonWithType:UIButtonTypeCustom];
        Button.backgroundColor=[UIColor whiteColor];
        [Button setTitle:@"-" forState:UIControlStateNormal];
        [Button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        Button.frame=CGRectMake(cell.Label.frame.origin.x+184, 7, 16, 16);
        Button.layer.cornerRadius=8;
        [arrayButton addObject:Button];
        [Button addTarget:self action:@selector(del:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:[arrayButton objectAtIndex:indexPath.row]];
    }
    
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 32;
}

-(IBAction)del:(id)sender{
    cell=(BIDFirstCell *)(((UIButton *)sender).superview);
    for (UIButton *btn in arrayButton){
        [btn removeFromSuperview];
    }
    //[(UIButton *)sender removeFromSuperview];
    [arrayButton removeAllObjects];
    NSString *str=[cell.Label.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    [firstDelegate first:str];
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
