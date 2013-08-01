//
//  NewsDetailViewController.m
//  iBeeline
//
//  Created by Zul on 7/31/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "Common.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

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
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          //                                                          [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16],UITextAttributeFont,
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          nil] forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          //                                                          [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16],UITextAttributeFont,
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          nil] forState:UIControlStateHighlighted];

    label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
    label.textColor=[UIColor blackColor];
    label.backgroundColor =[UIColor clearColor];
    label.adjustsFontSizeToFitWidth=YES;
    //    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;
    
    self.navigationController.navigationBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);

    label.text = [[Common instance] getSelectedNewsTitle];

    [self.wv loadHTMLString:[[Common instance] getSelectedNewsText] baseURL:nil];

    self.lab.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:14];
    self.lab.text = [[Common instance] getSelectedNewsTime];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
