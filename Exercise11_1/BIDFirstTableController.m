//
//  BIDFirstTableController.m
//  Exercise11_1
//
//  Created by Nguyen Thanh Son on 8/5/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDFirstTableController.h"
#import "BIDAddCellFirstCell.h"
#import <QuartzCore/QuartzCore.h>
@interface BIDFirstTableController ()

@end
static NSString *Identifier=@"Identifier";
BIDAddCellFirstCell *cell;
@implementation BIDFirstTableController
@synthesize item,Button,tagDelegate,arrayButton;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        item=[[NSMutableArray alloc]init];
        cell=[[BIDAddCellFirstCell alloc]init];
        arrayButton=[[NSMutableArray alloc]init];
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
    [tableView registerClass:[BIDAddCellFirstCell class] forCellReuseIdentifier:Identifier];
    //khai bao cell va cac thuoc tinh
    cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    NSString *string=[NSString stringWithFormat:@"%@" ,[item objectAtIndex:indexPath.row]];
    cell.Label.frame=CGRectMake(10  ,0, [string sizeWithFont:a].width+20, 30);
    
    cell.Label.text=string;
    
        Button=[UIButton buttonWithType:UIButtonTypeCustom];
        Button.backgroundColor=[UIColor whiteColor];
        [Button setTitle:@"-" forState:UIControlStateNormal];
        [Button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        Button.frame=CGRectMake(cell.Label.frame.origin.x+[string sizeWithFont:a].width+4, 7, 16, 16);
        Button.layer.cornerRadius=8;
        [Button setTag:indexPath.row];
    [arrayButton addObject:Button];
        [Button addTarget:self action:@selector(del:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:Button];
    NSLog(@"%d",indexPath.row);

    
        return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 32;
}
-(IBAction)del:(id)sender{
    
    [tagDelegate tag:((UIButton *)sender).tag];
    for(UIButton *btn in arrayButton){
        
    }
    [((UIButton *)sender) removeFromSuperview];
   
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
