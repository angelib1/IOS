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
#import "BIDViewTwo.h"
@interface BIDViewController ()

@end
static NSString *Identifier=@"Identifier";
BIDAddCell *cell;
@implementation BIDViewController
@synthesize txtSearch,viewScreen,btnAdd;
@synthesize computer,tableView;
@synthesize delegateInfo;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	//Background cho man hinh chinh
    UIImage *img=[UIImage imageNamed:@"SAM_0490.JPG"];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[self imageWithImage:img scaledToSize:CGSizeMake([UIScreen mainScreen].applicationFrame.size.width,[UIScreen mainScreen].applicationFrame.size.height)]];
    
    //man hinh thu 2 chua cac view đuoc set Alpha
    viewScreen=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width,[UIScreen mainScreen].applicationFrame.size.height)];
    viewScreen.backgroundColor=[UIColor colorWithWhite:1 alpha:0.2];
    
    //TextField 
    txtSearch=[[UITextField alloc]init];
    UIFont *b=[UIFont fontWithName:@"Helvetica" size:14];
    txtSearch.frame=CGRectMake(10, 10, [UIScreen mainScreen].applicationFrame.size.width-20, 30);
    [txtSearch addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    txtSearch.backgroundColor=[UIColor colorWithWhite:1 alpha:1];
    txtSearch.font=b;
    txtSearch.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtSearch.placeholder=@"Search";
    txtSearch.delegate=self;
    txtSearch.layer.cornerRadius=5;
    txtSearch.clipsToBounds=YES;
    txtSearch.layer.borderWidth=1;
    txtSearch.layer.borderColor=[[UIColor grayColor]CGColor];
    
    //tableView
    tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.contentInset=UIEdgeInsetsMake(0, 0, 200, 0);
    tableView.backgroundColor=[UIColor clearColor];
    tableView.separatorColor=[UIColor clearColor];
    
   //NavigationBar Controller
    
    UIImage* imageBarLeft = [UIImage imageNamed:@"back-icon.png"];
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    [leftButton setBackgroundImage:[self imageWithImage:imageBarLeft scaledToSize:CGSizeMake(40, 30)] forState:UIControlStateNormal];
    UIBarButtonItem *leftBarButton =[[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [leftButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage* imageBarRight = [UIImage imageNamed:@"iconskip.png"];
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [rightButton setBackgroundImage:[self imageWithImage:imageBarRight scaledToSize:CGSizeMake(50, 30)] forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButton =[[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [rightButton addTarget:self action:@selector(skipClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=leftBarButton;
    self.navigationItem.rightBarButtonItem=rightBarButton;
    self.navigationItem.title=@"First Screen";
    
    //load cell
    [tableView registerClass:[BIDAddCell class] forCellReuseIdentifier:Identifier];
    cell=[[BIDAddCell alloc]init];
    computer=@[@{@"image": @"1",@"label":@"Golden image nature"},
               @{@"image": @"2",@"label":@"Greean left"},
               @{@"image": @"3",@"label":@"Flower white"},
               @{@"image": @"4",@"label":@"Cloud computing"},
               @{@"image": @"5",@"label":@"Translate file"},
               @{@"image": @"6",@"label":@"Golden pound day"}];
    
    
    //Add Subview
    [viewScreen addSubview:tableView];
    [viewScreen addSubview:txtSearch];
    [self.view addSubview:viewScreen];
    
}
//Ve lai anh theo kich thuoc lua chon
-(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
//Xu ly khi click vao TextField
-(void)textFieldDidBeginEditing:(UITextField *)textField{

}
//Xu ly khi ket thuc edit TextField
-(void)textFieldDidEndEditing:(UITextField *)textField{
 
}

//Cac ham xu ly voi UITableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [computer count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0)
    return 40;
    else return 10;
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

//Click vao cell trong UITableView
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    cell=(BIDAddCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    cell.selected=NO;
    NSMutableArray *arrayInfo=[[NSMutableArray alloc]init];
    [arrayInfo addObject:[cell.Label.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    [arrayInfo addObject:cell.subLabel.text];
    [arrayInfo addObject:cell.subLabelInfo.text];
    BIDViewTwo *two=[[BIDViewTwo alloc]initWithNibName:@"BIDViewTwo" bundle:[NSBundle mainBundle]];
    //khai bao delegate khi truyen thong so tu Root toi View2
    delegateInfo=two;
    [delegateInfo info:arrayInfo];
    [self.navigationController pushViewController:two animated:YES];
    
}
//Xu ly khi click vao button Skip
-(IBAction)skipClick:(id)sender{
}
//Xu ly khi click vao button back
-(IBAction)backClick:(id)sender{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
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
