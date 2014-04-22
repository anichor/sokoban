//
//  BjitViewControllerGame.h
//  Sokoban
//
//  Created by USER on 2014/04/16.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitViewControllerRoot.h"

@class BjitViewGame;

@interface BjitViewControllerGame : BjitViewControllerRoot
{
}

@property (nonatomic, assign) NSInteger gameLevel;
@property (nonatomic, assign) NSInteger game;
@property (nonatomic, assign) NSInteger gameDesign;
@property (nonatomic, strong) BjitViewGame *gameView;

@end
