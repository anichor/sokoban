//
//  BjitViewControllerRoot.m
//  Sokoban
//
//  Created by USER on 2014/04/15.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitViewControllerRoot.h"
#import "BjitUtil.h"

#define SCALE_FACTOR_STEPPER 1.6
#define POINT_Y_STEPPER_START 50
#define HEIGHT_LABEL 40
#define TAG_LABEL 30

@interface BjitViewControllerRoot ()

@end

@implementation BjitViewControllerRoot

@synthesize button_ids;
@synthesize alert;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self hideNavigation];
    [self hideStatusBar];
}

- (void)hideNavigation
{
    self.navigationController.navigationBarHidden = TRUE;
}

- (void)hideAlert
{
    [alert dismissWithClickedButtonIndex:0 animated:NO];
    alert = nil;
}

- (void)hideStatusBar
{
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
}

- (void)showAlert:(NSString *)title :(NSString *)message :(NSMutableArray *)buttons :(NSMutableArray *)ids
{
    if (!alert) {
        alert = [[UIAlertView alloc]
                 initWithTitle:title
                 message:message
                 delegate:self
                 cancelButtonTitle:nil
                 otherButtonTitles:nil, nil];
    }

    self.button_ids = ids;
    NSInteger count = [buttons count];
    for (NSInteger i = 0; i < count; i++) {
        NSString *button = [buttons objectAtIndex:i];
        [alert addButtonWithTitle:button];
    }

    [alert show];
}

- (void)showAlert:(NSString *)title :(NSString *)message :(NSMutableArray *)buttons :(NSMutableArray *)ids :(NSInteger)stepStart :(NSInteger)stepEnd
{
    if (!alert) {
        alert = [[UIAlertView alloc]
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
                       action:@selector(stepperAction:)
             forControlEvents:UIControlEventValueChanged];
    [alert addSubview:stepper];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y + POINT_Y_STEPPER_START, stepper.frame.size.width * SCALE_FACTOR_STEPPER, HEIGHT_LABEL)];
    label.textAlignment = NSTextAlignmentCenter;
    // TODO get last non fixed game
    [label setText:[NSString stringWithFormat:@"%d", 1]];
    label.tag = TAG_LABEL;
    [alert addSubview:label];

    [self showAlert:title :message :buttons :ids];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)stepperAction:(id)sender
{
    UIStepper *stepper = sender;
    NSInteger gameIndex = stepper.value;
    NSArray *views = stepper.superview.subviews;
    NSInteger count = views.count;
    for (NSInteger i = 0; i < count; i++) {
        UIView *view = [views objectAtIndex:i];
        if (view.tag == TAG_LABEL) {
            UILabel *label = (UILabel *)view;
            [label setText:[NSString stringWithFormat:@"%d", gameIndex]];
            break;
        }
        if ([view isKindOfClass:[UILabel class]]) {
        }
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSInteger index = [[self.button_ids objectAtIndex:buttonIndex] integerValue];
    switch (index) {
        case ID_EXIT:
            exit(0);
        case ID_START:
            alert = nil;
            [self hideAlert:ID_START];
            break;
        case ID_OK:
            alert = nil;
            [self hideAlert:ID_OK];
            break;
        case ID_ABOUT:
            alert = nil;
            [self hideAlert:ID_ABOUT];
            break;
        case ID_CANCEL:
            alert = nil;
            [self hideAlert:ID_CANCEL];
            break;
        case ID_SETTINGS:
            alert = nil;
            [self hideAlert:ID_SETTINGS];
            break;
        case COUNT_MICROBAN:
            alert = nil;
            [self hideAlert:COUNT_MICROBAN];
            break;
        case COUNT_ORIGINAL:
            alert = nil;
            [self hideAlert:COUNT_ORIGINAL];
            break;
        case COUNT_MAS_SASQUATCH:
            alert = nil;
            [self hideAlert:COUNT_MAS_SASQUATCH];
            break;
        case COUNT_SASQUATCH:
            alert = nil;
            [self hideAlert:COUNT_SASQUATCH];
            break;
        default:
            break;
    }
}

@end
