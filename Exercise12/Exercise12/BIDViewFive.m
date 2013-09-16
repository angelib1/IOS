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
#define HEIGHT_VIEW 410
#define WIDTH_VIEW 320
#define WIDTH_IMAGE 100
#define WIDTH_TEXT 120
#define HEIGHT_BUTTON_BIG 40
#define HEIGHT_BUTTON_SMALL 30
#define HEIGHT_BUTTON_SMALLER 20
BIDViewOne *view4_view1;
@implementation BIDViewFive
@synthesize view,btn,view1,view1_Image1,view1_lbl1,view2,view2_Image1,view2_btn1,view2_btn2,view3,view3_btn1,view3_lbl1,view3_btn2,view4,view5,view5_btn1,view5_lbl1;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
            
       
        btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_BUTTON_BIG);
        [btn setTitle:@"What's New?" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor colorWithRed:51.f/255 green:153.f/255 blue:255.f/255 alpha:1]];
        btn.titleLabel.textColor=[UIColor whiteColor];
        btn.titleLabel.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:20];
        [self setBackgroundColor:[UIColor whiteColor]];
        btn.layer.borderWidth=1;
        btn.layer.borderColor=[[UIColor grayColor]CGColor];
        
        //view 1
        view1=[[UIView alloc]initWithFrame:CGRectMake(0, btn.frame.size.height+10, WIDTH_VIEW, HEIGHT_BUTTON_BIG)];
        //[view1 setBackgroundColor:[UIColor colorWithRed:251.f/255 green:244.f/255 blue:231.f/255 alpha:1]];
        view1_Image1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, HEIGHT_BUTTON_BIG, HEIGHT_BUTTON_BIG)];
        view1_Image1.image=[self imageWithImage:[UIImage imageNamed:@"avata.jpg"] scaledToSize:CGSizeMake(HEIGHT_BUTTON_BIG  , HEIGHT_BUTTON_BIG)];
        view1_lbl1=[[UILabel alloc]initWithFrame:CGRectMake(HEIGHT_BUTTON_BIG+5, 0, WIDTH_VIEW-(HEIGHT_BUTTON_BIG+5), HEIGHT_BUTTON_BIG)];
        view1_lbl1.text=@"Nguyễn Thanh Sơn";
        view1_lbl1.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:17];
        view1_lbl1.textColor=[UIColor colorWithRed:51.f/255 green:153.f/255 blue:255.f/255 alpha:1];
        //[view1_lbl1 setBackgroundColor:[UIColor colorWithRed:251.f/255 green:244.f/255 blue:231.f/255 alpha:1]];
        
        [view1 addSubview:view1_Image1];
        [view1 addSubview:view1_lbl1];
        
        //view
        view=[[UIView alloc]initWithFrame:CGRectMake(10, HEIGHT_BUTTON_BIG, WIDTH_VIEW-10, 370)];
        view.layer.borderWidth=1;
        view.layer.borderColor=[[UIColor grayColor]CGColor];
        
        //view 2
        view2=[[UIView alloc]initWithFrame:CGRectMake(view.frame.origin.x+10, 10+2*HEIGHT_BUTTON_BIG+10,view.frame.size.width-20, 120)];
        view2.clipsToBounds=YES;
        //view2.layer.cornerRadius=7;
        view2_Image1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, view2.frame.size.width-HEIGHT_BUTTON_SMALL, 120)];
        view2_Image1.image=[self imageWithImage:[UIImage imageNamed:@"img1.jpg"] scaledToSize:CGSizeMake(view2.frame.size.width-HEIGHT_BUTTON_SMALL  , 120)];
        view2_btn1= [[UIButton alloc] initWithFrame:CGRectMake(view2_Image1.frame.size.width+view2_Image1.frame.origin.x+5, view2_Image1.frame.origin.y+view2_Image1.frame.size.height-50, 20, 20)];
        [view2_btn1 setBackgroundImage:[self imageWithImage:[UIImage imageNamed:@"like.png"] scaledToSize:CGSizeMake(20, 20)] forState:UIControlStateNormal];
        view2_btn2= [[UIButton alloc] initWithFrame:CGRectMake(view2_btn1.frame.origin.x, view2_btn1.frame.origin.y+view2_btn1.frame.size.height+5, 20, 20)];
        [view2_btn2 setBackgroundImage:[self imageWithImage:[UIImage imageNamed:@"likephoto.png"] scaledToSize:CGSizeMake(20, 20)] forState:UIControlStateNormal];
               [view2 addSubview:view2_Image1];
        [view2 addSubview:view2_btn1];
        [view2 addSubview:view2_btn2];
        
        //Border View
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        UIBezierPath *roundedPath =[UIBezierPath bezierPathWithRoundedRect:view2.bounds byRoundingCorners:UIRectCornerTopRight |UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
        maskLayer.path = [roundedPath CGPath];
        maskLayer.frame=view2.bounds;
        maskLayer.fillColor=[[UIColor clearColor]CGColor];
        maskLayer.strokeColor=[[UIColor lightGrayColor]CGColor];
        maskLayer.lineWidth=1;
        [view2.layer addSublayer:maskLayer];
        
        //shadow
        view2.layer.shadowColor = [[UIColor blackColor] CGColor];
        view2.layer.shadowOffset = CGSizeMake(0, 1);
        view2.layer.shadowRadius = 1.0f;
        view2.layer.shadowOpacity = 3.0f;
        
       
        
        //view 3
        view3=[[UIView alloc]initWithFrame:CGRectMake(0, view2.frame.origin.y+view2.frame.size.height+10,WIDTH_VIEW, 30)];
        view3_btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        view3_btn1.frame=CGRectMake(0, 0, 30, 30);
        [view3_btn1 setBackgroundImage:[self imageWithImage:[UIImage imageNamed:@"like.png"] scaledToSize:CGSizeMake(30, 30)] forState:UIControlStateNormal];
        view3_lbl1=[[UILabel alloc]initWithFrame:CGRectMake(view3_btn1.frame.origin.x+view3_btn1.frame.size.width+5, view3_btn1.frame.origin.y, WIDTH_VIEW-75, HEIGHT_BUTTON_SMALL)];
        //[view_lbl1 setBackgroundColor:[UIColor colorWithRed:251.f/255 green:244.f/255 blue:231.f/255 alpha:1]];
        view3_lbl1.text=@"Image City in Midnight";
        view3_lbl1.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:15];
        view3_lbl1.textColor=[UIColor colorWithRed:51.f/255 green:153.f/255 blue:255.f/255 alpha:1];
        view3_btn2=[UIButton buttonWithType:UIButtonTypeCustom];
        view3_btn2.frame=CGRectMake(view3_lbl1.frame.size.width+view3_lbl1.frame.origin.x, view3_btn1.frame.origin.y, 30, 20);
        [view3_btn2 setBackgroundImage:[self imageWithImage:[UIImage imageNamed:@"more.png"] scaledToSize:CGSizeMake(30, 20)] forState:UIControlStateNormal];
        [view3 addSubview:view3_btn1];
        [view3 addSubview:view3_lbl1];
        [view3 addSubview:view3_btn2];
        
        
        //view 4
        view4_view1=[[BIDViewOne alloc]init];
        view4_view1.sizeImage=(float)290/3;
        view4=[[UIView alloc]initWithFrame:CGRectMake(view2.frame.origin.x, view3.frame.origin.y+view3.frame.size.height+10, view4_view1.sizeImage*3, view4_view1.sizeImage)];
       
        view4_view1.Image1.frame=CGRectMake(0, 0, view4_view1.sizeImage,view4_view1.sizeImage);
        view4_view1.Image2.frame=CGRectMake(view4_view1.Image1.frame.size.width, 0, view4_view1.sizeImage, view4_view1.sizeImage);
        view4_view1.Image3.frame=CGRectMake(view4_view1.Image2.frame.origin.x+view4_view1.Image2.frame.size.width, 0, view4_view1.sizeImage, view4_view1.sizeImage);
        NSLog(@"%f,%f,%f",view4_view1.Image1.frame.size.width,view4_view1.Image2.frame.size.width,view4_view1.Image3.frame.size.width);
        view4_view1.btn1.frame=CGRectMake(0, 0, 0, 0);
        view4_view1.Image1.image=[UIImage imageNamed:@"city2.jpg"];
        view4_view1.Image2.image=[UIImage imageNamed:@"city1.jpg"];
        view4_view1.Image3.image=[UIImage imageNamed:@"city3.jpg"];
        [view4 addSubview:view4_view1];
        view4.layer.borderWidth=1;
        view4.layer.borderColor=[[UIColor lightGrayColor]CGColor];
        
        
        //view 5
        view5=[[UIView alloc]initWithFrame:CGRectMake(0, view4.frame.origin.y+view4.frame.size.height+10, WIDTH_VIEW, 30)];
        view5_btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        view5_btn1.frame=CGRectMake(0, 0, 30, 30);
        [view5_btn1 setBackgroundImage:[self imageWithImage:[UIImage imageNamed:@"location.png"] scaledToSize:CGSizeMake(30, 30)] forState:UIControlStateNormal];
        view5_lbl1=[[UILabel alloc]initWithFrame:CGRectMake(view5_btn1.frame.size.width+5, 0, 200, 30)];
        view5_lbl1.text=@"Image was liked!";
        view5_lbl1.textColor=[UIColor colorWithRed:51.f/255 green:153.f/255 blue:255.f/255 alpha:1];
        view5_lbl1.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:15];
        view5.layer.cornerRadius=7;
        view5.clipsToBounds=YES;
        
       
        
        [view5 addSubview:view5_btn1];
        [view5 addSubview:view5_lbl1];
        
        
        [self addSubview:view];
        [self addSubview:btn];
        [self addSubview:view1];
        [self addSubview:view2];
        [self addSubview:view3];
        [self addSubview:view4];
        [self addSubview:view5];
               

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
