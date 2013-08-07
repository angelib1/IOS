//
//  BIDSecondTableController.h
//  Exercise11_1
//
//  Created by Nguyen Thanh Son on 8/5/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChoiceItemDelegate <NSObject>
-(void)itemChoice:(NSString *)itemchoice;
@end
@interface BIDSecondTableController : UITableViewController<UITableViewDataSource,UITabBarDelegate>
@property (nonatomic,strong) NSMutableArray *item;
@property (nonatomic, retain) id<ChoiceItemDelegate> itemDelegate;
@end
