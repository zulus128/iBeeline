//
//  SettingsViewController.m
//  iBeeline
//
//  Created by Zul on 7/30/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "SettingsViewController.h"
#import "Common.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
//    label.text = NSLocalizedString(@"mnu_setting", nil);
    label.textColor=[UIColor blackColor];
    label.backgroundColor =[UIColor clearColor];
    label.adjustsFontSizeToFitWidth=YES;
    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;
    
    self.navigationController.navigationBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);
    
//    self.title = NSLocalizedString(@"mnu_setting", nil);
    
}

- (void)viewWillAppear:(BOOL)animated {


  label.text = [[Common instance] getStringForKey:@"mnu_setting"];
  self.title = [[Common instance] getStringForKey:@"mnu_setting"];
    
//   NSLog(@"will %@", label.text);
}

-(IBAction) bt1:(id) sender {
    
    BOOL l = [[NSUserDefaults standardUserDefaults] boolForKey:@"language"];
    NSLog(@"lang = %d", l);
    l = !l;
    [[NSUserDefaults standardUserDefaults] setBool:l forKey:@"language"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    NSString* path = [[NSBundle mainBundle] pathForResource:(l?@"kk-KZ":@"ru") ofType:@"lproj"];
    [Common instance].languageBundle = [NSBundle bundleWithPath:path];
    
    self.title = [[Common instance] getStringForKey:@"Tarifs"];
    NSArray *tabBarItemTitles = [NSArray arrayWithObjects: [[Common instance] getStringForKey:@"Tarifs"],
                                 [[Common instance] getStringForKey:@"tab_balans"],
                                 @"FAQ",
                                 [[Common instance] getStringForKey:@"mnu_setting"], nil];
    
    for (UITabBarItem *item in self.tabBarController.tabBar.items)
        item.title = [tabBarItemTitles objectAtIndex: [self.tabBarController.tabBar.items indexOfObject: item]];

    [self viewWillAppear:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
