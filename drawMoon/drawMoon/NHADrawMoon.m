//
//  NHADrawMoon.m
//  drawMoon
//
//  Created by Nguyễn Hữu Anh on 8/28/13.
//  Copyright (c) 2013 anhnh. All rights reserved.
//

#import "NHADrawMoon.h"
#import <math.h>
@implementation NHADrawMoon
float d;
- (id)initWithFrame:(CGRect)frame andRadius: (float)r option: (float)option andPhase: (float)phase
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.r=r;
        self.option=option;
        self.phase=phase;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"draw");
    // Drawing code
    float xcenter=160;
    float ycenter=150;
    [super drawRect:rect];
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    
    
    if (self.option>1||self.option<0) {
        UIAlertView *al=[[UIAlertView alloc]initWithTitle:@"Lỗi!" message:@"Nhập option từ 0 đến 1" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [al show];
    }else{
    CGContextAddArc(context, xcenter, ycenter, self.r, 0.5*M_PI-self.phase , 1.5*M_PI-self.phase, 0);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    float d=self.r*(0.5-self.option)*2;
    float l=4*tan(M_PI/8)/3;
    CGContextAddCurveToPoint(context, xcenter-d*l, ycenter-self.r, xcenter-d, ycenter-self.r*l, xcenter-d, ycenter);
    CGContextAddCurveToPoint(context, xcenter-d, ycenter+self.r*l, xcenter-d*l, ycenter+self.r, xcenter, ycenter+self.r);
    CGContextFillPath(context);

    CGContextStrokePath(context);
    }

}
@end
