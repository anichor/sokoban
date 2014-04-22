//
//  BjitGameState.m
//  Sokoban
//
//  Created by USER on 2014/04/17.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitGameState.h"
#import "BjitUtil.h"
#import "BjitPosition.h"

@implementation BjitGameState
@synthesize position;
@synthesize isGameDone;
@synthesize isGaveOver;
@synthesize noOfHorizontalTiles;
@synthesize noOfVerticalTiles;
@synthesize gameLevel;
@synthesize countTarget;

- (id) init
{
    self = [super init];
    self.position = [[BjitPosition alloc] init];
    self.position.x = 0;
    self.position.y = 0;
    isGaveOver = NO;
    isGameDone = NO;

    return self;
}

- (void) initData:(NSArray *)game
{
    self.gameLevel = [[NSMutableArray alloc] initWithArray:game];
    self.noOfVerticalTiles = [self.gameLevel count];
    NSString *row = [self.gameLevel objectAtIndex:0];
    self.noOfHorizontalTiles = [row length];

    self.countTarget = 0;
    for (NSInteger i = 0; i < self.noOfVerticalTiles; i++) {
        row = [self.gameLevel objectAtIndex:i];
        for (NSInteger j = 0; j < self.noOfHorizontalTiles; j++) {
            char c = [row characterAtIndex:j];
            if (c == CHAR_MAN_ON_FLOOR || c == CHAR_MAN_ON_TARGET) {
                self.position.x = j;
                self.position.y = i;
            }
            if (c == CHAR_TARGET || c == CHAR_MAN_ON_TARGET || c == CHAR_IMAGE_ON_TARGET) {
                self.countTarget = self.countTarget + 1;
            }
        }
    }
}

- (NSInteger) getVerticalTilesNo
{
    return self.noOfVerticalTiles;
}

- (NSInteger) getHorizontalTilesNo
{
    return self.noOfHorizontalTiles;
}

- (NSString *) moveImage:(NSString *)row :(NSInteger)pos
{
    char c = [row characterAtIndex:pos];
    if (c == CHAR_TARGET) {
        row = [self updateTiles:row:CHAR_IMAGE_ON_TARGET:pos];
    } else if (c == CHAR_FLOOR) {
        row = [self updateTiles:row:CHAR_IMAGE_ON_FLOOR:pos];
    } else {
        row = nil;
    }
    return row;
}

- (NSString *) moveMan:(NSString *)row :(NSInteger)pos
{
    char c = [row characterAtIndex:pos];
    if (c == CHAR_TARGET) {
        row = [self updateTiles:row:CHAR_MAN_ON_TARGET:pos];
    } else if (c == CHAR_FLOOR) {
        row = [self updateTiles:row:CHAR_MAN_ON_FLOOR:pos];
    } else {
        row = nil;
    }
    return row;
}

- (NSString *) updatePrevious:(NSString *)row :(NSInteger)pos
{
    char c = [row characterAtIndex:pos];
    if (c == CHAR_MAN_ON_TARGET || c == CHAR_IMAGE_ON_TARGET) {
        row = [self updateTiles:row:CHAR_TARGET:pos];
    } else if (c == CHAR_MAN_ON_FLOOR || c == CHAR_IMAGE_ON_FLOOR) {
        row = [self updateTiles:row:CHAR_FLOOR:pos];
    }
    return row;
}

- (NSString *) updateTiles:(NSString *)row :(char)c :(NSInteger)pos
{
    NSString *cString = [NSString stringWithFormat:@"%c", c];
    NSRange range = NSMakeRange(pos, 1);
    row = [row stringByReplacingCharactersInRange:range withString:cString];
    return row;
}

