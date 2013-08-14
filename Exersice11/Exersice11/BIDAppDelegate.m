//
//  BIDAppDelegate.m
//  Exersice11
//
//  Created by Nguyen Thanh Son on 7/31/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDAppDelegate.h"

#import "BIDViewController.h"

@implementation BIDAppDelegate
@synthesize naviController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Create UINavigation Controller
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[BIDViewController alloc] initWithNibName:@"BIDViewController" bundle:nil];
    naviController=[[UINavigationController alloc]initWithRootViewController:self.viewController];
    [naviController.navigationBar setTintColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [self.window addSubview:[naviController view]];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
