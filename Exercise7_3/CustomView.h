//
//  CustomView.h
//  Exercise7_3
//
//  Created by Nguyen Thanh Son on 5/14/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface CustomView : UIView
@property (strong,nonatomic) IBOutlet NSMutableAttributedString *attributedString;
@property (strong,nonatomic) UIImageView *image;
@property (strong,nonatomic) UIImageView *imagelarge;
@property (strong,nonatomic) NSString *aaa;
@property  float xpos;
@property float ypos;
@property float a;
@end
