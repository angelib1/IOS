//
//  BIDViewController.m
//  Exersice11
//
//  Created by Nguyen Thanh Son on 7/31/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"
#import "BIDAddCell.h"
#import <QuartzCore/QuartzCore.h>
@interface BIDViewController ()

@end
static NSString *Identifier=@"Identifier";
BIDAddCell *cell;
@implementation BIDViewController
@synthesize tabBar,navigationBar;
@synthesize txtSearch,viewScreen,btnAdd;
@synthesize computer,tableView;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //Gesture cho Keybroad
    UITapGestureRecognizer *keybroad=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeybroad:)];
    [self.view addGestureRecognizer:(keybroad)];
	//Background cho man hinh chinh
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"image2.png"]];
    
    //man hinh thu 2 chua cac view đuoc set Alpha
    viewScreen=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width,[UIScreen mainScreen].applicationFrame.size.height)];
    viewScreen.backgroundColor=[UIColor colorWithWhite:1 alpha:0.2];
    
    //NavigationBar
    UIBarButtonItem *skipBtn = [[UIBarButtonItem alloc]initWithTitle:@"Skip" style:UIBarButtonItemStyleDone target:self action:@selector(skipClick:)];
    navigationBar=[[UINavigationBar alloc ]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, 44)];
    navigationBar.delegate=self;
    [navigationBar setTintColor:[UIColor colorWithWhite:0 alpha:0.1]];
    UINavigationItem *firstItem=[[UINavigationItem alloc]init];
    firstItem.rightBarButtonItem=skipBtn;
    firstItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:self action:@selector(backClick:)];
    
    firstItem.rightBarButtonItem.tintColor=[UIColor blueColor];
    firstItem.leftBarButtonItem.tintColor=[UIColor blueColor];
    [firstItem setTitle:@"Skip Image"];
    [navigationBar pushNavigationItem:firstItem animated:YES];
    
    //TextField 
    txtSearch=[[UITextField alloc]init];
    UIFont *b=[UIFont fontWithName:@"Helvetica" size:14];
    txtSearch.frame=CGRectMake(10, navigationBar.frame.size.height+10, [UIScreen mainScreen].applicationFrame.size.width-20, 30);
    txtSearch.backgroundColor=[UIColor whiteColor];
    txtSearch.font=b;
    txtSearch.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtSearch.placeholder=@"Search";
    txtSearch.delegate=self;
    
    //Button add
    btnAdd=[UIButton buttonWithType:UIButtonTypeContactAdd];
    btnAdd.frame=CGRectMake(txtSearch.frame.size.width-txtSearch.frame.size.height, 0, txtSearch.frame.size.height, txtSearch.frame.size.height);
    [self.txtSearch addSubview:btnAdd];
    btnAdd.hidden=YES;
    
    //tableView
    tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, navigationBar.frame.size.height+txtSearch.frame.size.height+20, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.contentInset=UIEdgeInsetsMake(0, 0, 200, 0);
    tableView.backgroundColor=[UIColor clearColor];
    tableView.separatorColor=[UIColor clearColor];
    

    [tableView registerClass:[BIDAddCell class] forCellReuseIdentifier:Identifier];
    cell=[[BIDAddCell alloc]init];
    computer=@[@{@"image": @"1",@"label":@"Golden image nature"},
               @{@"image": @"2",@"label":@"Greean left"},
               @{@"image": @"3",@"label":@"Flower white"},
               @{@"image": @"4",@"label":@"Cloud computing"},
               @{@"image": @"5",@"label":@"Translate file"},
               @{@"image": @"6",@"label":@"Golden pound day"}];
    
    
    
    [viewScreen addSubview:navigationBar];
    [viewScreen addSubview:txtSearch];
    [viewScreen addSubview:tableView];
    [self.view addSubview:viewScreen];
   
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    btnAdd.hidden=NO;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    btnAdd.hidden=YES;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [computer count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Dinh nghia kich thuoc cua font
    UIFont *a=[UIFont fontWithName:@"Helvetica" size:17];
    UIFont *b=[UIFont fontWithName:@"Helvetica" size:14];
    NSString *str=@" ";
    CGSize size;
    size=[str sizeWithFont:a];
    
    //khai bao cell va cac thuoc tinh
    cell=[self.tableView dequeueReusableCellWithIdentifier:Identifier];
    UIView *bgView = [[UIView alloc] initWithFrame:cell.frame];
    bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    cell.backgroundView = bgView;
    NSDictionary *rowData=self.computer[indexPath.section];
    UIImage *img=[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",rowData[@"image"]]];
    cell.image.image=img;
    //cell.frame = CGRectOffset(cell.frame, 10, 10);

    //lay thong tin cua hinh anh hien thi tren cell roi gan text cho cac label
    NSString* path = [[NSBundle mainBundle] pathForResource:rowData[@"image"] ofType:@"png"];
    NSError* error = nil;
    NSDictionary* fileAttributeDict = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:&error];
    NSString *string=rowData[@"label"];
    for(int j=0;j<(cell.image.frame.size.width/size.width+1)+1;j++){
        string=[NSString stringWithFormat:@"%@%@",str,string];
    }
    NSString *subText=[NSString stringWithFormat:@"Num:%d",fileAttributeDict.fileSystemFileNumber];
    NSString *subInfoText=[NSString stringWithFormat:@"Size:%lld",fileAttributeDict.fileSize];
    if((50+[string sizeWithFont:a].width)>(170+[subInfoText sizeWithFont:b].width))
    {
        cell.Label.frame=CGRectMake(0  ,0, [string sizeWithFont:a].width, 20);
    }
    else
    {
        cell.Label.frame=CGRectMake(0  ,0, [string sizeWithFont:a].width+20,20);
    }
    cell.Label.text=string;
    cell.subLabel.text=subText;
    cell.subLabelInfo.text=subInfoText;
    NSLog(@"%@",fileAttributeDict.description);
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(IBAction)hideKeybroad:(id)sender{
    [self.view endEditing:YES];
}
-(IBAction)skipClick:(id)sender{
    
}
-(IBAction)backClick:(id)sender{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Cac ham khi rotate man hinh
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}
-(BOOL)shouldAutorotate{
    return YES;
}
@end
