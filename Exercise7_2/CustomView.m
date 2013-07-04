//
//  CustomView.m
//  Exercise7_2
//
//  Created by Nguyen Thanh Son on 5/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
@synthesize attribute;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
           }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGMutablePathRef path=CGPathCreateMutable();
    //tao khung text xuat hien theo hinh eclipse
    // CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 0, self.bounds.size.width, 200));
    //tao khung text xuat hien nhu hinh chu nhat
    CGPathAddRect(path, NULL, CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height));
    CTFramesetterRef framesetter=CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attribute);
    CTFrameRef frameRef=CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [attribute length]), path, NULL);
    CFRelease(framesetter);
    CFRelease(path);
    
   
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    //dich chuyen truc toa do
    CGContextTranslateCTM(context, 0  ,self.bounds.size.height);
    //dao truc Oy va giu nguyen truc Ox
    CGContextScaleCTM(context, 1, -1);
//
//    CTLineRef line=CTLineCreateWithAttributedString((CFAttributedStringRef)attribute);
    //CGContextSetTextPosition(context, 20, 0);
//    CTLineDraw(line, context);
//    CFRelease(line);
    CTFrameDraw(frameRef, context);
   
    CFRelease(frameRef);
    
}


@end
