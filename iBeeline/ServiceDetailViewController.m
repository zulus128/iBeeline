//
//  ServiceDetailViewController.m
//  iBeeline
//
//  Created by Zul on 7/22/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "ServiceDetailViewController.h"
#import "Common.h"

@interface ServiceDetailViewController ()

@end

@implementation ServiceDetailViewController

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
    
    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
    label.text = [[Common instance] getSelectedServiceName];
    label.textColor=[UIColor blackColor];
    label.backgroundColor =[UIColor clearColor];
    label.adjustsFontSizeToFitWidth=YES;
    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;


    [self.wv loadHTMLString:[[Common instance] getSelectedServiceText] baseURL:nil];

    self.but1.hidden = YES;
    self.but2.hidden = YES;
    
    [self.but1 setTitle: NSLocalizedString(@"btn_roaming_on", nil) forState:UIControlStateNormal];
    [self.but2 setTitle: NSLocalizedString(@"btn_roaming_off", nil) forState:UIControlStateNormal];
    self.but1.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];
    self.but2.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    self.wv_height.constant = webView.scrollView.contentSize.height;

//    self.sv.bounces = NO;
    self.wv.scrollView.scrollEnabled = NO;
    
//    self.but1.hidden = NO;
//    self.but2.hidden = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
