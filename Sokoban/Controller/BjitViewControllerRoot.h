//
//  BjitViewControllerRoot.h
//  Sokoban
//
//  Created by USER on 2014/04/15.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BjitProtocolAlert <NSObject>

@optional
- (void)showAlert:(NSInteger) id;
- (void)hideAlert:(NSInteger) id;

@required

@end

@interface BjitViewControllerRoot : UIViewController <UIAlertViewDelegate, BjitProtocolAlert>
{
@protected
@private
@public
}

@property (nonatomic, strong) NSMutableArray *button_ids;
@property (nonatomic, strong) UIAlertView* alert;

- (void)showAlert:(NSString *)title :(NSString *)message :(NSMutableArray *)buttons :(NSMutableArray *)ids;
- (void)showAlert:(NSString *)title :(NSString *)message :(NSMutableArray *)buttons :(NSMutableArray *)ids :(NSInteger)stepStart :(NSInteger)stepEnd;
- (void)hideAlert;

@end