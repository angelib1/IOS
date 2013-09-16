//
//  BIDAddTableViewController.m
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDAddTableViewController.h"
#import "BIDAddCell.h"
@interface BIDAddTableViewController ()

@end
static NSString *Identifier=@"Identifier";
BIDAddCell *cell;

@implementation BIDAddTableViewController
@synthesize  item;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        cell=[[BIDAddCell alloc]init];
        
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
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [item count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIFont *font=[UIFont fontWithName:@"Helvetica" size:13];
    [tableView registerClass:[BIDAddCell class] forCellReuseIdentifier:Identifier];
    //khai bao cell va cac thuoc tinh
    cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    NSDictionary *rowData=item[indexPath.row];
    cell.lblLabel1.text=rowData[@"label1"];
    cell.lblLabel2.text=rowData[@"label2"];
    cell.lblLabel3.text=rowData[@"label3"];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    if(indexPath.row==0){
        cell.lblLabel1.textColor=[UIColor grayColor];
        cell.lblLabel1.font=font;
        cell.lblLabel2.textColor=[UIColor grayColor];
        cell.lblLabel2.font=font;
        cell.lblLabel3.textColor=[UIColor grayColor];
        cell.lblLabel3.font=font;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 26;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
