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
	// Do any additional setup after loading the view.
    
    self.title = NSLocalizedString(@"Tarifs", nil);
    
    self.navigationBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);

//    [self.navigationItem.backBarButtonItem setTitleTextAttributes:
//     [NSDictionary dictionaryWithObjectsAndKeys:
//      [UIColor blackColor], UITextAttributeTextColor,
//      nil]    forState:UIControlStateNormal];

    self.tabBarController.tabBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);

//    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithDictionary: [[UITabBarItem appearance] titleTextAttributesForState:UIControlStateNormal]];
//    [attributes setValue:[UIFont fontWithName:@"Avenir" size:10] forKey:UITextAttributeFont];
//    [[UITabBarItem appearance] setTitleTextAttributes:attributes1 forState:UIControlStateNormal];
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIFont fontWithName:@"DSOfficinaSerif-Book" size:18],UITextAttributeFont,
                                                       [UIColor blackColor], UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0.0, -10.0)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
