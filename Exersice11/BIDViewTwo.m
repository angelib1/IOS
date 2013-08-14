//
//  BIDViewTwo.m
//  Exersice11
//
//  Created by Nguyen Thanh Son on 8/14/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewTwo.h"
#import "BIDViewThreeController.h"
#import <QuartzCore/QuartzCore.h>
@interface BIDViewTwo ()

@end
BIDViewThreeController *three;
BIDViewController *first;
@implementation BIDViewTwo
@synthesize txtView,txtSearch,btnAdd,viewScreen,text;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        three=[[BIDViewThreeController alloc]initWithNibName:@"BIDViewThreeController" bundle:[NSBundle mainBundle]];
        three.delegateTag=self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage *img=[UIImage imageNamed:@"SAM_0490.JPG"];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[self imageWithImage:img scaledToSize:CGSizeMake([UIScreen mainScreen].applicationFrame.size.width,[UIScreen mainScreen].applicationFrame.size.height)]];
    
    //Navigation controller
    [self.navigationItem setTitle:@"Second Screen"];
    UIImage* imageBarLeft = [UIImage imageNamed:@"back-icon.png"];
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    [leftButton setBackgroundImage:[self imageWithImage:imageBarLeft scaledToSize:CGSizeMake(40, 30)] forState:UIControlStateNormal];
    UIBarButtonItem *leftBarButton =[[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [leftButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage* imageBarRight = [UIImage imageNamed:@"iconupload.png"];
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [rightButton setBackgroundImage:[self imageWithImage:imageBarRight scaledToSize:CGSizeMake(50, 30)] forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButton =[[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [rightButton addTarget:self action:@selector(uploadClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=leftBarButton;
    self.navigationItem.rightBarButtonItem=rightBarButton;
    
    //man hinh thu 2 chua cac view đuoc set Alpha
    viewScreen=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width,[UIScreen mainScreen].applicationFrame.size.height)];
    viewScreen.backgroundColor=[UIColor colorWithWhite:1 alpha:0.2];
    
    
    //TextView
    UIFont *b=[UIFont fontWithName:@"Helvetica" size:14];
    txtView=[[UITextView alloc]initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].applicationFrame.size.width-20, 100)];
    txtView.font=b;
    txtView.text=text;
    [txtView setEditable:NO];
    txtView.backgroundColor=[UIColor colorWithWhite:1 alpha:0.8];
    
    
    //TextField
    txtSearch=[[UITextField alloc]init];
    txtSearch.frame=CGRectMake(10, txtView.frame.origin.y+100+10, [UIScreen mainScreen].applicationFrame.size.width-20, 30);
    txtSearch.backgroundColor=[UIColor colorWithWhite:1 alpha:1];
    txtSearch.font=b;
    txtSearch.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    txtSearch.placeholder=@"Add Tag";
    txtSearch.delegate=self;
    txtSearch.layer.cornerRadius=5;
    txtSearch.clipsToBounds=YES;
    txtSearch.layer.borderWidth=1;
    txtSearch.layer.borderColor=[[UIColor grayColor]CGColor];
    [txtSearch setEnabled:NO];
    
    //Button add
    btnAdd=[UIButton buttonWithType:UIButtonTypeContactAdd];
    btnAdd.frame=CGRectMake(txtSearch.frame.origin.x+txtSearch.frame.size.width-txtSearch.frame.size.height, txtSearch.frame.origin.y, txtSearch.frame.size.height, txtSearch.frame.size.height);
    [btnAdd addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    [viewScreen addSubview:txtView];
    [viewScreen addSubview:txtSearch];
    [viewScreen addSubview:btnAdd];
    [self.view addSubview:viewScreen];
}
//Lay thong tin tu Root delegate toi
-(void)info:(NSMutableArray *)arrayInfo{
    text=[NSString stringWithFormat:@" Tag: %@\n File System Number: %@\n File size: %@",[arrayInfo objectAtIndex:0],[arrayInfo objectAtIndex:1],[arrayInfo objectAtIndex:2]];
}
//Ve lai anh theo kich thuoc mong muon
-(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
//Lay thong tin tu View3 delegate toi
-(void)transferData:(NSMutableArray *)arrayTag{
    NSString *tag=@"";
    for(NSString *str in arrayTag){
        tag=[NSString stringWithFormat:@"%@, %@",str,tag];
    }
    txtSearch.placeholder=tag;
}
//Xu ly khi click vao Button back
-(IBAction)backClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
//Xu ly khi click vao Button Add
-(IBAction)nextClick:(id)sender{
    [self.navigationController pushViewController:three animated:YES];
}
//Xu ly su kien khi click vao button Upload
-(IBAction)uploadClick:(id)sender{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
