//
//  BjitGameState.h
//  Sokoban
//
//  Created by USER on 2014/04/17.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BjitPosition;

@interface BjitGameState : NSObject

@property (nonatomic, strong) BjitPosition *position;
@property (nonatomic, assign) BOOL isGameDone;
@property (nonatomic, assign) BOOL isGaveOver;
@property (nonatomic, assign) NSInteger noOfVerticalTiles;
@property (nonatomic, assign) NSInteger noOfHorizontalTiles;
@property (nonatomic, strong) NSMutableArray *gameLevel;
@property (nonatomic, assign) NSInteger countTarget;

- (id) init;
- (void) initData:(NSArray *)game;
- (BOOL) performMove:(NSInteger)direction;
- (BOOL) performCheck;
@end
