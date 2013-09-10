//
//  BIDViewOne.m
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewOne.h"
#import <QuartzCore/QuartzCore.h>

@implementation BIDViewOne
@synthesize Image1,Image2,Image3,btn1;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
        Image1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        Image1.image=[self imageWithImage:[UIImage imageNamed:@"image1.png"] scaledToSize:CGSizeMake(100, 100)];
        
        Image2=[[UIImageView alloc]initWithFrame:CGRectMake(105, 0, 100, 100)];
        Image2.image=[self imageWithImage:[UIImage imageNamed:@"image2.png"] scaledToSize:CGSizeMake(100, 100)];
        
        Image3=[[UIImageView alloc]initWithFrame:CGRectMake(210, 0, 100, 100)];
        Image3.image=[self imageWithImage:[UIImage imageNamed:@"image3.png"] scaledToSize:CGSizeMake(100, 100)];
        
        
        btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame=CGRectMake(80, 30,150, 30);
        btn1.layer.borderWidth=1;
        btn1.layer.borderColor=[[UIColor whiteColor]CGColor];
        [btn1 setTitle:@"nearby + collect" forState:UIControlStateNormal];
        [btn1 setBackgroundColor:[UIColor blackColor]];
        btn1.titleLabel.textColor=[UIColor whiteColor];
        [self setBackgroundColor:[UIColor whiteColor]];
        
        [self addSubview:Image1];
        [self addSubview:Image2];
        [self addSubview:Image3];
        [self addSubview:btn1];
    }
    return self;
}
//Ve lai anh theo kich thuoc lua chon
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
