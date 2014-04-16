//
//  BjitUtil.h
//  Sokoban
//
//  Created by USER on 2014/04/15.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ID_EXIT 0
#define ID_OK 1
#define ID_CANCEL 2
#define ID_SETTINGS 3
#define ID_ABOUT 4
#define ID_START 5
#define ID_MICROBAN 6
#define ID_ORIGINAL 7
#define ID_MAS_SASQUATCH 8
#define ID_SASQUATCH 9

#define DIALOG_START 100
#define DIALOG_ABOUT 101
#define DIALOG_SELECT 102
#define DIALOG_MICROBAN 103
#define DIALOG_ORIGINAL 104
#define DIALOG_MAS_SASQUATCH 105
#define DIALOG_SASQUATCH 106

#define COUNT_MICROBAN 155
#define COUNT_ORIGINAL 205
#define COUNT_MAS_SASQUATCH 255
#define COUNT_SASQUATCH 354

@interface BjitUtil : NSObject

void testFunction();

@end
