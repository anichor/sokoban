//
//  BjitViewGame.m
//  Sokoban
//
//  Created by USER on 2014/04/17.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitViewGame.h"
#import "BjitGameLevels.h"
#import "BjitGameState.h"
#import "BjitUtil.h"
#import "BjitPosition.h"

#define tileSize 30

@implementation BjitViewGame

@synthesize protocolAlertRoot;
@synthesize imageOnFloorBitmap;
@synthesize imageOnTargetBitmap;
@synthesize floorBitmap;
@synthesize outsideBitmap;
@synthesize targetBitmap;
@synthesize wallBitmap;
@synthesize manOnFloorBitmap;
@synthesize manOnTargetBitmap;
@synthesize startX;
@synthesize startY;
@synthesize centerX;
@synthesize centerY;
@synthesize playerX;
@synthesize playerY;
@synthesize fitsOnScreen;
@synthesize direction;
@synthesize drawX;
@synthesize drawY;
@synthesize isRunning;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];

        UISwipeGestureRecognizer *gestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondToSwipe:)];
        [gestureLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
        gestureLeft.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:gestureLeft];

        UISwipeGestureRecognizer *gestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondToSwipe:)];
        [gestureRight setDirection:UISwipeGestureRecognizerDirectionRight];
        gestureRight.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:gestureRight];

        UISwipeGestureRecognizer *gestureUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondToSwipe:)];
        [gestureUp setDirection:UISwipeGestureRecognizerDirectionUp];
        gestureUp.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:gestureUp];

        UISwipeGestureRecognizer *gestureDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondToSwipe:)];
        [gestureDown setDirection:UISwipeGestureRecognizerDirectionDown];
        gestureDown.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:gestureDown];

        UITapGestureRecognizer *gestureTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondToTap:)];
        gestureTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:gestureTap];
    }
    return self;
}

- (id)init:(NSInteger)gameLevel :(NSInteger)gameDesign :(NSObject<BjitProtocolAlert> *)protocolAlert
{
    self = [super init];

    if (!self.gameLevels) {
        self.gameLevels = [[BjitGameLevels alloc] init];
    }

    if (!self.gameState) {
        self.gameState = [[BjitGameState alloc] init];
    }

    self.protocolAlertRoot = protocolAlert;

    if (gameDesign == ID_GAME_DESIGN_BJIT) {
        if (!self.imageOnFloorBitmap) {
            self.imageOnFloorBitmap = [UIImage imageNamed:@"bjit_on_floor_96.png"];
        }
        if (!self.imageOnTargetBitmap) {
            self.imageOnTargetBitmap = [UIImage imageNamed:@"bjit_on_target_96.png"];
        }
        if (!floorBitmap) {
            floorBitmap = [UIImage imageNamed:@"bjit_floor_96.png"];
        }
        if (!outsideBitmap) {
            outsideBitmap = [UIImage imageNamed:@"bjit_outside_96.png"];
        }
        if (!targetBitmap) {
            targetBitmap = [UIImage imageNamed:@"bjit_target_96.png"];
        }
        if (!wallBitmap) {
            wallBitmap = [UIImage imageNamed:@"bjit_wall_96.png"];
        }
        if (!manOnFloorBitmap) {
            manOnFloorBitmap = [UIImage imageNamed:@"bjit_man_on_floor_96.png"];
        }
        if (!manOnTargetBitmap) {
            manOnTargetBitmap = [UIImage imageNamed:@"bjit_man_on_target_96.png"];
        }
    } else if (gameDesign == ID_GAME_DESIGN_MP) {
        if (!self.imageOnFloorBitmap) {
            self.imageOnFloorBitmap = [UIImage imageNamed:@"mp_on_floor_96.png"];
        }
        if (!self.imageOnTargetBitmap) {
            self.imageOnTargetBitmap = [UIImage imageNamed:@"mp_on_target_96.png"];
        }
        if (!floorBitmap) {
            floorBitmap = [UIImage imageNamed:@"mp_floor_96.png"];
        }
        if (!outsideBitmap) {
            outsideBitmap = [UIImage imageNamed:@"mp_outside_96.png"];
        }
        if (!targetBitmap) {
            targetBitmap = [UIImage imageNamed:@"mp_target_96.png"];
        }
        if (!wallBitmap) {
            wallBitmap = [UIImage imageNamed:@"mp_wall_96.png"];
        }
        if (!manOnFloorBitmap) {
            manOnFloorBitmap = [UIImage imageNamed:@"mp_man_on_floor_96.png"];
        }
        if (!manOnTargetBitmap) {
            manOnTargetBitmap = [UIImage imageNamed:@"mp_man_on_target_96.png"];
        }
    }
    [self initData:gameLevel];
    return self;
}

- (void)initData:(NSInteger)gameLevel
{
    self.gameIndex = gameLevel;
    [self.gameState initData:[self.gameLevels getLevelMaps:self.gameIndex]];
    
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    self.centerX = screenSize.size.width / 2;
    self.centerY = screenSize.size.height / 2;
    
    self.startX = (screenSize.size.width - self.gameState.noOfHorizontalTiles * tileSize) / 2;
    self.startY = (screenSize.size.height - self.gameState.noOfVerticalTiles * tileSize) / 2;
    if (self.startX < 0 || self.startY < 0) {
        fitsOnScreen = NO;
    } else {
        fitsOnScreen = YES;
    }

    drawX = startX;
    drawY = startY;
    isRunning = NO;
    NSString * test = @"dfvfdvfdvfdvfdvfv";
    test rep
}

