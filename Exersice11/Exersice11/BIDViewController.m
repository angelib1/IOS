//
//  BIDViewController.m
//  Exersice11
//
//  Created by Nguyen Thanh Son on 7/31/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"
#import "BIDAddCell.h"
@interface BIDViewController ()

@end
BIDAddCell *addCell;
@implementation BIDViewController
@synthesize tabBar,navigationBar;
@synthesize seachBar;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"image3.png"]];
    UIBarButtonItem *skipBtn = [[UIBarButtonItem alloc]initWithTitle:@"Skip" style:UIBarButtonItemStyleDone target:self action:@selector(skipClick:)];
    navigationBar=[self.navigationController navigationBar];
    navigationBar=[[UINavigationBar alloc ]initWithFrame:CGRectMake(0, 450, self.view.frame.size.width, 44)];
    navigationBar.delegate=self;
    UINavigationItem *firstItem=[[UINavigationItem alloc]init];
    firstItem.rightBarButtonItem=skipBtn;
    firstItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(backClick:)];
    [firstItem setTitle:@"Skip Image"];
    [navigationBar pushNavigationItem:firstItem animated:YES];
    //[navigationBar setTintColor:[UIColor redColor]];
    
    NSLog(@"%f",self.view.frame.size.height);
    seachBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, navigationBar.frame.size.height+5, self.view.frame.size.width, 44)];
    seachBar.placeholder=@"Search";
    for (id img in seachBar.subviews)
    {
        if ([img isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {
            [img removeFromSuperview];
        }
    }
    UIFont *a=[UIFont fontWithName:@"Helvetica" size:17];
    NSString *str=@" ";
    NSString *strLbl1,*strLbl2;
    CGSize size;
    size=[str sizeWithFont:a];
    for(int i=0;i<4;i++){
        addCell=[[BIDAddCell alloc]init];
        addCell.frame=CGRectMake(0, 100+60*i , self.view.frame.size.width, 40);
        addCell.image.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]];
        strLbl1=[NSString stringWithFormat:@"This is image %d",i];
        strLbl2=[NSString stringWithFormat:@"%d",32*(i+1)];
        for(int j=0;j<(60/size.width+1);j++){
            strLbl1=[NSString stringWithFormat:@"%@%@",str,strLbl1];
             strLbl2=[NSString stringWithFormat:@"%@%@",str,strLbl2];
        }
        addCell.label.text=strLbl1;
        addCell.subLabel.text=strLbl2;
        [self.view addSubview:addCell];
    }
    
    [self.view addSubview:navigationBar];
    [self.view addSubview:seachBar];
    
   
    
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
    return UIInterfaceOrientationLandscapeLeft|UIInterfaceOrientationPortrait;
}
-(BOOL)shouldAutorotate{
    return YES;
}
@end
