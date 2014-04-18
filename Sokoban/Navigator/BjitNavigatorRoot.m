//
//  BjitNavigatorRoot.m
//  Sokoban
//
//  Created by USER on 2014/04/17.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

// TODO Implement without using Arc

#import "BjitNavigatorRoot.h"
#import "BjitViewControllerRoot.h"
#import "BjitViewControllerStart.h"
#import "BjitViewControllerGame.h"
#import "BjitUtil.h"

@interface BjitNavigatorRoot ()

@end

@implementation BjitNavigatorRoot

@synthesize nextControllerIndex;
@synthesize previousControllerIndex;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)init
{
    self = [super initWithRootViewController:[[UIViewController alloc] init]];
    [self addChildViewController:[self getController:CONTROLLER_START]];
    return self;
}

- (id)getController:(NSInteger) controllerId
{
    switch (controllerId) {
        case CONTROLLER_START:
            self.nextControllerIndex = CONTROLLER_GAME;
            self.previousControllerIndex = CONTROLLER_NONE;
            return [[BjitViewControllerStart alloc] init:(NSObject<BjitProtocolNavigator> *) self];
        case CONTROLLER_GAME:
            self.nextControllerIndex = CONTROLLER_NONE;
            self.previousControllerIndex = CONTROLLER_START;
            return [[BjitViewControllerGame alloc] init:(NSObject<BjitProtocolNavigator> *) self];
            break;
        default:
            break;
    }
    return nil;
}

- (void)showController:(NSInteger) controllerId
{
    switch (controllerId) {
        case CONTROLLER_START:
            [self popToRootViewControllerAnimated:NO];
            [self pushViewController:[self getController:self.nextControllerIndex] animated:NO];
            break;
        case CONTROLLER_GAME:
            [self pushViewController:[self getController:self.previousControllerIndex] animated:NO];
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
