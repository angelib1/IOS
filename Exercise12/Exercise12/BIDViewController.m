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
#define HEIGHT_VIEW_FIRST 106
#define HEIGHT_VIEW 150
#define HEIGHT_VIEW_LAST 410
#define WIDTH_VIEW 320
#define WIDTH_IMAGE 100
#define WIDTH_TEXT 120
#define WIDTH_BUTTON 150
#define HEIGHT_BUTTON_BIG 40
#define HEIGHT_BUTTON_SMALL 30
#define HEIGHT_BUTTON_SMALLER 20
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
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, HEIGHT_BUTTON_SMALL, HEIGHT_BUTTON_SMALL)];
    [leftButton setBackgroundImage:[self imageWithImage:imageBarLeft scaledToSize:CGSizeMake(HEIGHT_BUTTON_SMALL, HEIGHT_BUTTON_SMALL)] forState:UIControlStateNormal];
    UIBarButtonItem *leftBarButton =[[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [leftButton addTarget:self action:@selector(menuClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage* imageBarRight = [UIImage imageNamed:@"setting.png"];
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, HEIGHT_BUTTON_SMALL, HEIGHT_BUTTON_SMALL)];
    [rightButton setBackgroundImage:[self imageWithImage:imageBarRight scaledToSize:CGSizeMake(HEIGHT_BUTTON_SMALL, HEIGHT_BUTTON_SMALL)] forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButton =[[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [rightButton addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lblTitle=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, HEIGHT_BUTTON_SMALL)];
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
    viewOne.frame=CGRectMake(0, 0,[UIScreen mainScreen].applicationFrame.size.width,HEIGHT_VIEW_FIRST);
    [viewOne.btn1 addTarget:self action:@selector(view1_Click) forControlEvents:UIControlEventTouchUpInside];
    viewOne.layer.borderWidth=2;
    viewOne.layer.cornerRadius=7;
    viewOne.clipsToBounds=YES;
    viewOne.layer.borderColor=[[UIColor whiteColor]CGColor];
    [arrayView1 addObject:viewOne];
    
    //View 2
    viewTwo=[[BIDViewTwo alloc]init];
    viewTwo.frame=CGRectMake(0, viewOne.frame.origin.y+viewOne.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW);
    [viewTwo.btn1 addTarget:self action:@selector(view2_Click) forControlEvents:UIControlEventTouchUpInside];
    [viewTwo.btn addTarget:self action:@selector(view2_InfoClick) forControlEvents:UIControlEventTouchUpInside];
    [viewTwo.btn2 addTarget:self action:@selector(view2_btn2Click) forControlEvents:UIControlEventTouchUpInside];
    [viewTwo.btn3 addTarget:self action:@selector(view2_btn3Click) forControlEvents:UIControlEventTouchUpInside];
    viewTwo.layer.borderWidth=2;
    viewTwo.layer.cornerRadius=7;
    viewTwo.clipsToBounds=YES;
    viewTwo.layer.borderColor=[[UIColor whiteColor]CGColor];
    [arrayView1 addObject:viewTwo];
    [arrayView2 addObject:viewTwo];
    
    //View 3
    viewThree=[[BIDViewThree alloc]init];
    viewThree.frame=CGRectMake(0, viewTwo.frame.origin.y+viewTwo.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW);
    [viewThree.btn1 addTarget:self action:@selector(view3_Click) forControlEvents:UIControlEventTouchUpInside];
    [viewThree.btn2 addTarget:self action:@selector(view3_btn2Click) forControlEvents:UIControlEventTouchUpInside];
    viewThree.layer.borderWidth=2;
    viewThree.layer.cornerRadius=7;
    viewThree.clipsToBounds=YES;
    viewThree.layer.borderColor=[[UIColor whiteColor]CGColor];
    [arrayView1 addObject:viewThree];
    [arrayView2 addObject:viewThree];
    [arrayView3 addObject:viewThree];
    
    
    //View 4
    viewFour=[[BIDViewFour alloc]init];
    viewFour.frame=CGRectMake(0, viewThree.frame.origin.y+viewThree.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW);
    [viewFour.btn addTarget:self action:@selector(view4_Click) forControlEvents:UIControlEventTouchUpInside];
    [viewFour.btn1 addTarget:self action:@selector(view4_btn1Click) forControlEvents:UIControlEventTouchUpInside];
    viewFour.layer.borderWidth=2;
    viewFour.layer.cornerRadius=7;
    viewFour.clipsToBounds=YES;
    viewFour.layer.borderColor=[[UIColor whiteColor]CGColor];
    viewFour.tableView.scrollsToTop=NO;
    [arrayView1 addObject:viewFour];
    [arrayView2 addObject:viewFour];
    [arrayView3 addObject:viewFour];
    [arrayView4 addObject:viewFour];
    
    
    //View 5
    viewFive=[[BIDViewFive alloc]init];
    viewFive.frame=CGRectMake(0, viewFour.frame.origin.y+viewFour.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW_LAST);
    [viewFive.btn addTarget:self action:@selector(view5_Click) forControlEvents:UIControlEventTouchUpInside];
    viewFive.layer.borderWidth=2;
    viewFive.layer.cornerRadius=7;
    viewFive.clipsToBounds=YES;
    viewFive.layer.borderColor=[[UIColor whiteColor]CGColor];
    [arrayView1 addObject:viewFive];
    [arrayView2 addObject:viewFive];
    [arrayView3 addObject:viewFive];
    [arrayView4 addObject:viewFive];
    
    
    //self.view
    scrollView.contentSize = CGSizeMake(WIDTH_VIEW, viewFive.frame.origin.y+viewFive.frame.size.height+50);
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
        viewOne.btn1.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_BUTTON_BIG);
      [UIView commitAnimations];
        
    }
    else {
        [self changeViewDrop:arrayView1];
        viewOne.btn1.frame=CGRectMake(viewOne.btn1.frame.origin.x, viewOne.btn1.frame.origin.y,viewOne.btn1.frame.size.width,viewOne.btn1.frame.size.height);
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.4];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        viewOne.btn1.frame=CGRectMake((320-WIDTH_BUTTON)/2,HEIGHT_VIEW_FIRST/2-HEIGHT_BUTTON_BIG/2,WIDTH_BUTTON, HEIGHT_BUTTON_BIG);
        [UIView commitAnimations];
        
    }
    scrollView.contentSize = CGSizeMake(WIDTH_VIEW, viewFive.frame.origin.y+viewFive.frame.size.height+50);
}
-(void)view2_Click{
    if(viewTwo.frame.size.height>80){
        [self changeViewRoll:arrayView2];
    }
    else{
        [self changeViewDrop:arrayView2];        
    }
    scrollView.contentSize = CGSizeMake(WIDTH_VIEW, viewFive.frame.origin.y+viewFive.frame.size.height+50);
}
-(void)view2_InfoClick{
    
}
-(void)view2_btn2Click{
    
}
-(void)view2_btn3Click{
    
}
-(void)view3_Click{
    if(viewThree.frame.size.height>80){
        [self changeViewRoll:arrayView3];
    }
    else{
        [self changeViewDrop:arrayView3];
            }
    scrollView.contentSize = CGSizeMake(WIDTH_VIEW, viewFive.frame.origin.y+viewFive.frame.size.height+50);
}
-(void)view3_btn2Click{
    
}
-(void)view4_Click{
    if(viewFour.frame.size.height>80){
         [self changeViewRoll:arrayView4];
    }
    else{
         [self changeViewDrop:arrayView4];
    }
    scrollView.contentSize = CGSizeMake(WIDTH_VIEW, viewFive.frame.origin.y+viewFive.frame.size.height+50);
}
-(void)view4_btn1Click{
    
}
-(void)view5_Click{
    //[self animateView];
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
            if(previousView.frame.size.height>80){
                subview.frame=CGRectMake(0, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_BUTTON_BIG);
            }else{
                if (subview==viewOne){
                    subview.frame=CGRectMake(0, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width,HEIGHT_BUTTON_BIG);
                }
                else
                 subview.frame=CGRectMake(0, previousView.frame.origin.y+previousView.frame.size.height-15, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_BUTTON_BIG);
            }
                i++;
            
        }
        else if(i==1){
            if (subview==viewFive){
                subview.frame=CGRectMake(0, previousView.frame.origin.y+previousView.frame.size.height-15, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW_LAST);
            }
            else {
                subview.frame=CGRectMake(0, previousView.frame.origin.y+previousView.frame.size.height-15, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW);
            }
            i++;

        }
        else {
            if (subview==viewFive){
                subview.frame=CGRectMake(0, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW_LAST);
            }
            else {
                subview.frame=CGRectMake(0, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW);
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
            subview.frame=CGRectMake(0, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW_FIRST);
        }
        else if (subview==viewFive){
            subview.frame=CGRectMake(0, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW_LAST);
        }
        else {
            if(previousView.frame.size.height>80){
                
            subview.frame=CGRectMake(0, previousView.frame.origin.y+previousView.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW);
            }else {
                subview.frame=CGRectMake(0, previousView.frame.origin.y+previousView.frame.size.height-15, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_VIEW);
            }
        }
    }
     [UIView commitAnimations];
}
-(void)animateView{
    scrollView.frame=CGRectMake([UIScreen mainScreen].applicationFrame.size.width, 0, 0, [UIScreen mainScreen].applicationFrame.size.height);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
     scrollView.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height);
    [UIView commitAnimations];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
