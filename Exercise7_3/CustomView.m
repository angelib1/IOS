//
//  CustomView.m
//  Exercise7_3
//
//  Created by Nguyen Thanh Son on 5/14/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "CustomView.h"
#import "BIDViewController.h"
@implementation CustomView

@synthesize  attributedString;
@synthesize xpos;
@synthesize ypos;
@synthesize a;
@synthesize image;
@synthesize imagelarge;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // khoi tao cac image
        image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_notification_normal.png"]];
        imagelarge=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_notification_large.png"]];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    NSString *text=@"20 There are new notifications";
    
    //chia cac doan van trong file text.txt
    NSArray *array=[text componentsSeparatedByString:@" "];
    int i=0;
    NSString *test=nil;
    
    //tim xau la chu so
    while(array[i]!=nil)
    {
        NSScanner *scanner=[NSScanner scannerWithString:array[i]];
        [scanner scanCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:&test];
        if(test!=nil)
            break;
        else i++;
    }
    NSString *c2=@" ";
    NSString *c1;
    //noi dung xau truoc chu so
    NSArray *listItem = [text componentsSeparatedByString:array[i]];
    c1 = listItem[0];
    
    //khai bao font chu
    UIFont *font=[UIFont fontWithName:@"Palatino-Bold" size:17];
    UIFont *fontLarge=[UIFont fontWithName:@"Palatino-Bold" size:40];
    //kich thuoc xau truoc chu so
    CGSize size1=[c1 sizeWithFont:font];
    //kich thuoc dau cach large
    CGSize size2=[c2 sizeWithFont:fontLarge];
    //kich thuoc dau cach normal
    CGSize size3=[c2 sizeWithFont:font];
    //kich thuoc xau chu so
    CGSize size4=[array[i] sizeWithFont:font];
    //kich thuoc toan bo xau
    CGSize size5=[text sizeWithFont:font];
    
    //TextalignmentCenter
    NSMutableParagraphStyle *paragraphstyle = [[NSMutableParagraphStyle alloc] init];
	paragraphstyle.alignment = NSTextAlignmentCenter;
    
    //dictionary chua cac attribute
    NSDictionary *attributeDic=[NSDictionary dictionaryWithObjectsAndKeys:(id)(CTFontRef)font,kCTFontAttributeName , (id)[[UIColor blueColor]CGColor],kCTForegroundColorAttributeName, nil];
    NSDictionary *attributeDic1=[NSDictionary dictionaryWithObjectsAndKeys:(id)(CTFontRef)fontLarge,kCTFontAttributeName , (id)[[UIColor blueColor]CGColor],kCTForegroundColorAttributeName, nil];
    

    //gan cac attributedString
    attributedString=[[NSMutableAttributedString alloc]initWithString:text];
    [attributedString addAttributes:attributeDic range:NSMakeRange(0, [text length])];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphstyle range:NSMakeRange(0, [text length])];
    
    //khoang cach tu le toi xau
    a=((self.frame.size.width)-(size5.width-2*size3.width+2*size2.width))/2;
    //toa do x cua image
    xpos=size1.width+size2.width-size3.width-image.frame.size.width/2+size4.width/2;
    //toa do y cua image
    ypos=0;
    //so gom 1 chu so
    if([array[i] length]==1)
    {
        const char *text_copy=[text UTF8String];
         //so sanh dau doan, cuoi doan co dau cach hay khong
        if((text_copy[[c1 length]-1])==32)
        {
            [attributedString addAttributes:attributeDic1 range:NSMakeRange([c1 length]-1, 1)];
        }
         if((text_copy[[c1 length]+1])==32)
        {
            [attributedString addAttributes:attributeDic1 range:NSMakeRange([c1 length]+1, 1)];
        }
        imagelarge.hidden=true;
    }
    
    //so gom 2 cu so
    else    if([array[i] length]==2)
    {
        imagelarge.hidden=true;
    }
    
    //so gom 3 chu so
    else{
        image.hidden=true;
        //image.image=[UIImage imageNamed:@"icon_notification_large.png"];
    }
    
    //tao cac frame iamge
    image.frame=CGRectMake(xpos+a, ypos, image.frame.size.width, image.frame.size.height);
    imagelarge.frame=CGRectMake(xpos+a, ypos, imagelarge.frame.size.width, imagelarge.frame.size.height);    
    
    //tao khung ve text
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, self.frame.size.width ,100));
    CTFramesetterRef framesetter=CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);
    CTFrameRef frameRef=CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [text length]), path, NULL);
    CFRelease(framesetter);
    CFRelease(path);
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    
    //dich chuyen truc toa do
    if(size4.width<image.frame.size.width/2)
    {
        CGContextTranslateCTM(context, 0  ,100-size2.height/2);
    }
    else CGContextTranslateCTM(context, 0  ,100);
    
    //dao truc Oy va giu nguyen truc Ox
    CGContextScaleCTM(context, 1, -1);

    CTFrameDraw(frameRef, context);
    CFRelease(frameRef);

}

- (void)dealloc
{
    [image release];
    [imagelarge release];
    [super dealloc];
}
@end
