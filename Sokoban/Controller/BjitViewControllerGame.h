//
//  BjitViewControllerGame.h
//  Sokoban
//
//  Created by USER on 2014/04/16.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitViewControllerRoot.h"

@interface BjitViewControllerGame : BjitViewControllerRoot
{
}

@property (nonatomic, assign) NSInteger gameIndex;
@property (nonatomic, assign) NSInteger gameLevel;

- (id)init:(NSInteger)index;

@end
