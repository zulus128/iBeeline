//
//  FAQViewController.m
//  iBeeline
//
//  Created by вадим on 7/14/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "FAQViewController.h"
#import "Common.h"
#import "FAQDetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface FAQViewController ()

@end

@implementation FAQViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
    label.text=@"FAQ";
    label.textColor=[UIColor blackColor];
    label.backgroundColor =[UIColor clearColor];
    label.adjustsFontSizeToFitWidth=YES;
//    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;
    self.navigationController.navigationBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);
    
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
    
    //    NSLog(@"will");
    
    
    [self.tableView reloadData];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    //    NSLog(@"did");
    
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[Common instance] getFAQcnt];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    // Configure the cell...
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
    
    UILabel *labe = (UILabel *)[cell viewWithTag:100];
    [labe setText:[[Common instance] getFAQname:indexPath.row]];
    labe.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];

    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = RGBCOLOR(0xF0, 0xBE, 0x32);
    bgColorView.layer.cornerRadius = 7;
    bgColorView.layer.masksToBounds = YES;
    [cell setSelectedBackgroundView:bgColorView];

    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [Common instance].selectedFAQ = indexPath.row;

    FAQDetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailFAQ"];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
