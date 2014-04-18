//
//  BjitViewControllerStart.m
//  Sokoban
//
//  Created by USER on 2014/04/15.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitViewControllerStart.h"
#import "BjitUtil.h"

#define SCALE_FACTOR_STEPPER 1.6
#define POINT_Y_STEPPER_START 50
#define HEIGHT_LABEL 40
#define TAG_LABEL 30

@interface BjitViewControllerStart ()

@end

@implementation BjitViewControllerStart

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
    self.selfControllerIndex = CONTROLLER_START;
    [self showAlert:DIALOG_START];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    testFunction();
}

- (void)showAlert:(NSInteger) id
{
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    NSMutableArray *ids = [[NSMutableArray alloc] init];
    switch (id) {
        case DIALOG_START:
        {
            [buttons addObject:@"Start"];
            [buttons addObject:@"Settings"];
            [buttons addObject:@"About"];
            [buttons addObject:@"Exit"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_SELECT]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_SETTINGS]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_ABOUT]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_EXIT]];
            [self showAlert:@"Sokoban":@"Select Option":buttons:ids];
        }
            break;
        case DIALOG_ABOUT:
        {
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [self showAlert:@"Sokoban 0.01":@"This is porting of Sokoban from Android by Bjit Inc.\nAndroid version is developed by Mobile Pearls\n\"http://mobilepearls.com\"":buttons:ids];
        }
            break;
        case DIALOG_SELECT:
        {
            [buttons addObject:@"Microban (easy) - 1/155"];
            [buttons addObject:@"Original - 1/50"];
            [buttons addObject:@"Mas Sasquatch - 1/50"];
            [buttons addObject:@"Sasquatch - 1/99"];
            [buttons addObject:@"Back"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_MICROBAN]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_ORIGINAL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_MAS_SASQUATCH]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_SASQUATCH]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [self showAlert:nil:@"Select Game\n":buttons:ids];
        }
            break;
        case DIALOG_MICROBAN:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_MICROBAN_INDEX]];
            [self showAlert:@"Select":@"\n\n\n\n\n":buttons:ids:0:COUNT_MICROBAN];
        }
            break;
        case DIALOG_ORIGINAL:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_ORIGINAL_INDEX]];
            [self showAlert:@"Select":@"\n\n\n\n\n":buttons:ids:COUNT_MICROBAN:COUNT_ORIGINAL];
        }
            break;
        case DIALOG_MAS_SASQUATCH:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_MAS_SASQUATCH_INDEX]];
            [self showAlert:@"Select":@"\n\n\n\n\n":buttons:ids:COUNT_ORIGINAL:COUNT_MAS_SASQUATCH];
        }
            break;
        case DIALOG_SASQUATCH:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_SASQUATCH_INDEX]];
            [self showAlert:@"Select":@"\n\n\n\n\n":buttons:ids:COUNT_MAS_SASQUATCH:COUNT_SASQUATCH];
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
    stepper.continuous = NO;
    stepper.tintColor = [UIColor colorWithRed:0.0f green:0.0f blue:1.0 alpha:0.5f];
    [stepper addTarget:self
                action:@selector(buttonAction:)
      forControlEvents:UIControlEventValueChanged];
    [self.alert addSubview:stepper];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y + POINT_Y_STEPPER_START, stepper.frame.size.width * SCALE_FACTOR_STEPPER, HEIGHT_LABEL)];
    label.textAlignment = NSTextAlignmentCenter;
    // TODO get last non fixed game from UserDefault
    [label setText:[NSString stringWithFormat:@"%d", 1]];
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

- (NSInteger)getGameIndex:(NSInteger)stepEnd
{
    NSInteger gameIndex = 0;
    if (self.alert) {
        NSArray *views = self.alert.subviews;
        NSInteger count = views.count;
        for (NSInteger i = 0; i < count; i++) {
            UIView *view = [views objectAtIndex:i];
            if (view.tag == TAG_LABEL) {
                UILabel *label = (UILabel *)view;
                gameIndex = label.text.integerValue - 1;
                break;
            }
        }
    }
    
    switch (stepEnd) {
        case COUNT_MICROBAN:
            break;
        case COUNT_ORIGINAL:
            gameIndex += COUNT_MICROBAN;
            break;
        case COUNT_MAS_SASQUATCH:
            gameIndex += COUNT_ORIGINAL;
            break;
        case COUNT_SASQUATCH:
            gameIndex += COUNT_MAS_SASQUATCH;
            break;
        default:
            break;
    }
    return gameIndex;
}

- (void)hideAlert:(NSInteger) id
{
    switch (id) {
        case ID_START:
            break;
        case ID_SELECT:
        {
            [self showAlert:DIALOG_SELECT];
        }
            break;
        case ID_CANCEL:
        {
            [self showAlert:DIALOG_START];
        }
            break;
        case ID_ABOUT:
        {
            [self showAlert:DIALOG_ABOUT];
        }
            break;
        case ID_MICROBAN:
        {
            [self showAlert:DIALOG_MICROBAN];
        }
            break;
        case ID_ORIGINAL:
        {
            [self showAlert:DIALOG_ORIGINAL];
        }
            break;
        case ID_MAS_SASQUATCH:
        {
            [self showAlert:DIALOG_MAS_SASQUATCH];
        }
            break;
        case ID_SASQUATCH:
        {
            [self showAlert:DIALOG_SASQUATCH];
        }
            break;
        case ID_MICROBAN_INDEX:
        {
            NSInteger gameIndex = [self getGameIndex:COUNT_MICROBAN];
            [self setUserDefaults:KEY_GAME_INDEX :gameIndex];
            [self setUserDefaults:KEY_GAME :ID_MICROBAN];
        }
            break;
        case ID_ORIGINAL_INDEX:
        {
            NSInteger gameIndex = [self getGameIndex:COUNT_ORIGINAL];
            [self setUserDefaults:KEY_GAME_INDEX :gameIndex];
            [self setUserDefaults:KEY_GAME :ID_ORIGINAL];
        }
            break;
        case ID_MAS_SASQUATCH_INDEX:
        {
            NSInteger gameIndex = [self getGameIndex:COUNT_MAS_SASQUATCH];
            [self setUserDefaults:KEY_GAME_INDEX :gameIndex];
            [self setUserDefaults:KEY_GAME :ID_MAS_SASQUATCH];
        }
            break;
        case ID_SASQUATCH_INDEX:
        {
            NSInteger gameIndex = [self getGameIndex:COUNT_SASQUATCH];
            [self setUserDefaults:KEY_GAME_INDEX :gameIndex];
            [self setUserDefaults:KEY_GAME :ID_SASQUATCH];
        }
            break;
        case ID_SETTINGS:
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
