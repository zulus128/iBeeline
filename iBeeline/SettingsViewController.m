//
//  SettingsViewController.m
//  iBeeline
//
//  Created by Zul on 7/30/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "SettingsViewController.h"
#import "Common.h"
#import <QuartzCore/QuartzCore.h>
#import "AboutViewController.h"

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
//    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;
    
    self.navigationController.navigationBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);
    
//    self.title = NSLocalizedString(@"mnu_setting", nil);
    
    
    [self.langbut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.langbut setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.langbut setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];
    self.langbut.layer.cornerRadius = 8;
    //    [self.langbut addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.langbut addTarget:self action:@selector(changeButtonBackGroundColor:) forControlEvents:UIControlEventTouchDown];
    [self.langbut addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpInside];
    [self.langbut addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpOutside];
//    self.langbut.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];
    
    [self.aboutbut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.aboutbut setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.aboutbut setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];
    self.aboutbut.layer.cornerRadius = 8;
    [self.aboutbut addTarget:self action:@selector(changeButtonBackGroundColor:) forControlEvents:UIControlEventTouchDown];
    [self.aboutbut addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpInside];
    [self.aboutbut addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpOutside];
    //    self.aboutbut.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];
    
    [self.loadbut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.loadbut setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.loadbut setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];
    self.loadbut.layer.cornerRadius = 8;
    [self.loadbut addTarget:self action:@selector(changeButtonBackGroundColor:) forControlEvents:UIControlEventTouchDown];
    [self.loadbut addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpOutside];
    [self.loadbut addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpInside];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          //                                                          [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16],UITextAttributeFont,
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          nil] forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          //                                                          [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16],UITextAttributeFont,
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          nil] forState:UIControlStateHighlighted];

    self.loadlab.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:13];
//    self.langlab.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];


}

-(void)changeButtonBackGroundColor:(id) sender {
    
    [sender setBackgroundColor:RGBCOLOR(0xED, 0x77, 0x03)];
}

-(void)changeButtonBackGroundColor1:(id) sender {
    
    [sender setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];
}

- (void)viewWillAppear:(BOOL)animated {


    label.text = [[Common instance] getStringForKey:@"mnu_setting"];
    self.title = [[Common instance] getStringForKey:@"mnu_setting"];
    
    self.langlab.text = [[Common instance] getStringForKey:@"set_lang"];
    [self.langbut setTitle: [[Common instance] getStringForKey:@"lang_ru"] forState:UIControlStateNormal];
    [self.aboutbut setTitle: [[Common instance] getStringForKey:@"set_about"] forState:UIControlStateNormal];
    [self.loadbut setTitle: [[Common instance] getStringForKey:@"mnu_update"] forState:UIControlStateNormal];

    [self.aboutbut setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];
    [self.loadbut setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];


    [self setTimeLabel];
    
    //   NSLog(@"will %@", label.text);
}

-(void) setTimeLabel {

    NSDate* date = [[NSDate alloc] initWithTimeIntervalSince1970:(NSTimeInterval)[Common instance].timestamp];
    //    NSLog(@"date = %@", date);
    NSDateFormatter *dFormat = [[NSDateFormatter alloc] init];
    [dFormat setDateStyle:NSDateFormatterMediumStyle];
    [dFormat setDateFormat:@"dd.MM.yyyy"];
    
    NSString *theDate = [dFormat stringFromDate:date];
    self.loadlab.text = [[[Common instance] getStringForKey:@"lastdate"] stringByAppendingString:theDate];

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
                                 [[Common instance] getStringForKey:@"news_header"],
                                 [[Common instance] getStringForKey:@"tab_roaming"],
                                 [[Common instance] getStringForKey:@"tab_balans"],
                                 @"FAQ",
                                 [[Common instance] getStringForKey:@"mnu_setting"],
                                 nil];
    
    for (UITabBarItem *item in self.tabBarController.tabBar.items)
        item.title = [tabBarItemTitles objectAtIndex: [self.tabBarController.tabBar.items indexOfObject: item]];

    [self viewWillAppear:NO];
}

-(IBAction) bt2:(id) sender {
    
    //    [self performSelector:@selector(goabout) withObject:nil afterDelay:0.1f];
    
    AboutViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"about"];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

-(IBAction) bt3:(id) sender {
    
    [self performSelector:@selector(gobt3) withObject:nil afterDelay:0.5f];

    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    [[Common instance] loadData];
    
    [self setTimeLabel];

    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

}

-(void) gobt3 {

    [self.loadbut setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
