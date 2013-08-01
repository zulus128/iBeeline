//
//  BalansViewController.m
//  iBeeline
//
//  Created by Zul on 7/30/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "BalansViewController.h"
#import "Common.h"
#import <QuartzCore/QuartzCore.h>

@interface BalansViewController ()

@end

@implementation BalansViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
//    label.text = NSLocalizedString(@"tab_balans", nil);
    label.textColor=[UIColor blackColor];
    label.backgroundColor =[UIColor clearColor];
    label.adjustsFontSizeToFitWidth=YES;
//    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;
    
    self.navigationController.navigationBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);

//    self.title = NSLocalizedString(@"tab_balans", nil);

//    self.tv1.text = NSLocalizedString(@"post_balans", nil);
//    self.tv2.text = NSLocalizedString(@"pre_balans", nil);
//    self.tv3.text = NSLocalizedString(@"balans", nil);
    self.tv1.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:18];
    self.tv2.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:18];
    self.tv3.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:18];
    

    
    [self.bu1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.bu1 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.bu1 setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];
    self.bu1.layer.cornerRadius = 8;
    self.bu1.tag = 1;
    [self.bu1 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.bu1 addTarget:self action:@selector(changeButtonBackGroundColor:) forControlEvents:UIControlEventTouchDown];
    [self.bu1 addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpInside];
    [self.bu1 addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpOutside];
//    [self.bu1 setTitle:NSLocalizedString(@"btn_pre", nil) forState:UIControlStateNormal];
//    self.bu1.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];
    
    [self.bu2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.bu2 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.bu2 setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];
    self.bu2.layer.cornerRadius = 8;
    self.bu2.tag = 2;
    [self.bu2 addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.bu2 addTarget:self action:@selector(changeButtonBackGroundColor:) forControlEvents:UIControlEventTouchDown];
    [self.bu2 addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpInside];
    [self.bu2 addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpOutside];
//    [self.bu2 setTitle:NSLocalizedString(@"btn_pre", nil) forState:UIControlStateNormal];
//    self.bu2.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    [infoButton setFrame:CGRectMake(40,5,32,32)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    
}

- (void) showInfo {
    
    UIViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"info"];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    
    label.text = [[Common instance] getStringForKey:@"tab_balans"];
    self.title = [[Common instance] getStringForKey:@"tab_balans"];
    self.tv1.text = [[Common instance] getStringForKey:@"post_balans"];
    self.tv2.text = [[Common instance] getStringForKey:@"pre_balans"];
    self.tv3.text = [[Common instance] getStringForKey:@"balans"];
    [self.bu1 setTitle:[[Common instance] getStringForKey:@"btn_pre"] forState:UIControlStateNormal];
    [self.bu2 setTitle:[[Common instance] getStringForKey:@"btn_pre"] forState:UIControlStateNormal];

    
}
-(void)changeButtonBackGroundColor:(id) sender {
    
    [sender setBackgroundColor:RGBCOLOR(0xED, 0x77, 0x03)];
}

-(void)changeButtonBackGroundColor1:(id) sender {
    
    [sender setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];
}

-(void) aMethod:(id) sender {
    
    UIButton* b = (UIButton*)sender;
    [self sendSMS:@"  " recipientList:[NSArray arrayWithObjects:(b.tag == 1)?@"081":@"102", nil]];
}

- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients {
    
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText]) {
        
        controller.body = bodyOfMessage;
        controller.recipients = recipients;
        controller.messageComposeDelegate = self;
//        [self presentModalViewController:controller animated:YES];
        [self presentViewController:controller animated:YES completion:NULL];

    }
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
//    [self dismissModalViewControllerAnimated:YES];
    [controller dismissViewControllerAnimated:YES completion:NULL];
    
    if (result == MessageComposeResultCancelled)
        NSLog(@"Message cancelled");
        else if (result == MessageComposeResultSent)
            NSLog(@"Message sent");
            else 
                NSLog(@"Message failed");
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
