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
    // TODO Navigation
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    BjitNavigatorRoot *navigator = [[BjitNavigatorRoot alloc] init];
    self.window.rootViewController = navigator;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // TODO Navigate
    // TODO Handle application cycle
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // TODO Navigate
    // TODO Handle application cycle
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
