//
//  BIDAddImageLoad.h
//  Exercise10_2
//
//  Created by Nguyen Thanh Son on 6/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDProgressLoading.h"
@protocol DownloadFinish<NSObject>
-(void)imagefinish:(UIImage *)image;
@end

@interface BIDAddImageLoad : UIView<ProgressLoadingDelegate>
{
    id<DownloadFinish> delegate;
}
@property (nonatomic,retain) id<DownloadFinish> delegate;
@property (nonatomic,strong) IBOutlet UIImageView *imageload;
@property (nonatomic,strong) NSArray *arrayImage;
-(IBAction)loadImage:(id)sender;
@end
