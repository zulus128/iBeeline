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
#import "ServiceDetailViewController.h"

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

-(IBAction) bt1:(id) sender {
    
    NSLog(@"but1");
    
    [self fillContent:YES];

}

-(IBAction) bt2:(id) sender {

    NSLog(@"but2");

    [self fillContent:NO];

}

- (void)viewDidLoad {
    
    [super viewDidLoad];

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

    self.title = [[Common instance] getSelectedTarifName];

    float top;
    if([Common instance].isBeeZone) {
        
        self.but1.enabled = YES;
        self.but2.enabled = YES;
        self.but1.hidden = NO;
        self.but2.hidden = NO;
        top = 61.0f;
    }
    else {

        self.but1.enabled = NO;
        self.but2.enabled = NO;
        self.but1.hidden = YES;
        self.but2.hidden = YES;
        top = 0.0f;
    }

    for(NSLayoutConstraint *constraint in self.view.constraints) {
        
        if(constraint.firstAttribute == NSLayoutAttributeTop &&
           constraint.firstItem == self.sv && constraint.secondItem == self.view) {
            
//            NSLog(@"found!");
            constraint.constant = top;
        }
    }
    
    [self.but2 setTitle: NSLocalizedString(@"beeminus", nil) forState:UIControlStateNormal];
    self.but1.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];
    self.but2.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];

    [self fillContent:YES];
    
}

