//
//  BjitViewControllerGame.m
//  Sokoban
//
//  Created by USER on 2014/04/16.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitViewControllerGame.h"

@interface BjitViewControllerGame ()

@end

@implementation BjitViewControllerGame

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        view.backgroundColor = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f];
        [self.view addSubview:view];
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