- (NSInteger)getTilesSize
{
    return tileSize;
}

// TODO Calculatev Start Point Of Game From Center Point Of Screen
- (void)setPlayerOnCenter
{
    if (fitsOnScreen) {
        return;
    }

    if ((direction == UISwipeGestureRecognizerDirectionUp && (playerY - tileSize <= 0))
        || (direction == UISwipeGestureRecognizerDirectionDown && (playerY + tileSize * 2 >= self.centerY * 2))
        ) {
        drawY = startY;
        // Transform Start To Center
        NSInteger newSY = - (-drawY);
        // Transform Man
        NSInteger newPosY = newSY + tileSize * self.gameState.position.y + tileSize / 2;
        // Transform Start Y Again
        drawY = - (newPosY - centerY);
    }
    if ((direction == UISwipeGestureRecognizerDirectionLeft && (playerX - tileSize <= 0))
        || (direction == UISwipeGestureRecognizerDirectionRight && (playerX + tileSize * 2 >= self.centerX * 2))
        ) {
        drawX = startX;
        NSInteger newSX = - (-drawX);
        NSInteger newPosX = newSX + tileSize * self.gameState.position.x + tileSize / 2;
        drawX = - (newPosX - centerX);
    }
    
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    NSInteger xCoordinate = 0;
    NSInteger yCoordinate = 0;
    NSString *row;

    [self setPlayerOnCenter];

    for (NSInteger i = 0; i < self.gameState.noOfVerticalTiles; i++) {
        yCoordinate = drawY + i * tileSize;
        row = [self.gameState.gameLevel objectAtIndex:i];
        for (NSInteger j = 0; j < self.gameState.noOfHorizontalTiles; j++) {
            xCoordinate = drawX + j * tileSize;
            char c = [row characterAtIndex:j];
            if (c == CHAR_MAN_ON_FLOOR || c == CHAR_MAN_ON_TARGET) {
                playerX = xCoordinate;
                playerY = yCoordinate;
            }
            [self drawBitmap:c:xCoordinate:yCoordinate];
        }
    }

    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(performCheck:) object:self.gameState];
    [thread start];
}

- (void)performCheck:(BjitGameState *)state
{
    if ([state performCheck]) {
        [self.protocolAlertRoot hideAlert:ID_GAME_LEVEL_CLEAR];
    }
}

- (void)drawBitmap:(char)c :(NSInteger)xCoordinate :(NSInteger)yCoordinate
{
    UIImage *image;

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
        case CHAR_IMAGE_ON_FLOOR:
            image = imageOnFloorBitmap;
            break;
        case CHAR_IMAGE_ON_TARGET:
            image = imageOnTargetBitmap;
            break;
        case CHAR_TARGET:
            image = targetBitmap;
            break;
        default:
            break;
    }
    [image drawInRect:CGRectMake(xCoordinate, yCoordinate, tileSize, tileSize)];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesEnded:touches withEvent:event];

	UITouch* touch = ([touches count] == 1 ? [touches anyObject] : nil);

	if (touch)
	{
    }
}

- (void)respondToTap:(UITapGestureRecognizer *)recognizer
{
    [self.protocolAlertRoot hideAlert:ID_GAME_LEVEL_STATE];
}

- (void)respondToSwipe:(UISwipeGestureRecognizer *)recognizer
{
    direction = recognizer.direction;
    if ((direction & UISwipeGestureRecognizerDirectionDown) == UISwipeGestureRecognizerDirectionDown) {
        if ([self.gameState performMove:UISwipeGestureRecognizerDirectionDown]) {
            [self setNeedsDisplay];
        }
        if (self.gameState.isGameDone) {
        } else if (self.gameState.isGaveOver) {
            // Restart Level Dialog
        }
    } else if ((direction & UISwipeGestureRecognizerDirectionLeft) == UISwipeGestureRecognizerDirectionLeft) {
        if ([self.gameState performMove:UISwipeGestureRecognizerDirectionLeft]) {
            [self setNeedsDisplay];
        }
        if (self.gameState.isGameDone) {
        } else if (self.gameState.isGaveOver) {
            // Restart Level Dialog
        }
    } else if ((direction & UISwipeGestureRecognizerDirectionRight) == UISwipeGestureRecognizerDirectionRight) {
        if ([self.gameState performMove:UISwipeGestureRecognizerDirectionRight]) {
            [self setNeedsDisplay];
        }
        if (self.gameState.isGameDone) {
            [self.protocolAlertRoot hideAlert:ID_GAME_LEVEL_CLEAR];
        } else if (self.gameState.isGaveOver) {
            // Restart Level Dialog
        }
    } else if ((direction & UISwipeGestureRecognizerDirectionUp) == UISwipeGestureRecognizerDirectionUp) {
        if ([self.gameState performMove:UISwipeGestureRecognizerDirectionUp]) {
            [self setNeedsDisplay];
        }
        if (self.gameState.isGameDone) {
            [self.protocolAlertRoot hideAlert:ID_GAME_LEVEL_CLEAR];
        } else if (self.gameState.isGaveOver) {
            // Restart Level Dialog
        }
    }
}
@end
