//
//  BIDViewFive.m
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewFive.h"
#import <QuartzCore/QuartzCore.h>
#import "BIDViewOne.h"
BIDViewOne *view3_view1;
@implementation BIDViewFive
@synthesize btn,view1,view1_Image1,view1_lbl1,view2,view2_Image1,view2_btn1,view2_btn2,view2_lbl1,view2_btn3,view3,view3_btn1,view3_lbl1;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
               
        UIFont *font=[UIFont fontWithName:@"Helvetica" size:14];
        btn=[UIButton buttonWithType:UIButtonTypeCustom];
       btn.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width-10, 30);
        [btn setTitle:@"What's New?" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor colorWithRed:51.f/255 green:153.f/255 blue:255.f/255 alpha:1]];
        btn.titleLabel.textColor=[UIColor whiteColor];
        [self setBackgroundColor:[UIColor whiteColor]];
        btn.layer.borderWidth=1;
        btn.layer.borderColor=[[UIColor whiteColor]CGColor];
        
        //view 1
        view1=[[UIView alloc]initWithFrame:CGRectMake(0, btn.frame.size.height, 310, 30)];
        [view1 setBackgroundColor:[UIColor colorWithRed:251.f/255 green:244.f/255 blue:231.f/255 alpha:1]];
        view1_Image1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        view1_Image1.image=[self imageWithImage:[UIImage imageNamed:@"avata.jpg"] scaledToSize:CGSizeMake(30  , 30)];
        view1_lbl1=[[UILabel alloc]initWithFrame:CGRectMake(35, 0, 200, 30)];
        view1_lbl1.text=@"Nguyễn Thanh Sơn";
        view1_lbl1.textColor=[UIColor colorWithRed:51.f/255 green:153.f/255 blue:255.f/255 alpha:1];
        [view1_lbl1 setBackgroundColor:[UIColor colorWithRed:251.f/255 green:244.f/255 blue:231.f/255 alpha:1]];
        
        [view1 addSubview:view1_Image1];
        [view1 addSubview:view1_lbl1];
        
        //view 2
        view2=[[UIView alloc]initWithFrame:CGRectMake(0, view1.frame.origin.y+view1.frame.size.height+5, 310, 130)];
        view2.layer.borderColor=[[UIColor lightGrayColor]CGColor];
        view2.layer.borderWidth=1;
        view2.layer.cornerRadius=4;
        view2.clipsToBounds=YES;
        [view2 setBackgroundColor:[UIColor colorWithRed:251.f/255 green:244.f/255 blue:231.f/255 alpha:1]];
        view2_Image1=[[UIImageView alloc]initWithFrame:CGRectMake(15, 0, 260, 100)];
        view2_Image1.image=[self imageWithImage:[UIImage imageNamed:@"img1.jpg"] scaledToSize:CGSizeMake(260  , 100)];
        view2_btn1= [[UIButton alloc] initWithFrame:CGRectMake(view2_Image1.frame.size.width+view2_Image1.frame.origin.x+5, 50, 20, 20)];
        [view2_btn1 setBackgroundImage:[self imageWithImage:[UIImage imageNamed:@"like.png"] scaledToSize:CGSizeMake(20, 20)] forState:UIControlStateNormal];
        view2_btn2= [[UIButton alloc] initWithFrame:CGRectMake(view2_Image1.frame.size.width+view2_Image1.frame.origin.x+5, 75, 20, 20)];
        [view2_btn2 setBackgroundImage:[self imageWithImage:[UIImage imageNamed:@"likephoto.png"] scaledToSize:CGSizeMake(20, 20)] forState:UIControlStateNormal];
        view2_lbl1=[[UILabel alloc]initWithFrame:CGRectMake(15, 100, 200, 30)];
        [view2_lbl1 setBackgroundColor:[UIColor colorWithRed:251.f/255 green:244.f/255 blue:231.f/255 alpha:1]];
        view2_lbl1.text=@"Image City in Midnight";
        view2_lbl1.font=font;
        view2_lbl1.textColor=[UIColor colorWithRed:51.f/255 green:153.f/255 blue:255.f/255 alpha:1];
        view2_btn3=[UIButton buttonWithType:UIButtonTypeCustom];
        view2_btn3.frame=CGRectMake(view2_Image1.frame.size.width+view2_Image1.frame.origin.x, 105, 30, 20);
        [view2_btn3 setBackgroundImage:[self imageWithImage:[UIImage imageNamed:@"more.png"] scaledToSize:CGSizeMake(30, 20)] forState:UIControlStateNormal];
        [view2 addSubview:view2_Image1];
        [view2 addSubview:view2_btn1];
        [view2 addSubview:view2_btn2];
        [view2 addSubview:view2_lbl1];
        [view2 addSubview:view2_btn3];
        
        view3=[[UIView alloc]initWithFrame:CGRectMake(0, view2.frame.origin.y+view2.frame.size.height+5, 310, 130)];
        view3_view1=[[BIDViewOne alloc]init];
        [view3 setBackgroundColor:[UIColor colorWithRed:251.f/255 green:244.f/255 blue:231.f/255 alpha:1]];
        view3_view1.frame=CGRectMake(0, 0, view3.frame.size.width, 100);
        view3_view1.btn1.frame=CGRectMake(0, 0, 0, 0);
        view3_view1.Image1.image=[UIImage imageNamed:@"city1.jpg"];
        view3_view1.Image2.image=[UIImage imageNamed:@"city2.jpg"];
        view3_view1.Image3.image=[UIImage imageNamed:@"city3.jpg"];
        view3_btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        view3_btn1.frame=CGRectMake(0, view3_view1.frame.size.height+5, 20, 20);
        [view3_btn1 setBackgroundImage:[self imageWithImage:[UIImage imageNamed:@"location.png"] scaledToSize:CGSizeMake(20, 20)] forState:UIControlStateNormal];
        view3_lbl1=[[UILabel alloc]initWithFrame:CGRectMake(view3_btn1.frame.size.width+5, view3_view1.frame.size.height, 200, 30)];
        [view3_lbl1 setBackgroundColor:[UIColor colorWithRed:251.f/255 green:244.f/255 blue:231.f/255 alpha:1]];
        view3_lbl1.text=@"Image was liked!";
        view3_lbl1.textColor=[UIColor colorWithRed:51.f/255 green:153.f/255 blue:255.f/255 alpha:1];
        view3_lbl1.font=font;
        view3.layer.cornerRadius=4;
        view3.clipsToBounds=YES;
        view3.layer.borderWidth=1;
        view3.layer.borderColor=[[UIColor lightGrayColor]CGColor];
       
        [view3 addSubview:view3_view1];
        [view3 addSubview:view3_btn1];
        [view3 addSubview:view3_lbl1];
        
        [self setBackgroundColor:[UIColor colorWithRed:251.f/255 green:244.f/255 blue:231.f/255 alpha:1]];
        [self addSubview:btn];
        [self addSubview:view1];
        [self addSubview:view2];
        [self addSubview:view3];
       

    }
    return self;
}
-(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
