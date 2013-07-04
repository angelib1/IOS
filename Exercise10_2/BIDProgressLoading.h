//
//  BIDProgressLoading.h
//  Exercise10_2
//
//  Created by Nguyen Thanh Son on 6/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ProgressLoadingDelegate <NSObject>
-(void)loadPercenReceive:(float)percen;
- (void) downloadedImage : (UIImage *)image;
@end

@interface BIDProgressLoading : UIView
<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    id<ProgressLoadingDelegate> delegate;
}
@property (nonatomic,strong) NSURL *myURL;
@property (nonatomic,strong) NSURLConnection *connection;
@property (nonatomic,strong) NSMutableData *respondData;
@property (nonatomic,strong) UIImage *imgUrl;
@property (nonatomic,retain) id<ProgressLoadingDelegate> delegate;

-(IBAction)load:(id)sender;
@end
