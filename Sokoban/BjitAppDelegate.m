//
//  BjitAppDelegate.m
//  Sokoban
//
//  Created by USER on 2014/04/11.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitAppDelegate.h"
#import "BJItNavigatorRoot.h"
#import "BjitUtil.h"

@implementation BjitAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    BjitNavigatorRoot *navigator = [[BjitNavigatorRoot alloc] init];
    self.window.rootViewController = navigator;
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
