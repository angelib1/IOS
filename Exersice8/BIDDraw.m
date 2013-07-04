//
//  BIDDraw.m
//  Exersice8
//
//  Created by Nguyen Thanh Son on 5/22/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDDraw.h"

@implementation BIDDraw

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (UIColor *) getRandomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    float xcenter=160;
    float ycenter=150;
    float radius=100;
    [super drawRect:rect];
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
        //draw hinh tron
    CGContextSetStrokeColorWithColor(context, [self getRandomColor].CGColor);
    CGContextAddArc(context, xcenter, ycenter, radius, 0, 2*M_PI, 1);
    CGContextStrokePath(context);
    
    //draw tam hinh tron
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, xcenter-20*cos(M_PI/4) , ycenter-20*cos(M_PI/4));
    CGContextAddLineToPoint(context, xcenter+20*cos(M_PI/4), ycenter+20*cos(M_PI/4));
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, xcenter+20*cos(M_PI/4) , ycenter-20*cos(M_PI/4));
    CGContextAddLineToPoint(context, xcenter-20*cos(M_PI/4), ycenter+20*cos(M_PI/4));
    CGContextStrokePath(context);
    CGFloat dashArr[]={1,2,1,2,4,1,4,2,10,5,10,5,20,3,20,3};
    
    //ve 4 duong thang xuat phat tu tam
    for(int i=1;i<=4;i++)
    {
        CGContextSetStrokeColorWithColor(context, [self getRandomColor].CGColor);
        CGContextMoveToPoint(context, xcenter , ycenter);
        CGContextSetLineDash(context,0, dashArr, 4*i);
        CGContextAddLineToPoint(context, xcenter+radius*cos(i*M_PI/2), ycenter+radius*sin(i*M_PI/2));
        CGContextStrokePath(context);
    }
    
}

@end
