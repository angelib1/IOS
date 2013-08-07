//
//  BIDFirstTableController.h
//  Exercise11_1
//
//  Created by Nguyen Thanh Son on 8/5/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TagDelegate <NSObject>
-(void)tag:(int)Tag;
@end
@interface BIDFirstTableController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *item;
@property (strong, nonatomic) UIButton *Button;
@property (strong, nonatomic) NSMutableArray *arrayButton;
@property (nonatomic, retain) id<TagDelegate> tagDelegate;
-(IBAction)del:(id)sender;
@end
