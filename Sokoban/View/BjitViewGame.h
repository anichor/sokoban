//
//  BjitViewGame.h
//  Sokoban
//
//  Created by USER on 2014/04/17.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BjitProtocolAlert.h"

@class BjitGameLevels;
@class BjitGameState;

@interface BjitViewGame : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSObject<BjitProtocolAlert> *protocolAlertRoot;

@property (nonatomic, strong) UIImage *imageOnFloorBitmap;
@property (nonatomic, strong) UIImage *imageOnTargetBitmap;
@property (nonatomic, strong) UIImage *floorBitmap;
@property (nonatomic, strong) UIImage *outsideBitmap;
@property (nonatomic, strong) UIImage *targetBitmap;
@property (nonatomic, strong) UIImage *wallBitmap;
@property (nonatomic, strong) UIImage *manOnFloorBitmap;
@property (nonatomic, strong) UIImage *manOnTargetBitmap;

@property (nonatomic, strong) BjitGameLevels *gameLevels;
@property (nonatomic, strong) BjitGameState *gameState;

@property (nonatomic, assign) NSInteger gameIndex;
@property (nonatomic, assign) NSInteger startX;
@property (nonatomic, assign) NSInteger startY;
@property (nonatomic, assign) BOOL isRunning;

- (id)init:(NSInteger) gameLevel :(NSInteger)gameDesign :(NSObject<BjitProtocolAlert> *)protocolAlert;
- (void)initData:(NSInteger)gameLevel;

@end
