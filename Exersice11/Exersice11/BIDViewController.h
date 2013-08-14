//
//  BIDViewController.h
//  Exersice11
//
//  Created by Nguyen Thanh Son on 7/31/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DelegateInfo <NSObject>
-(void)info:(NSMutableArray *)arrayInfo;
@end
@interface BIDViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *computer;
@property (nonatomic, strong) UIView *viewScreen;
@property (nonatomic, strong) UINavigationBar *navigationBar;
@property (nonatomic, strong) UITextField *txtSearch;
@property (nonatomic, strong) UIButton *btnAdd;
@property (nonatomic, strong) id<DelegateInfo> delegateInfo;
-(IBAction)skipClick:(id)sender;
-(IBAction)backClick:(id)sender;
-(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
@end
