//
//  BIDViewTwo.m
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewTwo.h"
#import <QuartzCore/QuartzCore.h>
@implementation BIDViewTwo
@synthesize btn1,Image1,lbl1,lbl2,lbl3,btn2;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        float a=254.f/255;
        float b=213.f/255;
        float c=240.f/255;
        
        UIFont *font1=[UIFont fontWithName:@"Helvetica" size:20];
        UIFont *font2=[UIFont fontWithName:@"Helvetica" size:14];
        btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width-10, 30);
        [btn1 setTitle:@"Upcoming Schedule" forState:UIControlStateNormal];
        btn1.titleLabel.textColor=[UIColor whiteColor];
        [btn1 setBackgroundColor:[UIColor colorWithRed:147.f/255 green:107.f/255 blue:170.f/255 alpha:1]];
        btn1.layer.borderWidth=1;
        btn1.layer.borderColor=[[UIColor whiteColor]CGColor];
        
        
        Image1=[[UIImageView alloc]initWithFrame:CGRectMake(0, btn1.frame.size.height, 100, 100)];
        Image1.image=[self imageWithImage:[UIImage imageNamed:@"image4.jpg"] scaledToSize:CGSizeMake(100, 100)];
        
        NSDate *now=[NSDate date];
        NSCalendar *calender=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        NSUInteger date=NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit;
        NSDateComponents *component=[calender components:date fromDate:now];
    
        lbl1=[[UILabel alloc]initWithFrame:CGRectMake(105, btn1.frame.size.height, 150, 40)];
        lbl1.text=@"Morning Ocean";
        lbl1.font=font1;
        lbl1.backgroundColor=[UIColor colorWithRed:a green:b blue:c alpha:1];
        
        lbl2=[[UILabel alloc]initWithFrame:CGRectMake(105, btn1.frame.size.height+40, 150, 20)];
        lbl2.text=[NSString stringWithFormat:@"%d-%d-%d %d:%d",[component day],[component month],[component year],[component hour],[component minute]];
        lbl2.font=font2;
        lbl2.backgroundColor=[UIColor colorWithRed:a green:b blue:c alpha:1];
        
        lbl3=[[UILabel alloc]initWithFrame:CGRectMake(105, btn1.frame.size.height+60, 150, 20)];
        lbl3.text=@"Ha Noi, Viet Nam";
        lbl3.font=font2;
        lbl3.backgroundColor=[UIColor colorWithRed:a green:b blue:c alpha:1];
        
        btn2=[UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame=CGRectMake(265, btn1.frame.size.height+10, 40, 30);
        [btn2 setTitle:@"View" forState:UIControlStateNormal];
        btn2.titleLabel.textColor=[UIColor whiteColor];
        [btn2 setBackgroundColor:[UIColor colorWithRed:51.f/255 green:153.f/255 blue:255.f/255 alpha:1]];
        btn2.layer.borderWidth=1;
        btn2.layer.borderColor=[[UIColor whiteColor]CGColor];
        
        [self setBackgroundColor:[UIColor colorWithRed:a green:b blue:c alpha:1]];
        
        [self addSubview:btn1];
        [self addSubview:Image1];
        [self addSubview:lbl1];
        [self addSubview:lbl2];
        [self addSubview:lbl3];
        [self addSubview:btn2];

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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
