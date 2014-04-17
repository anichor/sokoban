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

@interface BjitViewControllerGame ()

@end

@implementation BjitViewControllerGame

@synthesize gameIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }

    return self;
}

- (id)init:(NSInteger)index
{
    self = [super init];
    self.gameIndex = index;
    // TODO Save to UserDefault
    BjitViewGame *view = [[BjitViewGame alloc] init:index:(NSObject<BjitProtocolAlert> *)self];
    [self.view addSubview:view];

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
