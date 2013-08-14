//
//  BIDSecondTableController.m
//  Exercise11_1
//
//  Created by Nguyen Thanh Son on 8/5/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDSecondTableController.h"
#import "BIDAddCell.h"
@interface BIDSecondTableController ()

@end
BIDAddCell *cell;
static NSString *Identifier=@"Identifier";
@implementation BIDSecondTableController
@synthesize item,itemDelegate;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        item=[[NSMutableArray alloc]init];
        cell=[[BIDAddCell alloc]init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    [tableView registerClass:[BIDAddCell class] forCellReuseIdentifier:Identifier];
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
    
    cell=(BIDAddCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.selected=NO;
    NSLog(@"%@",cell.Label.text);
    NSString *str=[cell.Label.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    [itemDelegate itemChoice:str];
}

@end
