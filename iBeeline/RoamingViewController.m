//
//  RoamingViewController.m
//  iBeeline
//
//  Created by Zul on 7/31/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "RoamingViewController.h"
#import "Common.h"

@interface RoamingViewController ()

@end

@implementation RoamingViewController

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
    
    label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
    label.textColor=[UIColor blackColor];
    label.backgroundColor =[UIColor clearColor];
    label.adjustsFontSizeToFitWidth=YES;
    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;
    
    self.navigationController.navigationBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);
    
    self.tv1.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:14];

}

- (void)viewWillAppear:(BOOL)animated {
    
    
    label.text = [[Common instance] getStringForKey:@"tab_roaming"];
    self.title = [[Common instance] getStringForKey:@"tab_roaming"];
    
    self.tv1.text = [[Common instance] getStringForKey:@"roaming"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
