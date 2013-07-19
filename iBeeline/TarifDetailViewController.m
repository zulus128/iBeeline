//
//  TarifDetailViewController.m
//  iBeeline
//
//  Created by вадим on 7/14/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "TarifDetailViewController.h"
#import "Common.h"
#import "Zone.h"

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

    Zone* zo = [[Common instance] getZoneSelected];
    
    int y = 100;
    
    UILabel* okg = [[UILabel alloc] initWithFrame:CGRectMake(40, y, 70, 50)];
    okg.backgroundColor = [UIColor clearColor];
    okg.textColor=[UIColor blackColor];
    okg.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    okg.text = [NSString stringWithFormat:@"%.1f", zo.okg];
    [self.view addSubview:okg];
    UILabel* loc = [[UILabel alloc] initWithFrame:CGRectMake(200, y, 70, 50)];
    loc.backgroundColor = [UIColor clearColor];
    loc.textColor=[UIColor blackColor];
    loc.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    loc.text = [NSString stringWithFormat:@"%.1f", zo.loc];
    [self.view addSubview:loc];

    y += 80;
    
    UILabel* outp = [[UILabel alloc] initWithFrame:CGRectMake(40, y, 70, 50)];
    outp.backgroundColor = [UIColor clearColor];
    outp.textColor=[UIColor blackColor];
    outp.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    outp.text = [NSString stringWithFormat:@"%.1f", zo.output];
    [self.view addSubview:outp];
    UILabel* inp = [[UILabel alloc] initWithFrame:CGRectMake(200, y, 70, 50)];
    inp.backgroundColor = [UIColor clearColor];
    inp.textColor=[UIColor blackColor];
    inp.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    inp.text = [NSString stringWithFormat:@"%.1f", zo.input];
    [self.view addSubview:inp];

    y += 80;
    
    UILabel* sms = [[UILabel alloc] initWithFrame:CGRectMake(40, y, 70, 50)];
    sms.backgroundColor = [UIColor clearColor];
    sms.textColor=[UIColor blackColor];
    sms.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    sms.text = [NSString stringWithFormat:@"%.1f", zo.sms];
    [self.view addSubview:sms];
    UILabel* gprs = [[UILabel alloc] initWithFrame:CGRectMake(200, y, 70, 50)];
    gprs.backgroundColor = [UIColor clearColor];
    gprs.textColor=[UIColor blackColor];
    gprs.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    gprs.text = [NSString stringWithFormat:@"%.1f", zo.gprs];
    [self.view addSubview:gprs];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
