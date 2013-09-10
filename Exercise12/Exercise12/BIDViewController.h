//
//  BIDViewController.h
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *arrayView1;
@property (nonatomic, strong) NSMutableArray *arrayView2;
@property (nonatomic, strong) NSMutableArray *arrayView3;
@property (nonatomic, strong) NSMutableArray *arrayView4;
-(void)changeViewRoll:(NSMutableArray *)arrayView ;
-(void)changeViewDrop:(NSMutableArray *)arrayView ;
-(void)menuClick;
-(void)settingClick;
-(void)view1_Click;
-(void)view2_Click;
-(void)view3_Click;
-(void)view4_Click;
-(void)view5_Click;
@end
