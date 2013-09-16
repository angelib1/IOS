//
//  BIDViewFive.h
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewFive : UIView<UIScrollViewDelegate>
@property (nonatomic, strong) UIView *view;


@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIImageView *view1_Image1;
@property (nonatomic, strong) UILabel *view1_lbl1;

@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIImageView *view2_Image1;
@property (nonatomic, strong) UIButton *view2_btn1;
@property (nonatomic, strong) UIButton *view2_btn2;

@property (nonatomic, strong) UIView *view3;
@property (nonatomic, strong) UIButton *view3_btn1;
@property (nonatomic, strong) UILabel *view3_lbl1;
@property (nonatomic, strong) UIButton *view3_btn2;

@property (nonatomic, strong) UIView *view4;

@property (nonatomic, strong) UIView *view5;
@property (nonatomic, strong) UIButton *view5_btn1;
@property (nonatomic, strong) UILabel *view5_lbl1;
@end
