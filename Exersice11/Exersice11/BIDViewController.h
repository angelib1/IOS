//
//  BIDViewController.h
//  Exersice11
//
//  Created by Nguyen Thanh Son on 7/31/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController<UITabBarDelegate,UITabBarControllerDelegate,UINavigationBarDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UITabBar *tabBar;
@property (nonatomic, strong) UINavigationBar *navigationBar;
@property (nonatomic, strong) UISearchBar *seachBar;
-(IBAction)skipClick:(id)sender;
-(IBAction)backClick:(id)sender;
@end
