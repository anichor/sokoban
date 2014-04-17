//
//  BjitViewControllerStart.m
//  Sokoban
//
//  Created by USER on 2014/04/15.
//  Copyright (c) 2014年 Bjit. All rights reserved.
//

#import "BjitViewControllerStart.h"
#import "BjitUtil.h"

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
            [super showAlert:@"Sokoban":@"Select Option":buttons:ids];
        }
            break;
        case DIALOG_ABOUT:
        {
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [super showAlert:@"Sokoban 0.01":@"This is porting of Sokoban from Android by Bjit Inc.\nAndroid version is developed by Mobile Pearls\n\"http://mobilepearls.com\"":buttons:ids];
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
            [super showAlert:nil:@"Select Game\n":buttons:ids];
        }
            break;
        case DIALOG_MICROBAN:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_MICROBAN_INDEX]];
            [super showAlert:@"Select":@"\n\n\n\n\n":buttons:ids:0:COUNT_MICROBAN];
        }
            break;
        case DIALOG_ORIGINAL:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_ORIGINAL_INDEX]];
            [super showAlert:@"Select":@"\n\n\n\n\n":buttons:ids:COUNT_MICROBAN:COUNT_ORIGINAL];
        }
            break;
        case DIALOG_MAS_SASQUATCH:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_MAS_SASQUATCH_INDEX]];
            [super showAlert:@"Select":@"\n\n\n\n\n":buttons:ids:COUNT_ORIGINAL:COUNT_MAS_SASQUATCH];
        }
            break;
        case DIALOG_SASQUATCH:
        {
            [buttons addObject:@"Back"];
            [buttons addObject:@"OK"];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_CANCEL]];
            [ids addObject:[NSString stringWithFormat:@"%d", ID_SASQUATCH_INDEX]];
            [super showAlert:@"Select":@"\n\n\n\n\n":buttons:ids:COUNT_MAS_SASQUATCH:COUNT_SASQUATCH];
        }
            break;
        default:
            break;
    }
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
        case ID_OK:
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
