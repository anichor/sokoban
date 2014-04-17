//
//  BjitNavigatorRoot.h
//  Sokoban
//
//  Created by USER on 2014/04/17.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BjitProtocolNavigator.h"

@class BjitViewControllerRoot;

@interface BjitNavigatorRoot : UINavigationController<BjitProtocolNavigator>

@property (nonatomic, weak) BjitViewControllerRoot *controller;

- (id)init:(NSInteger) controllerId;

@end
