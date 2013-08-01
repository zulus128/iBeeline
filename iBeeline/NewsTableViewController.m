//
//  NewsTableViewController.m
//  iBeeline
//
//  Created by Zul on 7/31/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "NewsTableViewController.h"
#import "Common.h"
#import <QuartzCore/QuartzCore.h>

@interface NewsTableViewController ()

@end

@implementation NewsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
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
    
    label.text = [[Common instance] getStringForKey:@"news_header"];
    self.title = [[Common instance] getStringForKey:@"news_header"];
    
    [self.tableView reloadData];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    //    NSLog(@"did");
    
    label.text = [[Common instance] getStringForKey:@"news_header"];
    self.title = [[Common instance] getStringForKey:@"news_header"];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[Common instance] getNewsCnt];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"newCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UILabel *labe = (UILabel *)[cell viewWithTag:100];
    [labe setText:[[Common instance] getNewsTime:indexPath.row]];
    labe.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:12];
    
    UILabel *labe1 = (UILabel *)[cell viewWithTag:101];
    [labe1 setText:[[Common instance] getNewsTitle:indexPath.row]];
    labe1.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:16];
    labe1.textColor = RGBCOLOR(0xF0, 0xBE, 0x32);

    UILabel *labe2 = (UILabel *)[cell viewWithTag:102];
    [labe2 setText:[[Common instance] getNewsTextTrimmed:indexPath.row]];
    labe2.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:13];
    labe2.numberOfLines = 0;
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = RGBCOLOR(0xF0, 0xBE, 0x32);
    bgColorView.layer.cornerRadius = 7;
    bgColorView.layer.masksToBounds = YES;
    [cell setSelectedBackgroundView:bgColorView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 75;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [Common instance].selectedNews = indexPath.row;
    
    UIViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailNews"];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
