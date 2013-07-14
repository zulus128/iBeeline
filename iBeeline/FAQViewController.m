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
    
    UILabel* label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
    label.text=@"FAQ";
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
    
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    [label setText:[[Common instance] getFAQname:indexPath.row]];
    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];

    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [Common instance].selectedFAQ = indexPath.row;

    FAQDetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailFAQ"];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
