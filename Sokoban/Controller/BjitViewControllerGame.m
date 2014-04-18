//
//  BjitViewControllerGame.m
//  Sokoban
//
//  Created by USER on 2014/04/16.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitViewControllerGame.h"
#import "BjitViewGame.h"
#import "BjitUtil.h"

#define SCALE_FACTOR_STEPPER 1.6
#define POINT_Y_STEPPER_START 50
#define HEIGHT_LABEL 40
#define TAG_LABEL 30

@interface BjitViewControllerGame ()

@end

@implementation BjitViewControllerGame

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }

    return self;
}

- (id)init:(NSObject<BjitProtocolNavigator> *)navigator
{
    self = [super init:navigator];
    self.selfControllerIndex = CONTROLLER_GAME;
    self.gameLevel = [self getUserDefaults:KEY_GAME_INDEX];
    self.game = [self getUserDefaults:KEY_GAME];
    self.gameView = [[BjitViewGame alloc] init:self.gameLevel:(NSObject<BjitProtocolAlert> *)self];
    [self.view addSubview:self.gameView];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAlert:(NSInteger) id
{
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    NSMutableArray *ids = [[NSMutableArray alloc] init];
    switch (id) {
        case DIALOG_START:
            break;
        case DIALOG_MICROBAN:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_GAME_LEVEL_NEW]];
            [self showAlert:@"Select Microban":@"\n\n\n\n\n":buttons:ids:0:COUNT_MICROBAN];
        }
            break;
        case DIALOG_ORIGINAL:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_GAME_LEVEL_NEW]];
            [self showAlert:@"Select Original":@"\n\n\n\n\n":buttons:ids:COUNT_MICROBAN:COUNT_ORIGINAL];
        }
            break;
        case DIALOG_MAS_SASQUATCH:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_GAME_LEVEL_NEW]];
            [self showAlert:@"Select Mas-Sasquatch":@"\n\n\n\n\n":buttons:ids:COUNT_ORIGINAL:COUNT_MAS_SASQUATCH];
        }
            break;
        case DIALOG_SASQUATCH:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_GAME_LEVEL_NEW]];
            [self showAlert:@"Select Sasquatch":@"\n\n\n\n\n":buttons:ids:COUNT_MAS_SASQUATCH:COUNT_SASQUATCH];
        }
            break;
        default:
            break;
    }
}

- (void)showAlert:(NSString *)title :(NSString *)message :(NSMutableArray *)buttons :(NSMutableArray *)ids :(NSInteger)stepStart :(NSInteger)stepEnd
{
    if (!self.alert) {
        self.alert = [[UIAlertView alloc]
                      initWithTitle:title
                      message:message
                      delegate:self
                      cancelButtonTitle:nil
                      otherButtonTitles:nil, nil];
    }
    
    //    [alert convertPoint:alert.center fromView:alert.superview];
    //    stepper.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    UIStepper *stepper = [[UIStepper alloc] init];
    stepper.transform = CGAffineTransformMakeScale(SCALE_FACTOR_STEPPER, SCALE_FACTOR_STEPPER);
    NSInteger x = abs(([[UIScreen mainScreen] bounds].size.width - stepper.frame.size.width + stepper.frame.origin.x)) / 2;
    NSInteger y = POINT_Y_STEPPER_START;
    stepper.frame = CGRectMake(x, POINT_Y_STEPPER_START, 0, 0);
    stepper.minimumValue = 1;
    stepper.maximumValue = stepEnd - stepStart;
    stepper.stepValue = 1;
    stepper.value = self.gameLevel - stepStart + 1;
    stepper.continuous = NO;
    stepper.tintColor = [UIColor colorWithRed:0.0f green:0.0f blue:1.0 alpha:0.5f];
    [stepper addTarget:self
                action:@selector(buttonAction:)
      forControlEvents:UIControlEventValueChanged];
    [self.alert addSubview:stepper];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y + POINT_Y_STEPPER_START, stepper.frame.size.width * SCALE_FACTOR_STEPPER, HEIGHT_LABEL)];
    label.textAlignment = NSTextAlignmentCenter;
    // TODO get last non fixed game from UserDefault
    [label setText:[NSString stringWithFormat:@"%d", self.gameLevel - stepStart + 1]];
    label.tag = TAG_LABEL;
    [self.alert addSubview:label];
    
    [self showAlert:title :message :buttons :ids];
}

- (void)buttonAction:(id)sender
{
    UIView *senderView = sender;
    
    if ([senderView isKindOfClass:[UIStepper class]]) {
        UIStepper *stepper = sender;
        NSInteger gameIndex = stepper.value;
        NSArray *views = stepper.superview.subviews;
        NSInteger count = views.count;
        for (NSInteger i = 0; i < count; i++) {
            UIView *view = [views objectAtIndex:i];
            if (view.tag == TAG_LABEL) {
                UILabel *label = (UILabel *)view;
                [label setText:[NSString stringWithFormat:@"%ld", (long)gameIndex]];
                break;
            }
        }
    }
}

- (void)hideAlert:(NSInteger) id
{
    switch (id) {
        case ID_GAME_LEVEL_CLEAR:
        {
            NSInteger dialogId = 0;
            if (self.gameLevel + 1 < COUNT_SASQUATCH) {
                self.gameLevel = self.gameLevel + 1;

                if (self.gameLevel < COUNT_MICROBAN) {
                    self.game = ID_MICROBAN;
                    dialogId = DIALOG_MICROBAN;
                } else if (self.gameLevel < COUNT_ORIGINAL) {
                    self.game = ID_ORIGINAL;
                    dialogId = DIALOG_ORIGINAL;
                } else if (self.gameLevel < COUNT_MAS_SASQUATCH) {
                    self.game = ID_MAS_SASQUATCH;
                    dialogId = DIALOG_MAS_SASQUATCH;
                } else if (self.gameLevel < COUNT_SASQUATCH) {
                    self.game = ID_SASQUATCH;
                    dialogId = DIALOG_SASQUATCH;
                }
            }

            [self setUserDefaults:KEY_GAME_INDEX :self.gameLevel];
            [self setUserDefaults:KEY_GAME :self.game];

            [self showAlert:dialogId];
        }
            break;
        case ID_GAME_LEVEL_NEW:
            if (self.game == ID_MICROBAN) {
                self.gameLevel = [self getGameIndex:COUNT_MICROBAN];
            } else if (self.game == ID_ORIGINAL) {
                self.gameLevel = [self getGameIndex:COUNT_ORIGINAL];
            } else if (self.game == ID_MAS_SASQUATCH) {
                self.gameLevel = [self getGameIndex:COUNT_MAS_SASQUATCH];
            } else if (self.game == ID_SASQUATCH) {
                self.gameLevel = [self getGameIndex:COUNT_SASQUATCH];
            }
            [self setUserDefaults:KEY_GAME_INDEX :self.gameLevel];
            [self setUserDefaults:KEY_GAME :self.game];

            [self.gameView initData:self.gameLevel];
            [self.gameView setNeedsDisplay];
            break;
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
