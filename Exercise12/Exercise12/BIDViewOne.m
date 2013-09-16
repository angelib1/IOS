//
//  BIDViewOne.m
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDViewOne.h"
#import <QuartzCore/QuartzCore.h>
#define HEIGHT_VIEW 106
#define HEIGHT_BUTTON 40
#define WIDTH_BUTTON 150

@implementation BIDViewOne
@synthesize Image1,Image2,Image3,btn1,sizeImage;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        sizeImage=HEIGHT_VIEW;
        Image1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, sizeImage,sizeImage)];
        Image1.image=[self imageWithImage:[UIImage imageNamed:@"image1.png"] scaledToSize:CGSizeMake(sizeImage, sizeImage)];
        Image1.layer.borderWidth=1;
        Image1.layer.borderColor=[[UIColor whiteColor]CGColor];
        
        Image2=[[UIImageView alloc]initWithFrame:CGRectMake(Image1.frame.size.width, 0, sizeImage, sizeImage)];
        Image2.image=[self imageWithImage:[UIImage imageNamed:@"image2.png"] scaledToSize:CGSizeMake(sizeImage, sizeImage)];
        Image2.layer.borderWidth=1;
        Image2.layer.borderColor=[[UIColor whiteColor]CGColor];

        
        Image3=[[UIImageView alloc]initWithFrame:CGRectMake(Image2.frame.origin.x+Image2.frame.size.width, 0, sizeImage, sizeImage)];
        Image3.image=[self imageWithImage:[UIImage imageNamed:@"image3.png"] scaledToSize:CGSizeMake(sizeImage, sizeImage)];
        Image3.layer.borderWidth=1;
        Image3.layer.borderColor=[[UIColor whiteColor]CGColor];

        
        
        btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame=CGRectMake((320-WIDTH_BUTTON)/2,HEIGHT_VIEW/2-HEIGHT_BUTTON/2,WIDTH_BUTTON, HEIGHT_BUTTON);
        btn1.layer.borderWidth=1;
        btn1.layer.borderColor=[[UIColor whiteColor]CGColor];
        [btn1 setTitle:@"nearby + collect" forState:UIControlStateNormal];
        btn1.titleLabel.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:20];
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
