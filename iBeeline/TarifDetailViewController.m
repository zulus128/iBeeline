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
#import <QuartzCore/QuartzCore.h>

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
//                                                          [UIFont fontWithName:@"DSOfficinaSerif-Book" size:14],UITextAttributeFont,
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          nil] forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                          [UIFont fontWithName:@"DSOfficinaSerif-Book" size:14],UITextAttributeFont,
                                                          [UIColor blackColor], UITextAttributeTextColor,
                                                          nil] forState:UIControlStateHighlighted];
    
    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
    label.text = [[Common instance] getSelectedTarifName];
    label.textColor=[UIColor blackColor];
    label.backgroundColor =[UIColor clearColor];
    label.adjustsFontSizeToFitWidth=YES;
//    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;

    
//    self.navigationController.navigationItem.backBarButtonItem.tintColor = RGBCOLOR(0xED, 0x77, 0x03);
    

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
    
//    self.but1.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];
//    self.but2.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];

    
    [self fillContent:YES];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSLog(@"will1");

    [self.but2 setTitle: [[Common instance] getStringForKey:@"beeminus"] forState:UIControlStateNormal];

    [self fillContent:nbb];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    NSLog(@"did1");

    [self.but2 setTitle: [[Common instance] getStringForKey:@"beeminus"] forState:UIControlStateNormal];

    [self fillContent:nbb];

}

