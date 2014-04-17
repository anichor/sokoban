//
//  BjitGameLevels.h
//  Sokoban
//
//  Created by USER on 2014/04/17.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BjitGameLevels : NSObject

@property (nonatomic, assign) NSMutableArray *levelMaps;

- (NSArray *)getLevelMaps:(NSInteger) levelIndex;

@end