- (BOOL) performMove:(NSInteger)direction
{
    NSInteger x = self.position.x;
    NSInteger y = self.position.y;
    NSString *row = [self.gameLevel objectAtIndex:self.position.y];

    char c;

    if (direction == UISwipeGestureRecognizerDirectionUp) {
        if (y - 1 >= 0) {
            NSString *row1 = [self.gameLevel objectAtIndex:(y - 1)];
            c = [row1 characterAtIndex:x];
            if (c == CHAR_IMAGE_ON_FLOOR || c == CHAR_IMAGE_ON_TARGET) {
                if (y - 2 >= 0) {
                    NSString *row2 = [self.gameLevel objectAtIndex:(y - 2)];
                    // Update Next Position Of Image
                    row2 = [self moveImage:row2 :x];
                    if (row2 == nil) {
                        return NO;
                    }
                    // Update Previous Position Of Image
                    row1 = [self updatePrevious:row1 :x];
                    
                    // Update Level Map
                    [self.gameLevel replaceObjectAtIndex:(y - 2) withObject:row2];
                }
            }
            // Update Next Position Of Man
            row1 = [self moveMan:row1 :x];
            if (row1 == nil) {
                return NO;
            }
            self.position.y = y - 1;
            // Update Level Map
            [self.gameLevel replaceObjectAtIndex:(y - 1) withObject:row1];
            
            // Update previous Position of Man
            row = [self updatePrevious:row:x];
            // Update Level Map
            [self.gameLevel replaceObjectAtIndex:y withObject:row];
            
        } else {
            return NO;
        }
    } else if (direction == UISwipeGestureRecognizerDirectionLeft) {
        if (x - 1 >= 0) {
            c = [row characterAtIndex:(x - 1)];
            if (c == CHAR_IMAGE_ON_FLOOR || c == CHAR_IMAGE_ON_TARGET) {
                if (x - 2 >= 0) {
                    // Update Next Position Of Image
                    row = [self moveImage:row :x - 2];
                    if (row == nil) {
                        return NO;
                    }
                    // Update Previous Position Of Image
                    row = [self updatePrevious:row :x - 1];
                }
            }

            // Update Next Position Of Man
            row = [self moveMan:row :x - 1];
            if (row == nil) {
                return NO;
            }
            self.position.x = x - 1;
            // Update previous Position of Man
            row = [self updatePrevious:row:x];
        } else {
            return NO;
        }

        // Update Level Map
        [self.gameLevel replaceObjectAtIndex:y withObject:row];
    } else if (direction == UISwipeGestureRecognizerDirectionRight) {
        if (x + 1 <= row.length - 1) {
            c = [row characterAtIndex:(x + 1)];
            if (c == CHAR_IMAGE_ON_FLOOR || c == CHAR_IMAGE_ON_TARGET) {
                if (x + 2 <= row.length - 1) {
                    // Update Next Position Of Image
                    row = [self moveImage:row :x + 2];
                    if (row == nil) {
                        return NO;
                    }
                    // Update Previous Position Of Image
                    row = [self updatePrevious:row :x + 1];
                }
            }
            
            // Update Next Position Of Man
            row = [self moveMan:row :x + 1];
            if (row == nil) {
                return NO;
            }
            self.position.x = x + 1;
            // Update previous Position of Man
            row = [self updatePrevious:row:x];

            // Update Level Map
            [self.gameLevel replaceObjectAtIndex:y withObject:row];
        } else {
            return NO;
        }
    } else if (direction == UISwipeGestureRecognizerDirectionDown) {
        if (y + 1 <= [self.gameLevel count] - 1) {
            NSString *row1 = [self.gameLevel objectAtIndex:(y + 1)];
            c = [row1 characterAtIndex:x];
            if (c == CHAR_IMAGE_ON_FLOOR || c == CHAR_IMAGE_ON_TARGET) {
                if (y + 2 <= [self.gameLevel count] - 1) {
                    NSString *row2 = [self.gameLevel objectAtIndex:(y + 2)];
                    // Update Next Position Of Image
                    row2 = [self moveImage:row2 :x];
                    if (row2 == nil) {
                        return NO;
                    }
                    // Update Previous Position Of Image
                    row1 = [self updatePrevious:row1 :x];

                    // Update Level Map
                    [self.gameLevel replaceObjectAtIndex:(y + 2) withObject:row2];
                }
            }
            // Update Next Position Of Man
            row1 = [self moveMan:row1 :x];
            if (row1 == nil) {
                return NO;
            }
            self.position.y = y + 1;
            // Update Level Map
            [self.gameLevel replaceObjectAtIndex:(y + 1) withObject:row1];

            // Update previous Position of Man
            row = [self updatePrevious:row:x];
            // Update Level Map
            [self.gameLevel replaceObjectAtIndex:y withObject:row];

        } else {
            return NO;
        }
    }

    return YES;
}

- (BOOL) performCheck
{
    BOOL end = NO;
    NSInteger countImageOnTarget = 0;
    NSString *row;
    char c;
    for (NSInteger i = 0; i < self.gameLevel.count; i++) {
        row = [self.gameLevel objectAtIndex:i];
        for (NSInteger j = 0; j < [row length]; j++) {
            c = [row characterAtIndex:j];
            if (c == CHAR_IMAGE_ON_TARGET) {
                countImageOnTarget = countImageOnTarget + 1;
            }
        }
    }
    if (countImageOnTarget == self.countTarget) {
        end = YES;
    }
    return end;
}

@end
