//
//  BIDViewController.h
//  Exersice11
//
//  Created by Nguyen Thanh Son on 7/31/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *computer;
@property (nonatomic, strong) UIView *viewScreen;
@property (nonatomic, strong) UITabBar *tabBar;
@property (nonatomic, strong) UINavigationBar *navigationBar;
@property (nonatomic, strong) UITextField *txtSearch;
@property (nonatomic, strong) UIButton *btnAdd;
-(IBAction)skipClick:(id)sender;
-(IBAction)backClick:(id)sender;
-(IBAction)hideKeybroad:(id)sender;
@end
