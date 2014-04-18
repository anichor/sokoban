//
//  BjitViewControllerRoot.m
//  Sokoban
//
//  Created by USER on 2014/04/15.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitViewControllerRoot.h"
#import "BjitUtil.h"
#import "BjitViewControllerGame.h"

@interface BjitViewControllerRoot ()

@end

@implementation BjitViewControllerRoot

@synthesize button_ids;
@synthesize alert;
@synthesize navigatorRoot;

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
    self = [super init];
    self.navigatorRoot = navigator;
    

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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSInteger index = [[self.button_ids objectAtIndex:buttonIndex] integerValue];
    switch (index) {
        case ID_EXIT:
            exit(0);
        case ID_OK:
            alert = nil;
            [self hideAlert:ID_OK];
            break;
        case ID_CANCEL:
            alert = nil;
            [self hideAlert:ID_CANCEL];
            break;
        case ID_START:
            alert = nil;
            [self hideAlert:ID_START];
            break;
        case ID_ABOUT:
            alert = nil;
            [self hideAlert:ID_ABOUT];
            break;
        case ID_SELECT:
            alert = nil;
            [self hideAlert:ID_SELECT];
            break;
        case ID_MICROBAN:
            alert = nil;
            [self hideAlert:ID_MICROBAN];
            break;
        case ID_ORIGINAL:
            alert = nil;
            [self hideAlert:ID_ORIGINAL];
            break;
        case ID_MAS_SASQUATCH:
            alert = nil;
            [self hideAlert:ID_MAS_SASQUATCH];
            break;
        case ID_SASQUATCH:
            alert = nil;
            [self hideAlert:ID_SASQUATCH];
            break;
        case ID_MICROBAN_INDEX:
        {
            [self hideAlert:ID_MICROBAN_INDEX];
            alert = nil;
            [self.navigatorRoot showController:self.selfControllerIndex];
        }
            break;
        case ID_ORIGINAL_INDEX:
        {
            [self hideAlert:ID_ORIGINAL_INDEX];
            alert = nil;
            [self.navigatorRoot showController:self.selfControllerIndex];
        }
            break;
        case ID_MAS_SASQUATCH_INDEX:
        {
            [self hideAlert:ID_MAS_SASQUATCH_INDEX];
            alert = nil;
            [self.navigatorRoot showController:self.selfControllerIndex];
        }
            break;
        case ID_SASQUATCH_INDEX:
        {
            [self hideAlert:ID_SASQUATCH_INDEX];
            alert = nil;
            [self.navigatorRoot showController:self.selfControllerIndex];
        }
            break;
        case ID_SETTINGS:
            alert = nil;
            [self hideAlert:ID_SETTINGS];
            break;
        default:
            break;
    }
}

- (void)setUserDefaults:(NSString *)userKey :(NSInteger)userValue
{
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    [preferences setInteger:userValue forKey:userKey];
}

- (NSInteger)getUserDefaults:(NSString *)userKey
{
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    NSInteger value = [preferences integerForKey:userKey];
    return value;
}

@end
