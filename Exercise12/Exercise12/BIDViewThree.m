//
//  BIDViewThree.m
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewThree.h"
#import <QuartzCore/QuartzCore.h>
#define HEIGHT_VIEW 150
#define WIDTH_VIEW 320
#define WIDTH_IMAGE 100
#define WIDTH_TEXT 120
#define HEIGHT_BUTTON_BIG 40
#define HEIGHT_BUTTON_SMALL 30
#define HEIGHT_BUTTON_SMALLER 20
@implementation BIDViewThree
@synthesize btn1,TextView1,lbl1,Image1,Image2,btn2;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIFont *font2=[UIFont fontWithName:@"HelveticaNeue-Light" size:12];
        // Initialization code
        btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, HEIGHT_BUTTON_BIG);
        [btn1 setTitle:@"Temple Challenge!" forState:UIControlStateNormal];
        btn1.titleLabel.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:20];
        btn1.titleLabel.textColor=[UIColor whiteColor];
        [btn1 setBackgroundColor:[UIColor orangeColor]];
        btn1.layer.borderWidth=1;
        btn1.layer.borderColor=[[UIColor whiteColor]CGColor];
        
        TextView1=[[UITextView alloc]initWithFrame:CGRectMake(0, btn1.frame.size.height, WIDTH_TEXT, 80)];
        TextView1.text=@"Take picture temple nearby";
        TextView1.font=[UIFont fontWithName:@"HelveticaNeue" size:18];
        TextView1.textColor=[UIColor whiteColor];
        [TextView1 setBackgroundColor:[UIColor colorWithRed:255.f/255 green:153.f/255 blue:5.f/255 alpha:1]];
        TextView1.editable=NO;
        TextView1.scrollsToTop=NO;
        
        
        lbl1=[[UILabel alloc]initWithFrame:CGRectMake(0, TextView1.frame.origin.y+ TextView1.frame.size.height, WIDTH_TEXT, HEIGHT_BUTTON_SMALLER)];
        lbl1.text=@"Ends on 14-10-2013";
        lbl1.font=font2;
        lbl1.textColor=[UIColor whiteColor];
        [lbl1 setBackgroundColor:[UIColor colorWithRed:255.f/255 green:153.f/255 blue:5.f/255 alpha:1]];
        
        Image1=[[UIImageView alloc]initWithFrame:CGRectMake(TextView1.frame.size.width, TextView1.frame.origin.y, WIDTH_IMAGE, WIDTH_IMAGE)];
        Image1.image=[self imageWithImage:[UIImage imageNamed:@"img.jpg"] scaledToSize:CGSizeMake(WIDTH_IMAGE, WIDTH_IMAGE)];
        Image1.layer.borderWidth=1;
        Image1.layer.borderColor=[[UIColor whiteColor]CGColor];
        
        Image2=[[UIImageView alloc]initWithFrame:CGRectMake(Image1.frame.origin.x+Image1.frame.size.width, Image1.frame.origin.y, WIDTH_IMAGE, WIDTH_IMAGE)];
        Image2.image=[self imageWithImage:[UIImage imageNamed:@"icon.JPG"] scaledToSize:CGSizeMake(WIDTH_IMAGE,WIDTH_IMAGE)];
        Image2.layer.borderWidth=1;
        Image2.layer.borderColor=[[UIColor whiteColor]CGColor];
        
        btn2=[UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame=CGRectMake(Image1.frame.origin.x+(2*WIDTH_IMAGE-150)/2, HEIGHT_VIEW-HEIGHT_BUTTON_BIG-5,150, HEIGHT_BUTTON_BIG);
        [btn2 setTitle:@"Take challenge" forState:UIControlStateNormal];
        btn2.titleLabel.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:20];
        btn2.layer.borderWidth=1;
        btn2.layer.borderColor=[[UIColor whiteColor]CGColor];
        btn2.titleLabel.textColor=[UIColor whiteColor];
        [btn2 setBackgroundColor:[UIColor colorWithRed:255.f/255 green:102.f/255 blue:0.f/255 alpha:1]];
        
        [self setBackgroundColor:[UIColor colorWithRed:255.f/255 green:153.f/255 blue:0.f/255 alpha:1]];
        [self addSubview:btn1];
        [self addSubview:TextView1];
        [self addSubview:lbl1];
        [self addSubview:Image1];
        [self addSubview:Image2];
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
