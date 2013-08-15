//
//  BIDAppDelegate.h
//  Exersice11
//
//  Created by Nguyen Thanh Son on 7/31/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import <UIKit/UIKit.h>


@class BIDViewController;

@interface BIDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *naviController;
@property (strong, nonatomic) BIDViewController *viewController;


@end
