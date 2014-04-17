//
//  BjitProtocolNavigator.h
//  Sokoban
//
//  Created by USER on 2014/04/17.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BjitProtocolNavigator <NSObject>

@optional
- (void)showController:(NSInteger) controllerId;

@required

@end
