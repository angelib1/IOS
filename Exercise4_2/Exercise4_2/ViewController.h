//
//  ViewController.h
//  Exercise4_2
//
//  Created by Nguyen Thanh Son on 5/7/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
@property (copy,nonatomic) NSArray *computer;
@end