-(void) fillContent:(BOOL)nb {

    nbb = nb;
    
    for (UIView *subview in self.sv.subviews) {
        
        [subview removeFromSuperview];
    }
    
    [self.but1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.but1 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.but1 setBackgroundColor:nb?RGBCOLOR(0xF0, 0xBE, 0x32):RGBCOLOR(0xD0, 0xC8, 0xBA)];
    self.but1.layer.cornerRadius = 8;
    
    [self.but2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.but2 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.but2 setBackgroundColor:nb?RGBCOLOR(0xD0, 0xC8, 0xBA):RGBCOLOR(0xF0, 0xBE, 0x32)];
    self.but2.layer.cornerRadius = 8;
    
    
    Zone* zo = nb?[[Common instance] getBeelineZoneSelected]:[[Common instance] getOtherZoneSelected];
    
    int y = 50;
    
    UILabel* okgt = [[UILabel alloc] initWithFrame:CGRectMake(40, y - 40, 100, 50)];
    okgt.backgroundColor = [UIColor clearColor];
    okgt.textColor=[UIColor blackColor];
    okgt.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    okgt.numberOfLines = 0;
    okgt.text = [[Common instance] getStringForKey:@"t_out_kz"];
    [self.sv addSubview:okgt];
    UILabel* okg = [[UILabel alloc] initWithFrame:CGRectMake(40, y - 7, 70, 50)];
    okg.backgroundColor = [UIColor clearColor];
    okg.textColor=[UIColor blackColor];
    okg.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    okg.text = [NSString stringWithFormat:@"%.1f", zo.okg];
    [self.sv addSubview:okg];
    CGSize size = [okg.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
    UILabel* sign1 = [[UILabel alloc] initWithFrame:CGRectMake(45 + size.width, y - 5, 100, 50)];
    sign1.backgroundColor = [UIColor clearColor];
    sign1.textColor=[UIColor blackColor];
    sign1.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    sign1.text = [[Common instance] getStringForKey:@"min"];
    [self.sv addSubview:sign1];
    
    UILabel* loct = [[UILabel alloc] initWithFrame:CGRectMake(200, y - 40, 100, 50)];
    loct.backgroundColor = [UIColor clearColor];
    loct.textColor=[UIColor blackColor];
    loct.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    loct.numberOfLines = 0;
    loct.text = [[Common instance] getStringForKey:@"t_local"];
    [self.sv addSubview:loct];
    UILabel* loc = [[UILabel alloc] initWithFrame:CGRectMake(200, y - 7, 70, 50)];
    loc.backgroundColor = [UIColor clearColor];
    loc.textColor=[UIColor blackColor];
    loc.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    loc.text = [NSString stringWithFormat:@"%.1f", zo.loc];
    [self.sv addSubview:loc];
    size = [loc.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
    UILabel* sign2 = [[UILabel alloc] initWithFrame:CGRectMake(205 + size.width, y - 5, 100, 50)];
    sign2.backgroundColor = [UIColor clearColor];
    sign2.textColor=[UIColor blackColor];
    sign2.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    sign2.text = [[Common instance] getStringForKey:@"min"];
    [self.sv addSubview:sign2];
    
    y += 80;
    
    UILabel* outpt = [[UILabel alloc] initWithFrame:CGRectMake(40, y - 40, 120, 50)];
    outpt.backgroundColor = [UIColor clearColor];
    outpt.textColor=[UIColor blackColor];
    outpt.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    outpt.numberOfLines = 0;
    outpt.text = [[Common instance] getStringForKey:@"t_out"];
    [self.sv addSubview:outpt];
    UILabel* outp = [[UILabel alloc] initWithFrame:CGRectMake(40, y - 7, 70, 50)];
    outp.backgroundColor = [UIColor clearColor];
    outp.textColor=[UIColor blackColor];
    outp.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    outp.text = [NSString stringWithFormat:@"%.1f", zo.output];
    [self.sv addSubview:outp];
    size = [outp.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
    UILabel* sign3 = [[UILabel alloc] initWithFrame:CGRectMake(45 + size.width, y - 5, 100, 50)];
    sign3.backgroundColor = [UIColor clearColor];
    sign3.textColor=[UIColor blackColor];
    sign3.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    sign3.text = [[Common instance] getStringForKey:@"min"];
    [self.sv addSubview:sign3];
    
    UILabel* inpt = [[UILabel alloc] initWithFrame:CGRectMake(200, y - 40, 100, 50)];
    inpt.backgroundColor = [UIColor clearColor];
    inpt.textColor=[UIColor blackColor];
    inpt.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    inpt.numberOfLines = 0;
    inpt.text = [[Common instance] getStringForKey:@"t_input"];
    [self.sv addSubview:inpt];
    UILabel* inp = [[UILabel alloc] initWithFrame:CGRectMake(200, y - 7, 70, 50)];
    inp.backgroundColor = [UIColor clearColor];
    inp.textColor=[UIColor blackColor];
    inp.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    inp.text = [NSString stringWithFormat:@"%.1f", zo.input];
    [self.sv addSubview:inp];
    size = [inp.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
    UILabel* sign4 = [[UILabel alloc] initWithFrame:CGRectMake(205 + size.width, y - 5, 100, 50)];
    sign4.backgroundColor = [UIColor clearColor];
    sign4.textColor=[UIColor blackColor];
    sign4.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    sign4.text = [[Common instance] getStringForKey:@"min"];
    [self.sv addSubview:sign4];
    
    y += 80;
    
    UILabel* smst = [[UILabel alloc] initWithFrame:CGRectMake(40, y - 40, 100, 50)];
    smst.backgroundColor = [UIColor clearColor];
    smst.textColor=[UIColor blackColor];
    smst.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    smst.numberOfLines = 0;
    smst.text = [[Common instance] getStringForKey:@"t_sms"];
    [self.sv addSubview:smst];
    UILabel* sms = [[UILabel alloc] initWithFrame:CGRectMake(40, y - 17, 70, 50)];
    sms.backgroundColor = [UIColor clearColor];
    sms.textColor=[UIColor blackColor];
    sms.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
    sms.text = [NSString stringWithFormat:@"%.1f", zo.sms];
    [self.sv addSubview:sms];
    size = [sms.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
    UILabel* sign5 = [[UILabel alloc] initWithFrame:CGRectMake(45 + size.width, y - 15, 100, 50)];
    sign5.backgroundColor = [UIColor clearColor];
    sign5.textColor=[UIColor blackColor];
    sign5.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
    sign5.text = [[Common instance] getStringForKey:@"sign"];
    [self.sv addSubview:sign5];
    
    if(zo.gprs > 0) {
        
        UILabel* gprst = [[UILabel alloc] initWithFrame:CGRectMake(200, y - 40, 100, 50)];
        gprst.backgroundColor = [UIColor clearColor];
        gprst.textColor=[UIColor blackColor];
        gprst.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
        gprst.numberOfLines = 0;
        gprst.text = [[Common instance] getStringForKey:@"t_gprs"];
        [self.sv addSubview:gprst];
        UILabel* gprs = [[UILabel alloc] initWithFrame:CGRectMake(200, y - 17, 70, 50)];
        gprs.backgroundColor = [UIColor clearColor];
        gprs.textColor=[UIColor blackColor];
        gprs.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE];
        gprs.text = [NSString stringWithFormat:@"%.1f", zo.gprs];
        [self.sv addSubview:gprs];
        size = [gprs.text sizeWithFont:[UIFont fontWithName:@"DSOfficinaSerif-Book" size:FONTSIZE]];
        UILabel* sign6 = [[UILabel alloc] initWithFrame:CGRectMake(205 + size.width, y - 15, 100, 50)];
        sign6.backgroundColor = [UIColor clearColor];
        sign6.textColor=[UIColor blackColor];
        sign6.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
        sign6.text = [[Common instance] getStringForKey:@"sign"];
        [self.sv addSubview:sign6];
        UILabel* sign61 = [[UILabel alloc] initWithFrame:CGRectMake(120 , y + 3, 200, 70)];
        sign61.backgroundColor = [UIColor clearColor];
        sign61.textColor=[UIColor blackColor];
        sign61.numberOfLines = 0;
        sign61.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:SFONTSIZE];
        sign61.text = [[Common instance] getStringForKey:@"access_gprs"];
        [self.sv addSubview:sign61];
        y += 30;
    }
    
    y += 40;

    NSString* altname = [[Common instance] getAltNameSelected:nb];
//    NSLog(@"altname = %@", altname);
    if((altname !=nil) && (![altname isEqualToString:@""])) {
        
        UILabel* alt = [[UILabel alloc] initWithFrame:CGRectMake(0, y, 320, 50)];
        alt.backgroundColor = RGBCOLOR(0xD0, 0xC8, 0xBA);//[UIColor colorWithRed:119/255 green:136/255 blue:153/255 alpha:0.1f];
        alt.textColor=[UIColor blackColor];
        alt.numberOfLines = 0;
        alt.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:LFONTSIZE];
        alt.text = [NSString stringWithFormat:@"          %@ \n          %@", [[Common instance] getStringForKey:@"t_opsos"], altname];
        [self.sv addSubview:alt];
        y += 60;
        
    }
    

    for (NSNumber* i in zo.services) {
        
//        NSLog(@"serv = %@", i);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [button setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];
        button.layer.cornerRadius = 8;
        
        button.tag = i.intValue;
//        [button addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchDown];
        
        [button addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(changeButtonBackGroundColor:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(changeButtonBackGroundColor1:) forControlEvents:UIControlEventTouchUpOutside];

        
        [button setTitle:[[Common instance] getServiceName:i.intValue] forState:UIControlStateNormal];
        button.frame = CGRectMake(20.0, y, 280.0, 40.0);
//        button.titleLabel.font = [UIFont fontWithName:@"DSOfficinaSerif-Bold" size:BUTTON_FONT];
        [self.sv addSubview:button];
        
        y += 43;

    }

    
    self.sv.contentSize = CGSizeMake(320, y + 20);
}

-(void)changeButtonBackGroundColor:(id) sender {
    
    [sender setBackgroundColor:RGBCOLOR(0xED, 0x77, 0x03)];
}

-(void)changeButtonBackGroundColor1:(id) sender {
    
    [sender setBackgroundColor:RGBCOLOR(0xF0, 0xBE, 0x32)];
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
