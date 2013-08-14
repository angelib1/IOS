//
//  BIDViewTwo.h
//  Exersice11
//
//  Created by Nguyen Thanh Son on 8/14/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDViewThreeController.h"
#import "BIDViewController.h"

@interface BIDViewTwo : UIViewController<UITextFieldDelegate,DelegateTag,DelegateInfo>
@property (nonatomic, strong) UITextView *txtView;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UITextField *txtSearch;
@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic, strong) UIView *viewScreen;
-(IBAction)backClick:(id)sender;
-(IBAction)nextClick:(id)sender;
-(IBAction)uploadClick:(id)sender;
@end
