//
//  BIDViewThree.m
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewThree.h"
#import <QuartzCore/QuartzCore.h>

@implementation BIDViewThree
@synthesize btn1,TextView1,lbl1,Image1,Image2,btn2;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIFont *font1=[UIFont fontWithName:@"Helvetica" size:17];
        UIFont *font2=[UIFont fontWithName:@"Helvetica" size:12];
        // Initialization code
        btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame=CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width-10, 30);
        [btn1 setTitle:@"Temple Challenge!" forState:UIControlStateNormal];
        btn1.titleLabel.textColor=[UIColor whiteColor];
        [btn1 setBackgroundColor:[UIColor orangeColor]];
        [self setBackgroundColor:[UIColor whiteColor]];
        btn1.layer.borderWidth=1;
        btn1.layer.borderColor=[[UIColor whiteColor]CGColor];
        
        TextView1=[[UITextView alloc]initWithFrame:CGRectMake(0, btn1.frame.size.height, 130, 80)];
        TextView1.text=@"Take picture temple nearby";
        TextView1.font=font1;
        TextView1.textColor=[UIColor whiteColor];
        [TextView1 setBackgroundColor:[UIColor colorWithRed:255.f/255 green:153.f/255 blue:5.f/255 alpha:1]];
        TextView1.editable=NO;
        
        
        lbl1=[[UILabel alloc]initWithFrame:CGRectMake(0, btn1.frame.size.height+80, 130, 20)];
        lbl1.text=@"Ends on 14-10-2013";
        lbl1.font=font2;
        lbl1.textColor=[UIColor whiteColor];
        [lbl1 setBackgroundColor:[UIColor colorWithRed:255.f/255 green:153.f/255 blue:5.f/255 alpha:1]];
        
        Image1=[[UIImageView alloc]initWithFrame:CGRectMake(130, btn1.frame.size.height, 90, 90)];
        Image1.image=[self imageWithImage:[UIImage imageNamed:@"img.jpg"] scaledToSize:CGSizeMake(90, 90)];
        
        Image2=[[UIImageView alloc]initWithFrame:CGRectMake(220, btn1.frame.size.height, 90, 90)];
        Image2.image=[self imageWithImage:[UIImage imageNamed:@"icon.JPG"] scaledToSize:CGSizeMake(90, 90)];
        
        btn2=[UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame=CGRectMake(150, 100,135, 30);
        [btn2 setTitle:@"Take challenge" forState:UIControlStateNormal];
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
