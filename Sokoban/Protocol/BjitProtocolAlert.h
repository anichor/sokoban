//
//  BjitProtocolAlert.h
//  Sokoban
//
//  Created by USER on 2014/04/17.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

// TODO Use & Implement as a library using C-compiler for many platform support


#import <Foundation/Foundation.h>

@protocol BjitProtocolAlert <NSObject>

@optional
- (void)showAlert:(NSInteger) id;
- (void)hideAlert:(NSInteger) id;

@required

@end
