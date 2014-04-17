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

@synthesize controller;

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

- (id)init:(NSInteger) controllerId
{
    self = [super initWithRootViewController:[[BjitViewControllerStart alloc] init]];
    return self;
}

- (void)showController:(NSInteger) controllerId
{
    switch (controllerId) {
        case CONTROLLER_START:
            [self pushViewController:[[BjitViewControllerGame alloc] init] animated:NO];
            break;
        case CONTROLLER_GAME:
            [self pushViewController:[[BjitViewControllerStart alloc] init] animated:NO];
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
