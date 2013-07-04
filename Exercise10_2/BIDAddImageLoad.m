//
//  BIDAddImageLoad.m
//  Exercise10_2
//
//  Created by Nguyen Thanh Son on 6/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDAddImageLoad.h"
#import "BIDProgressLoading.h"
BIDProgressLoading *progressLoading;
@implementation BIDAddImageLoad
@synthesize arrayImage,imageload,delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        arrayImage=[[NSArray alloc]initWithObjects:[UIImage imageNamed:@"p1.png"], [UIImage imageNamed:@"p2.png"],[UIImage imageNamed:@"p3.png"],[UIImage imageNamed:@"p4.png"],[UIImage imageNamed:@"p5.png"],[UIImage imageNamed:@"p6.png"],nil];
        imageload=[[UIImageView alloc]init];
        progressLoading=[[BIDProgressLoading alloc]init];
        progressLoading.delegate=self;
    }
    return self;
}
-(IBAction)loadImage:(id)sender{
    imageload.frame=CGRectMake(120, 100, 80, 69);
    progressLoading.myURL=[NSURL URLWithString:@"http://www.dailyscreens.com/wp-content/uploads/2013/01/nature-wallpaper-backgrounds.jpg"];
    [progressLoading load:sender];
}
-(void)loadPercenReceive:(float)percen{
    float b=percen*5;
    int a=(int)roundf(b);
    imageload.image=arrayImage[a];
}
-(void)downloadedImage:(UIImage *)image{
    imageload.image=nil;
    [delegate imagefinish:image];
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
