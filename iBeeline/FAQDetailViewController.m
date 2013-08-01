//
//  FAQDetailViewController.m
//  iBeeline
//
//  Created by вадим on 7/14/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "FAQDetailViewController.h"
#import "Common.h"

@interface FAQDetailViewController ()

@end

@implementation FAQDetailViewController

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

    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                          [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16],UITextAttributeFont,
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          nil] forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                          [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16],UITextAttributeFont,
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          nil] forState:UIControlStateHighlighted];

//    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                          [UIFont fontWithName:@"Helvetica" size:14],UITextAttributeFont,
//                                                          [UIColor blackColor], UITextAttributeTextColor,
//                                                          nil] forState:UIControlStateNormal];
//    
//    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                          [UIFont fontWithName:@"Helvetica" size:14],UITextAttributeFont,
//                                                          [UIColor blackColor], UITextAttributeTextColor,
//                                                          nil] forState:UIControlStateHighlighted];
    
    label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
    label.textColor=[UIColor blackColor];
    label.backgroundColor =[UIColor clearColor];
    label.adjustsFontSizeToFitWidth=YES;
    //    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [self.wview loadHTMLString:[[Common instance] getSelectedFAQtext] baseURL:nil];
    
    label.text = [[Common instance] getSelectedFAQname];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
