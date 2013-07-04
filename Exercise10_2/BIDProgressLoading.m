//
//  BIDProgressLoading.m
//  Exercise10_2
//
//  Created by Nguyen Thanh Son on 6/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDProgressLoading.h"
long long totalFile,receiveFile;
@implementation BIDProgressLoading
@synthesize respondData,connection,myURL,imgUrl,delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    totalFile=response.expectedContentLength;
    respondData=[[NSMutableData alloc]init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    receiveFile+=[data length];
    [respondData appendData:data];
    float percen;
    percen=((float)receiveFile/(float)totalFile);
    NSLog(@"%f",percen);
    [delegate loadPercenReceive:percen];
    
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    imgUrl=[[UIImage alloc]initWithData:respondData];
    [delegate downloadedImage:imgUrl];
    receiveFile=0;
}
-(IBAction)load:(id)sender{
   
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
