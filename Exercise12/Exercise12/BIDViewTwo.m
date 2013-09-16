//
//  BIDViewTwo.m
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewTwo.h"
#import <QuartzCore/QuartzCore.h>
#define HEIGHT_VIEW 150
#define WIDTH_VIEW 320
#define HEIGHT_BUTTON_BIG 40
#define HEIGHT_BUTTON_SMALL 30
#define HEIGHT_BUTTON_SMALLER 20
@implementation BIDViewTwo
@synthesize btn1,btn,Image1,lbl1,lbl2,lbl3,lbl4,lbl5,btn2,btn3;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIFont *font1=[UIFont fontWithName:@"HelveticaNeue" size:20];
        UIFont *font2=[UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_BUTTON_BIG);
        [btn1 setTitle:@"Upcoming Schedule" forState:UIControlStateNormal];
        btn1.titleLabel.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:20];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn1 setBackgroundColor:[UIColor whiteColor]];
        btn1.layer.borderWidth=1;
        btn1.layer.borderColor=[[UIColor lightGrayColor]CGColor];
        
        btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(WIDTH_VIEW-30-5, (HEIGHT_BUTTON_BIG-20)/2, 30, 20);
        [btn setBackgroundImage:[self imageWithImage:[UIImage imageNamed:@"info.png"] scaledToSize:CGSizeMake(30, 20)] forState:UIControlStateNormal];
        
        Image1=[[UIImageView alloc]initWithFrame:CGRectMake(0, btn1.frame.size.height, 100, 80)];
        Image1.image=[self imageWithImage:[UIImage imageNamed:@"image4.jpg"] scaledToSize:CGSizeMake(100, 80)];
        
        NSDate *now=[NSDate date];
        NSCalendar *calender=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        NSUInteger date=NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMM"];
        NSDateComponents *component=[calender components:date fromDate:now];
    
        lbl1=[[UILabel alloc]initWithFrame:CGRectMake(0, btn1.frame.size.height, Image1.frame.size.width/2, Image1.frame.size.height/2-10)];
        lbl1.text=[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:now]];
        lbl1.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:25];
        lbl1.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
        lbl1.textColor=[UIColor whiteColor];
        lbl1.textAlignment=NSTextAlignmentCenter;
        
        lbl2=[[UILabel alloc]initWithFrame:CGRectMake(0, lbl1.frame.origin.y+lbl1.frame.size.height, Image1.frame.size.width/2, Image1.frame.size.height/2+10)];
        lbl2.text=[NSString stringWithFormat:@"%d",[component day]];
        lbl2.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:40];
        lbl2.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
        lbl2.textColor=[UIColor whiteColor];
        lbl2.textAlignment=NSTextAlignmentCenter;
        
        lbl3=[[UILabel alloc]initWithFrame:CGRectMake(Image1.frame.size.width+5, btn1.frame.size.height, HEIGHT_VIEW, HEIGHT_BUTTON_BIG)];
        lbl3.text=@"Morning Ocean";
        lbl3.font=font1;
        //lbl1.backgroundColor=[UIColor colorWithRed:a green:b blue:c alpha:1];
        
        lbl4=[[UILabel alloc]initWithFrame:CGRectMake(lbl3.frame.origin.x, lbl3.frame.origin.y+lbl3.frame.size.height, HEIGHT_VIEW, HEIGHT_BUTTON_SMALLER)];
        lbl4.text=[NSString stringWithFormat:@"%d-%d-%d %d:%d",[component day],[component month],[component year],[component hour],[component minute]];
        lbl4.font=font2;
        //lbl2.backgroundColor=[UIColor colorWithRed:a green:b blue:c alpha:1];
        
        lbl5=[[UILabel alloc]initWithFrame:CGRectMake(lbl3.frame.origin.x, lbl4.frame.origin.y+lbl4.frame.size.height, HEIGHT_VIEW, HEIGHT_BUTTON_SMALLER)];
        lbl5.text=@"Ha Noi, Viet Nam";
        lbl5.font=font2;
        //lbl3.backgroundColor=[UIColor colorWithRed:a green:b blue:c alpha:1];
        
        btn2=[UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame=CGRectMake(lbl3.frame.origin.x+lbl3.frame.size.width+5, lbl3.frame.origin.y+10, 50, HEIGHT_BUTTON_SMALL);
        [btn2 setTitle:@"View" forState:UIControlStateNormal];
        btn2.titleLabel.textColor=[UIColor whiteColor];
        btn2.titleLabel.font=[UIFont fontWithName:@"HelveticaNeue" size:17];
        [btn2 setBackgroundColor:[UIColor colorWithRed:51.f/255 green:153.f/255 blue:255.f/255 alpha:1]];
        btn2.layer.borderWidth=1;
        btn2.layer.borderColor=[[UIColor whiteColor]CGColor];
        btn2.clipsToBounds=YES;
        btn2.layer.cornerRadius=5;
        
        btn3=[UIButton buttonWithType:UIButtonTypeCustom];
        btn3.frame=CGRectMake(0, Image1.frame.origin.y+Image1.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_BUTTON_SMALL);
        btn3.titleLabel.font=font2;
         
        [btn3 setTitle:@"view more" forState:UIControlStateNormal];
        [btn3 setTitleColor:[UIColor colorWithRed:51.f/255 green:153.f/255 blue:255.f/255 alpha:1] forState:UIControlStateNormal];
        btn3.layer.borderWidth=1;
        btn3.layer.borderColor=[[UIColor lightGrayColor]CGColor];
        
       
        self.backgroundColor=[UIColor whiteColor];
        [self addSubview:btn1];
        [self addSubview:btn];
        [self addSubview:Image1];
        [self addSubview:lbl1];
        [self addSubview:lbl2];
        [self addSubview:lbl3];
        [self addSubview:lbl4];
        [self addSubview:lbl5];
        [self addSubview:btn2];
        [self addSubview:btn3];

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
