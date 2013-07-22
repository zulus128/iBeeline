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
    
//    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
//    label.text = [[Common instance] getSelectedTarifName];
//    label.textColor=[UIColor whiteColor];
//    label.backgroundColor =[UIColor clearColor];
//    label.adjustsFontSizeToFitWidth=YES;
//    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
//    label.textAlignment = NSTextAlignmentCenter;
//    self.navigationItem.titleView=label;

//    CGRect newBounds = self.wv.bounds;
//    newBounds.size.height = 350;//webView.scrollView.contentSize.height;
//    self.wv.bounds = newBounds;
    
//    for(NSLayoutConstraint *constraint in self.wv.constraints) {
//        
//        if(constraint.firstAttribute == NSLayoutAttributeHeight &&
//           constraint.firstItem == self.wv) {
//            
//            NSLog(@"found!");
//            constraint.constant = 250;
////            translatesAutoresizingMaskIntoConstraints
//        }
//    }

//    [self.wv setTranslatesAutoresizingMaskIntoConstraints:NO];
//    self.wv_height.constant = 300;

    [self.wv loadHTMLString:[[Common instance] getSelectedServiceText] baseURL:nil];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    self.wv_height.constant = webView.scrollView.contentSize.height;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
