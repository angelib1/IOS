//
//  BIDViewThreeController.h
//  Exersice11
//
//  Created by Nguyen Thanh Son on 8/14/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDSecondTableViewController.h"
#import "BIDFirstTableViewController.h"
@protocol DelegateTag <NSObject>
-(void)transferData:(NSMutableArray *)arrayTag;
@end
@interface BIDViewThreeController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,ChoiceItemDelegate,FirstDelegate>
@property (nonatomic, strong) id<DelegateTag> delegateTag;
@property (nonatomic, strong) UITableView *tableViewList;
@property (nonatomic, strong) UITableView *tableViewChoice;
@property (nonatomic, strong) NSMutableArray *itemChoice;
@property (nonatomic, strong) NSMutableArray *itemDisplay;
@property (nonatomic, strong) NSMutableArray *computer;
@property (nonatomic, strong) UIView *viewScreen;
@property (nonatomic, strong) UITabBar *tabBar;
@property (nonatomic, strong) UINavigationBar *navigationBar;
@property (nonatomic, strong) UITextField *txtSearch;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIButton *btnAdd;
-(IBAction)nextClick:(id)sender;
-(IBAction)backClick:(id)sender;
-(IBAction)textChange:(id)sender;
-(IBAction)ChoiceItem:(id)sender;
-(void)changeView;
-(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
@end