//
//  BIDAddTableViewController.h
//  Exercise12
//
//  Created by Nguyen Thanh Son on 9/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDAddTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, copy) NSArray *item;
@end
