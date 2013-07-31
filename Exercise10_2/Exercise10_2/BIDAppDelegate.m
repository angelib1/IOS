//
//  BIDAppDelegate.m
//  Exercise10_2
//
//  Created by Nguyen Thanh Son on 6/10/13.
//  Copyright (c) 2013 Nguyen Thanh Son. All rights reserved.
//

#import "BIDAppDelegate.h"

#import "BIDViewController.h"

@implementation BIDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[BIDViewController alloc] initWithNibName:@"BIDViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    UILocalNotification *localNoti=[launchOptions objectForKey:UIApplicationLaunchOptionsAnnotationKey];
    if(localNoti){
        //thong bao
    }
    else{
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    __block UIBackgroundTaskIdentifier bgTask;
    bgTask = [application beginBackgroundTaskWithExpirationHandler:^{
        [application endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }];
    
    UILocalNotification *localfi=[[UILocalNotification alloc]init];
    //Hien thi Notification sau 1 phut vao Background
    //    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:[NSDate date]];
    //    NSInteger day=[components day];
    //    NSInteger month=[components month];
    //    NSInteger year=[components year];
    //    NSInteger currentHour = [components hour];
    //    NSInteger currentMinute = [components minute]+1;
    //    NSInteger currentSecond = [components second];
    //    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    //    [dateFormat setDateFormat:@"dd/MM/yyyy hh:mm:ss aa"];
    //NSString *dateNotifi=[NSString stringWithFormat:@"%d/%d/%d %d:%d:%d AM",day,month,year,currentHour,currentMinute,currentSecond];
     //NSDate *dateOne=[dateFormat dateFromString:dateNotifi];
    //localfi.fireDate=dateOne;
   
    
    //Hien thi sau 1 khoang thoi gian sau khi vao BackGround
    NSTimeInterval timeInterval=10;
    localfi.fireDate=[[NSDate date] dateByAddingTimeInterval:timeInterval];
    localfi.alertBody=@"This is a Notification";
    localfi.alertAction=@"Notification";
    localfi.soundName=@"sound.mp3";
    [[UIApplication sharedApplication] scheduleLocalNotification:localfi];
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
