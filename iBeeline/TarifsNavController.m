//
//  TarifsNavController.m
//  iBeeline
//
//  Created by вадим on 7/14/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "TarifsNavController.h"
#import "Common.h"

@interface TarifsNavController ()

@end

@implementation TarifsNavController

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
    
//    self.title = NSLocalizedString(@"Tarifs", nil);
    
    self.navigationBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);
    self.tabBarController.tabBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                       [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16],UITextAttributeFont,
                                                       [UIColor blackColor], UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0.0, -10.0)];
    
}

- (void)viewWillAppear:(BOOL)animated {

    self.title = [[Common instance] getStringForKey:@"Tarifs"];
    NSArray *tabBarItemTitles = [NSArray arrayWithObjects: [[Common instance] getStringForKey:@"Tarifs"],
                                 [[Common instance] getStringForKey:@"news_header"],
                                 [[Common instance] getStringForKey:@"tab_roaming"],
                                 [[Common instance] getStringForKey:@"tab_balans"],
                                 @"FAQ",
                                 [[Common instance] getStringForKey:@"mnu_setting"],
                                 nil];
    
    for (UITabBarItem *item in self.tabBarController.tabBar.items)
        item.title = [tabBarItemTitles objectAtIndex: [self.tabBarController.tabBar.items indexOfObject: item]];

    self.tabBarController.moreNavigationController.navigationBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
