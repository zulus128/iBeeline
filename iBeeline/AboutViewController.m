//
//  AboutViewController.m
//  iBeeline
//
//  Created by Zul on 7/30/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "AboutViewController.h"
#import "Common.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    
    self.tv1.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:18];

    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                          [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16],UITextAttributeFont,
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          nil] forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                          [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16],UITextAttributeFont,
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          nil] forState:UIControlStateHighlighted];
    label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
    //    label.text = NSLocalizedString(@"mnu_setting", nil);
    label.textColor=[UIColor blackColor];
    label.backgroundColor =[UIColor clearColor];
    label.adjustsFontSizeToFitWidth=YES;
    //    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;
}

- (void)viewWillAppear:(BOOL)animated {
    
    label.text = [[Common instance] getStringForKey:@"set_about"];
    self.tv1.text = [[Common instance] getStringForKey:@"about_text"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
