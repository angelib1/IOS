//
//  BIDAddImageLoad.m
//  Exercise10_1
//
//  Created by Nguyen Thanh Son on 6/7/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDAddImageLoad.h"
#import "BIDViewController.h"
long long totalFile,receiveFile;
BIDViewController *control;
@implementation BIDAddImageLoad
@synthesize arrayImage,imageload,imgUrl,respondData,connection,myURL,delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
         arrayImage=[[NSArray alloc]initWithObjects:[UIImage imageNamed:@"p1.png"], [UIImage imageNamed:@"p2.png"],[UIImage imageNamed:@"p3.png"],[UIImage imageNamed:@"p4.png"],[UIImage imageNamed:@"p5.png"],[UIImage imageNamed:@"p6.png"],nil];
        imageload=[[UIImageView alloc]init];
        
        
    }
    return self;
}
//kich thuoc file
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    totalFile=response.expectedContentLength;
    respondData=[[NSMutableData alloc]init];
}

//kich thuoc da nhan duoc
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    receiveFile+=[data length];
    [respondData appendData:data];
    float percen;
    percen=((float)receiveFile/(float)totalFile)*5;
    int a=(int)roundf(percen);
    imageload.image=arrayImage[a];
    NSLog(@"%f",percen);
}

//ket thuc load
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    imageload.image=nil;
    imgUrl=[[UIImage alloc]initWithData:respondData];
    [delegate downloadedImage:imgUrl];
    receiveFile=0;
}

//tao connection
-(IBAction)load:(id)sender{
    imageload.frame=CGRectMake(120, 100, 80, 69);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:myURL
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:60];
    
    connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
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
