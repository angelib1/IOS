//
//  BIDSecondTableViewController.m
//  Exersice11
//
//  Created by Nguyen Thanh Son on 8/14/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDSecondTableViewController.h"
#import "BIDSecondCell.h"
@interface BIDSecondTableViewController ()

@end
BIDSecondCell *cell;
static NSString *Identifier=@"Identifier";
@implementation BIDSecondTableViewController
@synthesize item,itemDelegate;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        item=[[NSMutableArray alloc]init];
        cell=[[BIDSecondCell alloc]init];
        
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
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [item count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIFont *a=[UIFont fontWithName:@"Helvetica" size:17];
    NSString *str=@" ";
    CGSize size;
    size=[str sizeWithFont:a];
    [tableView registerClass:[BIDSecondCell class] forCellReuseIdentifier:Identifier];
    //khai bao cell va cac thuoc tinh
    cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    NSString *string=[NSString stringWithFormat:@"  %@  " ,[item objectAtIndex:indexPath.section]];
    cell.Label.frame=CGRectMake(10  ,0, [string sizeWithFont:a].width, 30);
    cell.Label.text=string;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 32;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0)
        return 50;
    else return 15;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
    [sectionView setBackgroundColor:[UIColor clearColor]];
    return sectionView;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell=(BIDSecondCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selected=NO;
    NSLog(@"%@",cell.Label.text);
    NSString *str=[cell.Label.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    [itemDelegate itemChoice:str];
}

@end
