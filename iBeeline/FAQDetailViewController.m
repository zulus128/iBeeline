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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.wview loadHTMLString:[[Common instance] getSelectedFAQtext] baseURL:nil];

    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16],UITextAttributeFont,
                                                          nil] forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
