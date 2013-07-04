//
//  BIDAddImageLoad.h
//  Exercise10_1
//
//  Created by Nguyen Thanh Son on 6/7/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoadImageDelegate <NSObject>

- (void) downloadedImage : (UIImage *)image;

@end

@interface BIDAddImageLoad : UIView
<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    id<LoadImageDelegate> delegate;
}
@property (nonatomic,strong) NSURL *myURL;
@property (nonatomic,strong) UIImage *imgUrl;
@property (nonatomic,strong) IBOutlet UIImageView *imageload;
@property (nonatomic,strong) NSURLConnection *connection;
@property (nonatomic,strong) NSMutableData *respondData;
@property (nonatomic,strong) NSArray *arrayImage;
@property (retain, nonatomic) id<LoadImageDelegate> delegate;
-(IBAction)load:(id)sender;
@end