-(void) fillContent:(BOOL)nb {

    for (UIView *subview in self.sv.subviews) {
        
        [subview removeFromSuperview];
    }
    
    Zone* zo = nb?[[Common instance] getBeelineZoneSelected]:[[Common instance] getOtherZoneSelected];
    
    int y = 50;
    
    UILabel* okgt = [[UILabel alloc] initWithFrame:CGRectMake(40, y - 40, 100, 50)];
    okgt.backgroundColor = [UIColor clearColor];
    okgt.textColor=[UIColor blackColor];
    okgt.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    okgt.numberOfLines = 0;
    okgt.text = NSLocalizedString(@"t_out_kz", nil);
    [self.sv addSubview:okgt];
    UILabel* okg = [[UILabel alloc] initWithFrame:CGRectMake(40, y, 70, 50)];
    okg.backgroundColor = [UIColor clearColor];
    okg.textColor=[UIColor blackColor];
    okg.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    okg.text = [NSString stringWithFormat:@"%.1f", zo.okg];
    [self.sv addSubview:okg];
    CGSize size = [okg.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
    UILabel* sign1 = [[UILabel alloc] initWithFrame:CGRectMake(45 + size.width, y + 2, 100, 50)];
    sign1.backgroundColor = [UIColor clearColor];
    sign1.textColor=[UIColor blackColor];
    sign1.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    sign1.text = NSLocalizedString(@"min", nil);
    [self.sv addSubview:sign1];
    
    UILabel* loct = [[UILabel alloc] initWithFrame:CGRectMake(200, y - 40, 100, 50)];
    loct.backgroundColor = [UIColor clearColor];
    loct.textColor=[UIColor blackColor];
    loct.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    loct.numberOfLines = 0;
    loct.text = NSLocalizedString(@"t_local", nil);
    [self.sv addSubview:loct];
    UILabel* loc = [[UILabel alloc] initWithFrame:CGRectMake(200, y, 70, 50)];
    loc.backgroundColor = [UIColor clearColor];
    loc.textColor=[UIColor blackColor];
    loc.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    loc.text = [NSString stringWithFormat:@"%.1f", zo.loc];
    [self.sv addSubview:loc];
    size = [loc.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
    UILabel* sign2 = [[UILabel alloc] initWithFrame:CGRectMake(205 + size.width, y + 2, 100, 50)];
    sign2.backgroundColor = [UIColor clearColor];
    sign2.textColor=[UIColor blackColor];
    sign2.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    sign2.text = NSLocalizedString(@"min", nil);
    [self.sv addSubview:sign2];
    
    y += 80;
    
    UILabel* outpt = [[UILabel alloc] initWithFrame:CGRectMake(40, y - 40, 120, 50)];
    outpt.backgroundColor = [UIColor clearColor];
    outpt.textColor=[UIColor blackColor];
    outpt.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    outpt.numberOfLines = 0;
    outpt.text = NSLocalizedString(@"t_out", nil);
    [self.sv addSubview:outpt];
    UILabel* outp = [[UILabel alloc] initWithFrame:CGRectMake(40, y, 70, 50)];
    outp.backgroundColor = [UIColor clearColor];
    outp.textColor=[UIColor blackColor];
    outp.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    outp.text = [NSString stringWithFormat:@"%.1f", zo.output];
    [self.sv addSubview:outp];
    size = [outp.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
    UILabel* sign3 = [[UILabel alloc] initWithFrame:CGRectMake(45 + size.width, y + 2, 100, 50)];
    sign3.backgroundColor = [UIColor clearColor];
    sign3.textColor=[UIColor blackColor];
    sign3.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    sign3.text = NSLocalizedString(@"min", nil);
    [self.sv addSubview:sign3];
    
    UILabel* inpt = [[UILabel alloc] initWithFrame:CGRectMake(200, y - 40, 100, 50)];
    inpt.backgroundColor = [UIColor clearColor];
    inpt.textColor=[UIColor blackColor];
    inpt.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    inpt.numberOfLines = 0;
    inpt.text = NSLocalizedString(@"t_input", nil);
    [self.sv addSubview:inpt];
    UILabel* inp = [[UILabel alloc] initWithFrame:CGRectMake(200, y, 70, 50)];
    inp.backgroundColor = [UIColor clearColor];
    inp.textColor=[UIColor blackColor];
    inp.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    inp.text = [NSString stringWithFormat:@"%.1f", zo.input];
    [self.sv addSubview:inp];
    size = [inp.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
    UILabel* sign4 = [[UILabel alloc] initWithFrame:CGRectMake(205 + size.width, y + 2, 100, 50)];
    sign4.backgroundColor = [UIColor clearColor];
    sign4.textColor=[UIColor blackColor];
    sign4.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    sign4.text = NSLocalizedString(@"min", nil);
    [self.sv addSubview:sign4];
    
    y += 80;
    
    UILabel* smst = [[UILabel alloc] initWithFrame:CGRectMake(40, y - 40, 100, 50)];
    smst.backgroundColor = [UIColor clearColor];
    smst.textColor=[UIColor blackColor];
    smst.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    smst.numberOfLines = 0;
    smst.text = NSLocalizedString(@"t_sms", nil);
    [self.sv addSubview:smst];
    UILabel* sms = [[UILabel alloc] initWithFrame:CGRectMake(40, y, 70, 50)];
    sms.backgroundColor = [UIColor clearColor];
    sms.textColor=[UIColor blackColor];
    sms.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    sms.text = [NSString stringWithFormat:@"%.1f", zo.sms];
    [self.sv addSubview:sms];
    size = [sms.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
    UILabel* sign5 = [[UILabel alloc] initWithFrame:CGRectMake(45 + size.width, y + 2, 100, 50)];
    sign5.backgroundColor = [UIColor clearColor];
    sign5.textColor=[UIColor blackColor];
    sign5.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    sign5.text = NSLocalizedString(@"sign", nil);
    [self.sv addSubview:sign5];
    
    UILabel* gprst = [[UILabel alloc] initWithFrame:CGRectMake(200, y - 40, 100, 50)];
    gprst.backgroundColor = [UIColor clearColor];
    gprst.textColor=[UIColor blackColor];
    gprst.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    gprst.numberOfLines = 0;
    gprst.text = NSLocalizedString(@"t_gprs", nil);
    [self.sv addSubview:gprst];
    UILabel* gprs = [[UILabel alloc] initWithFrame:CGRectMake(200, y, 70, 50)];
    gprs.backgroundColor = [UIColor clearColor];
    gprs.textColor=[UIColor blackColor];
    gprs.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    gprs.text = [NSString stringWithFormat:@"%.1f", zo.gprs];
    [self.sv addSubview:gprs];
    size = [gprs.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
    UILabel* sign6 = [[UILabel alloc] initWithFrame:CGRectMake(205 + size.width, y + 2, 100, 50)];
    sign6.backgroundColor = [UIColor clearColor];
    sign6.textColor=[UIColor blackColor];
    sign6.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    sign6.text = NSLocalizedString(@"sign", nil);
    [self.sv addSubview:sign6];
    
    y += 60;

    for (NSNumber* i in zo.services) {
        
//        NSLog(@"serv = %@", i);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.tag = i.intValue;
        [button addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchDown];
        [button setTitle:[[Common instance] getServiceName:i.intValue] forState:UIControlStateNormal];
        button.frame = CGRectMake(20.0, y, 280.0, 40.0);
        button.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];
        [self.sv addSubview:button];
        
        y += 40;

    }

    self.sv.contentSize = CGSizeMake(320, y + 20);
}

-(void) aMethod:(id) sender {

    NSLog(@"serv = %d", ((UIButton*)sender).tag);

    [Common instance].selectedService = ((UIButton*)sender).tag;
    
    ServiceDetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailService"];
    [self.navigationController pushViewController:detailVC animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
