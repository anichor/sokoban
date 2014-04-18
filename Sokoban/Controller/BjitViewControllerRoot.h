//
//  BjitViewControllerRoot.h
//  Sokoban
//
//  Created by USER on 2014/04/15.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BjitProtocolAlert.h"
#import "BjitProtocolNavigator.h"

@interface BjitViewControllerRoot : UIViewController <UIAlertViewDelegate, BjitProtocolAlert>
{
@protected
@private
@public
}

@property (nonatomic, strong) NSMutableArray *button_ids;
@property (nonatomic, strong) UIAlertView* alert;
@property (nonatomic, strong) NSObject<BjitProtocolNavigator> *navigatorRoot;
@property (nonatomic, assign) NSInteger selfControllerIndex;

- (id)init:(NSObject<BjitProtocolNavigator> *)navigator;
- (void)showAlert:(NSString *)title :(NSString *)message :(NSMutableArray *)buttons :(NSMutableArray *)ids;
- (void)hideAlert;
- (void)setUserDefaults:(NSString *)userKey :(NSInteger)userValue;
- (NSInteger)getUserDefaults:(NSString *)userKey;
- (NSInteger)getGameIndex:(NSInteger)stepEnd;

@end