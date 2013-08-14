//
//  BIDFirstTableViewController.h
//  Exersice11
//
//  Created by Nguyen Thanh Son on 8/14/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FirstDelegate <NSObject>
-(void)first:(NSString *)string;
@end
@interface BIDFirstTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *item;
@property (strong, nonatomic) UIButton *Button;
@property (strong, nonatomic) NSMutableArray *arrayButton;
@property (nonatomic, retain) id<FirstDelegate> firstDelegate;
-(IBAction)del:(id)sender;
@end
