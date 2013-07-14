//
//  TarifDetailViewController.m
//  iBeeline
//
//  Created by вадим on 7/14/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "TarifDetailViewController.h"
#import "Common.h"

@interface TarifDetailViewController ()

@end

@implementation TarifDetailViewController

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
    
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    [attributes setValue:[UIColor colorWithRed:(163.0f/255.0f) green:(0.0f) blue:(0.0f) alpha:1.0f] forKey:UITextAttributeTextColor];
//    [attributes setValue:[UIColor clearColor] forKey:UITextAttributeTextShadowColor];
//    [attributes setValue:[NSValue valueWithUIOffset:UIOffsetMake(0.0, 0.0)] forKey:UITextAttributeTextShadowOffset];
//    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16],UITextAttributeFont,
                                        nil] forState:UIControlStateNormal];
    
    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
    label.text = [[Common instance] getSelectedTarifName];
    label.textColor=[UIColor whiteColor];
    label.backgroundColor =[UIColor clearColor];
    label.adjustsFontSizeToFitWidth=YES;
    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
