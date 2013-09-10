//
//  BIDViewController.m
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewController.h"
#import "BIDViewOne.h"
#import "BIDViewTwo.h"
#import "BIDViewThree.h"
#import "BIDViewFour.h"
#import "BIDViewFive.h"
#import <QuartzCore/QuartzCore.h>

@interface BIDViewController ()

@end
BIDViewOne *viewOne;
BIDViewTwo *viewTwo;
BIDViewThree *viewThree;
BIDViewFour *viewFour;
BIDViewFive *viewFive;
@implementation BIDViewController
@synthesize scrollView,arrayView1,arrayView2,arrayView3,arrayView4;
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //navigationController
    UIImage* imageBarLeft = [UIImage imageNamed:@"menu.png"];
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [leftButton setBackgroundImage:[self imageWithImage:imageBarLeft scaledToSize:CGSizeMake(30, 30)] forState:UIControlStateNormal];
    UIBarButtonItem *leftBarButton =[[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [leftButton addTarget:self action:@selector(menuClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage* imageBarRight = [UIImage imageNamed:@"setting.png"];
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [rightButton setBackgroundImage:[self imageWithImage:imageBarRight scaledToSize:CGSizeMake(30, 30)] forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButton =[[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [rightButton addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lblTitle=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    lblTitle.text=@"HOME";
    lblTitle.textAlignment=NSTextAlignmentCenter;
    lblTitle.textColor=[UIColor blackColor];
    self.navigationItem.leftBarButtonItem=leftBarButton;
    self.navigationItem.rightBarButtonItem=rightBarButton;
    self.navigationItem.titleView=lblTitle;
    
    //Array View
    arrayView1=[[NSMutableArray alloc]init];
     arrayView2=[[NSMutableArray alloc]init];
     arrayView3=[[NSMutableArray alloc]init];
     arrayView4=[[NSMutableArray alloc]init];
    
    
    //Scroll View
    scrollView=[[UIScrollView alloc]init];
    scrollView.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height);
    scrollView.backgroundColor=[UIColor clearColor];
    scrollView.showsHorizontalScrollIndicator = NO;
    [scrollView setDelegate:self];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [[self view] addSubview:scrollView];
    
    
    //View 1
    viewOne=[[BIDViewOne alloc]init];
    viewOne.frame=CGRectMake(5, 0,[UIScreen mainScreen].applicationFrame.size.width-10,100);
    [viewOne.btn1 addTarget:self action:@selector(view1_Click) forControlEvents:UIControlEventTouchUpInside];
    [arrayView1 addObject:viewOne];
    viewOne.layer.cornerRadius=2;
    viewOne.layer.borderWidth=1;
    viewOne.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    
    //View 2
    viewTwo=[[BIDViewTwo alloc]init];
    viewTwo.frame=CGRectMake(5, viewOne.frame.origin.y+viewOne.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width-10, 130);
    [viewTwo.btn1 addTarget:self action:@selector(view2_Click) forControlEvents:UIControlEventTouchUpInside];
    [arrayView1 addObject:viewTwo];
    [arrayView2 addObject:viewTwo];
    viewTwo.layer.cornerRadius=2;
    //View 3
    viewThree=[[BIDViewThree alloc]init];
    viewThree.frame=CGRectMake(5, viewTwo.frame.origin.y+viewTwo.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width-10, 130);
    [viewThree.btn1 addTarget:self action:@selector(view3_Click) forControlEvents:UIControlEventTouchUpInside];
    [arrayView1 addObject:viewThree];
    [arrayView2 addObject:viewThree];
    [arrayView3 addObject:viewThree];
    viewThree.layer.cornerRadius=2;
    
    //View 4
    viewFour=[[BIDViewFour alloc]init];
    viewFour.frame=CGRectMake(5, viewThree.frame.origin.y+viewThree.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width-10, 130);
    [viewFour.btn addTarget:self action:@selector(view4_Click) forControlEvents:UIControlEventTouchUpInside];
    [arrayView1 addObject:viewFour];
    [arrayView2 addObject:viewFour];
    [arrayView3 addObject:viewFour];
    [arrayView4 addObject:viewFour];
    viewFour.layer.cornerRadius=2;
    
    //View 5
    viewFive=[[BIDViewFive alloc]init];
    viewFive.frame=CGRectMake(5, viewFour.frame.origin.y+viewFour.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width-10, 300);
    [viewFive.btn addTarget:self action:@selector(view5_Click) forControlEvents:UIControlEventTouchUpInside];
    [arrayView1 addObject:viewFive];
    [arrayView2 addObject:viewFive];
    [arrayView3 addObject:viewFive];
    [arrayView4 addObject:viewFive];
    viewFive.layer.cornerRadius=2;
    
    //self.view
    scrollView.contentSize = CGSizeMake(320, viewFive.frame.origin.y+viewFive.frame.size.height+100);
    [scrollView addSubview:viewOne];
    [scrollView addSubview:viewTwo];
    [scrollView addSubview:viewThree];
    [scrollView addSubview:viewFour];
    [scrollView addSubview:viewFive];
    [self.view addSubview:scrollView];
}
-(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
-(void)menuClick{
    
}
-(void)settingClick{
    
}
-(void)view1_Click{
    if(viewOne.frame.size.height>80)
    {
        [self changeViewRoll:arrayView1];
       viewOne.btn1.frame=CGRectMake(viewOne.btn1.frame.origin.x, viewOne.btn1.frame.origin.y,viewOne.btn1.frame.size.width,viewOne.btn1.frame.size.height);
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        viewOne.btn1.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width-10, 30);
      [UIView commitAnimations];
        
    }
    else {
        [self changeViewDrop:arrayView1];
        viewOne.btn1.frame=CGRectMake(viewOne.btn1.frame.origin.x, viewOne.btn1.frame.origin.y,viewOne.btn1.frame.size.width,viewOne.btn1.frame.size.height);
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        viewOne.btn1.frame=CGRectMake(80, 30,150, 30);
        [UIView commitAnimations];
        
    }
    scrollView.contentSize = CGSizeMake(320, viewFive.frame.origin.y+viewFive.frame.size.height+100);
}
-(void)view2_Click{
    if(viewTwo.frame.size.height>80){
        [self changeViewRoll:arrayView2];
    }
    else{
        [self changeViewDrop:arrayView2];        
    }
    scrollView.contentSize = CGSizeMake(320, viewFive.frame.origin.y+viewFive.frame.size.height+100);
}
-(void)view3_Click{
    if(viewThree.frame.size.height>80){
        [self changeViewRoll:arrayView3];
    }
    else{
        [self changeViewDrop:arrayView3];
            }
    scrollView.contentSize = CGSizeMake(320, viewFive.frame.origin.y+viewFive.frame.size.height+100);
}
-(void)view4_Click{
    if(viewFour.frame.size.height>80){
         [self changeViewRoll:arrayView4];
    }
    else{
         [self changeViewDrop:arrayView4];
    }
    scrollView.contentSize = CGSizeMake(320, viewFive.frame.origin.y+viewFive.frame.size.height+100);
}

-(void)view5_Click{
}
//cuon
-(void)changeViewRoll:(NSMutableArray *)arrayView{
    int i=0;
    for (UIView *subview in arrayView){
         subview.frame=CGRectMake(subview.frame.origin.x, subview.frame.origin.y,subview.frame.size.width,subview.frame.size.height);
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    UIView *previousView=[[UIView alloc]init];
    for (UIView *subview in arrayView){
        if(subview==viewTwo){
            previousView=viewOne;
        }
        else if(subview==viewThree){
            previousView=viewTwo;
        }
        else if(subview==viewFour){
            previousView=viewThree;
        }

        else if(subview==viewFive){
            previousView=viewFour;
        }

        if(i==0){
            subview.frame=CGRectMake(5, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width-10, 30);
            i++;
        }
        else {
            if (subview==viewFive){
                subview.frame=CGRectMake(5, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width-10, 300);
            }
            else {
                subview.frame=CGRectMake(5, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width-10, 130);
            }

        }
    }
    [UIView commitAnimations];
}

//tha cuon
-(void)changeViewDrop:(NSMutableArray *)arrayView{
    for (UIView *subview in arrayView){
        subview.frame=CGRectMake(subview.frame.origin.x, subview.frame.origin.y,subview.frame.size.width,subview.frame.size.height);
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    UIView *previousView=[[UIView alloc]init];
    for (UIView *subview in arrayView){
        if(subview==viewTwo){
            previousView=viewOne;
        }
        else if(subview==viewThree){
            previousView=viewTwo;
        }
        else if(subview==viewFour){
            previousView=viewThree;
        }
        
        else if(subview==viewFive){
            previousView=viewFour;
        }

        if(subview==viewOne){
            subview.frame=CGRectMake(5, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width-10, 100);
        }
        else if (subview==viewFive){
            subview.frame=CGRectMake(5, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width-10, 300);
        }
        else {
            subview.frame=CGRectMake(5, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width-10, 130);
        }
    }
     [UIView commitAnimations];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
