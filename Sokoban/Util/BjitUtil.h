//
//  BjitUtil.h
//  Sokoban
//
//  Created by USER on 2014/04/15.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ID_EXIT 0   // Exit from anywhere
#define ID_OK 1     // Go forward to anywhere
#define ID_CANCEL 2 // Go backward to anywhere
#define ID_START 3
#define ID_ABOUT 4
#define ID_SELECT 5
#define ID_MICROBAN 6
#define ID_ORIGINAL 7
#define ID_MAS_SASQUATCH 8
#define ID_SASQUATCH 9
#define ID_MICROBAN_INDEX 10
#define ID_ORIGINAL_INDEX 11
#define ID_MAS_SASQUATCH_INDEX 12
#define ID_SASQUATCH_INDEX 13
#define ID_SETTINGS 14
#define ID_GAME_LEVEL_CLEAR 15
#define ID_GAME_LEVEL_NEW 16

#define DIALOG_START 103
#define DIALOG_ABOUT 104
#define DIALOG_SELECT 105
#define DIALOG_MICROBAN 106
#define DIALOG_ORIGINAL 107
#define DIALOG_MAS_SASQUATCH 108
#define DIALOG_SASQUATCH 109
#define DIALOG_SETTINGS 114

#define CONTROLLER_NONE 200
#define CONTROLLER_START 203
#define CONTROLLER_GAME 204

#define COUNT_MICROBAN 155
#define COUNT_ORIGINAL 205
#define COUNT_MAS_SASQUATCH 255
#define COUNT_SASQUATCH 354

#define KEY_GAME_INDEX @"KEY_GAME_INDEX"
#define KEY_GAME @"KEY_GAME"

@interface BjitUtil : NSObject

void testFunction();

@end
