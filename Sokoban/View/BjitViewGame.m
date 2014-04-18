//
//  BjitViewGame.m
//  Sokoban
//
//  Created by USER on 2014/04/17.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitViewGame.h"
#import "BjitGameLevels.h"
#import "BjitUtil.h"

#define CHAR_OUTSIDE '\''
#define CHAR_WALL '#'
#define CHAR_TARGET '.'
#define CHAR_MAN_ON_TARGET '+'
#define CHAR_MAN_ON_FLOOR '@'
#define CHAR_FLOOR ' '
#define CHAR_DIAMOND_ON_TARGET '*'
#define CHAR_DIAMOND_ON_FLOOR '$'
#define tileSize 30

@implementation BjitViewGame

@synthesize protocolAlertRoot;
@synthesize diamondOnFloorBitmap;
@synthesize diamondOnTargetBitmap;
@synthesize floorBitmap;
@synthesize outsideBitmap;
@synthesize targetBitmap;
@synthesize wallBitmap;
@synthesize manOnFloorBitmap;
@synthesize manOnTargetBitmap;
@synthesize noOfVerticalTiles;
@synthesize noOfHorizontalTiles;
@synthesize startX;
@synthesize startY;
@synthesize testInteger;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
    }
    return self;
}

- (id)init:(NSInteger)gameLevel :(NSObject<BjitProtocolAlert> *)protocolAlert
{
    self = [super init];

    if (!self.gameLevels) {
        self.gameLevels = [[BjitGameLevels alloc] init];
    }

    self.protocolAlertRoot = protocolAlert;

    self.gameIndex = gameLevel;
    self.gameLevel = [self.gameLevels getLevelMaps:self.gameIndex];
    noOfVerticalTiles = [self.gameLevel count];
    NSString *row = [self.gameLevel objectAtIndex:0];
    noOfHorizontalTiles = [row length];

    CGRect screenSize = [[UIScreen mainScreen] bounds];
    self.startX = (screenSize.size.width - noOfHorizontalTiles * tileSize) / 2;
    self.startY = (screenSize.size.height - noOfVerticalTiles * tileSize) / 2;
    
    if (!diamondOnFloorBitmap) {
        diamondOnFloorBitmap = [UIImage imageNamed:@"diamond_on_floor_96.png"];
    }
    if (!diamondOnTargetBitmap) {
        diamondOnTargetBitmap = [UIImage imageNamed:@"diamond_on_target_96.png"];
    }
    if (!floorBitmap) {
        floorBitmap = [UIImage imageNamed:@"floor_96.png"];
    }
    if (!outsideBitmap) {
        outsideBitmap = [UIImage imageNamed:@"outside_96.png"];
    }
    if (!targetBitmap) {
        targetBitmap = [UIImage imageNamed:@"target_96.png"];
    }
    if (!wallBitmap) {
        wallBitmap = [UIImage imageNamed:@"wall_96.png"];
    }
    if (!manOnFloorBitmap) {
        manOnFloorBitmap = [UIImage imageNamed:@"man_on_floor_96.png"];
    }
    if (!manOnTargetBitmap) {
        manOnTargetBitmap = [UIImage imageNamed:@"man_on_target_96.png"];
    }

    return self;
}

- (NSInteger)getVerticalTilesNo
{
    return noOfVerticalTiles;
}

- (NSInteger)getHorizontalTilesNo
{
    return noOfHorizontalTiles;
}

- (NSInteger)getTilesSize
{
    return tileSize;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    NSInteger xCoordinate;
    NSInteger yCoordinate;
    NSString *row;
    UIImage *image;

    for (NSInteger i = 0; i < noOfVerticalTiles; i++) {
        yCoordinate = self.startY + i * tileSize;
        row = [self.gameLevel objectAtIndex:i];
        for (NSInteger j = 0; j < noOfHorizontalTiles; j++) {
            xCoordinate = self.startX + j * tileSize;
            char c = [row characterAtIndex:j];
            switch (c) {
                case CHAR_OUTSIDE:
                    image = outsideBitmap;
                    break;
                case CHAR_WALL:
                    image = wallBitmap;
                    break;
                case CHAR_MAN_ON_FLOOR:
                    image = manOnFloorBitmap;
                    break;
                case CHAR_MAN_ON_TARGET:
                    image = manOnTargetBitmap;
                    break;
                case CHAR_FLOOR:
                    image = floorBitmap;
                    break;
                case CHAR_DIAMOND_ON_FLOOR:
                    image = diamondOnFloorBitmap;
                    break;
                case CHAR_DIAMOND_ON_TARGET:
                    image = diamondOnTargetBitmap;
                    break;
                case CHAR_TARGET:
                    image = targetBitmap;
                    break;
                default:
                    break;
            }
            [image drawInRect:CGRectMake(xCoordinate, yCoordinate, tileSize, tileSize)];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesEnded:touches withEvent:event];
	
	UITouch* touch = ([touches count] == 1 ? [touches anyObject] : nil);
	
	if (touch)
	{
        testInteger++;
        if (testInteger == 10) {
            if (self.protocolAlertRoot) {
                [self.protocolAlertRoot showAlert:DIALOG_MICROBAN];
            }
        }
    }
}
@end
