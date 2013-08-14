//
//  BIDSecondTableViewController.h
//  Exersice11
//
//  Created by Nguyen Thanh Son on 8/14/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChoiceItemDelegate <NSObject>
-(void)itemChoice:(NSString *)itemchoice;
@end
@interface BIDSecondTableViewController: UITableViewController<UITableViewDataSource,UITabBarDelegate>
@property (nonatomic,strong) NSMutableArray *item;
@property (nonatomic, retain) id<ChoiceItemDelegate> itemDelegate;
@end