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

@interface BjitViewGame : UIView

@property (nonatomic, strong) NSObject<BjitProtocolAlert> *protocolAlertRoot;

@property (nonatomic, strong) UIImage *diamondOnFloorBitmap;
@property (nonatomic, strong) UIImage *diamondOnTargetBitmap;
@property (nonatomic, strong) UIImage *floorBitmap;
@property (nonatomic, strong) UIImage *outsideBitmap;
@property (nonatomic, strong) UIImage *targetBitmap;
@property (nonatomic, strong) UIImage *wallBitmap;
@property (nonatomic, strong) UIImage *manOnFloorBitmap;
@property (nonatomic, strong) UIImage *manOnTargetBitmap;

@property (nonatomic, strong) BjitGameLevels* gameLevels;
@property (nonatomic, strong) NSArray* gameLevel;
@property (nonatomic, assign) NSInteger gameIndex;
@property (nonatomic, assign) NSInteger noOfVerticalTiles;
@property (nonatomic, assign) NSInteger noOfHorizontalTiles;
@property (nonatomic, assign) NSInteger startX;
@property (nonatomic, assign) NSInteger startY;

@property (nonatomic, assign) NSInteger testInteger;

- (id)init:(NSInteger) gameLevel :(NSObject<BjitProtocolAlert> *)protocolAlert;

@end
