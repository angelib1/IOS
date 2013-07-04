//
//  ViewController.m
//  Exercise4_2
//
//  Created by Nguyen Thanh Son on 5/7/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "ViewController.h"
#import "AddPickerView.h"
#import "AddCell.h"

@interface ViewController ()

@end
AddPickerView *picker;
AddCell *cell;
UITableView *tableView;
static NSString *Identifier=@"Identifier";

@implementation ViewController
@synthesize computer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    computer=@[@{@"label":@"Start"},@{@"label":@"End"}];
    tableView=(id)[self.view viewWithTag:5];
    UINib *nib=[UINib nibWithNibName:@"AddCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:Identifier];
    picker=[[AddPickerView alloc]init];
    picker.datePicker.frame=CGRectMake(0, self.view.frame.size.height-300, picker.datePicker.frame.size.width,300);
    picker.toolbar.frame=CGRectMake(0, self.view.frame.size.height-350, picker.datePicker.frame.size.width, 50);
    [self.view addSubview:picker.datePicker];
    [self.view addSubview:picker.toolbar];
    picker.datePicker.hidden=true;
    picker.toolbar.hidden=true;
	// Do any additional setup after loading the view, typically from a nib.
}

//ham hien thi TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *sectionName;
    switch (section) {
        case 0:
            sectionName=NSLocalizedString(@"Section-1", @"");
            break;
       }
    return sectionName;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    NSDictionary *rowData=computer[indexPath.row];
    cell.lblLabel.text=rowData[@"label"];
    return cell;
}


//cac ham ho tro orientation cho iphone
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeLeft|UIInterfaceOrientationPortrait;
}
-(BOOL)shouldAutorotate{
    return YES;
}


//Cac ham khi click vao cell trong Tableview
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    picker.datePicker.hidden=false;
    picker.toolbar.hidden=false;
    cell=(AddCell *)[tableView cellForRowAtIndexPath:indexPath];
    [picker setCell:cell];
    return indexPath;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
