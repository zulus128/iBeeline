//
//  TarifsViewController.m
//  iBeeline
//
//  Created by вадим on 7/14/13.
//  Copyright (c) 2013 Zul. All rights reserved.
//

#import "TarifsViewController.h"
#import "Common.h"
#import "TarifDetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TarifsViewController ()

@end

@implementation TarifsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    label=[[UILabel alloc] initWithFrame:CGRectMake(0,0, self.navigationItem.titleView.frame.size.width, 40)];
    label.textColor=[UIColor blackColor];
    label.backgroundColor =[UIColor clearColor];
    label.adjustsFontSizeToFitWidth=YES;
//    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView=label;
    
    self.searchDisplayController.searchBar.tintColor = RGBCOLOR(0xF0, 0xBE, 0x32);

//    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Show" style:UIBarButtonItemStylePlain                                                                     target:self action:@selector(refreshPropertyList:)];
//    self.navigationItem.rightBarButtonItem = anotherButton;
    
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

    label.text = [[Common instance] getStringForKey:@"Tarifs"];
    self.title = [[Common instance] getStringForKey:@"Tarifs"];
    
    self.list = [NSMutableArray array];
    for(int i = 0; i < [[Common instance] getTarifCnt]; i++)
        [self.list addObject:[[Common instance] getTarifName:i]];
    
    self.list = [self.list sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    [self.tableView reloadData];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
//    NSLog(@"did");

    label.text = [[Common instance] getStringForKey:@"Tarifs"];
    self.title = [[Common instance] getStringForKey:@"Tarifs"];
    
    self.list = [NSMutableArray array];
    for(int i = 0; i < [[Common instance] getTarifCnt]; i++)
        [self.list addObject:[[Common instance] getTarifName:i]];
    
    self.list = [self.list sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

//    return self.list.count;
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        return [self.filteredList count];
        
    } else {
        
        return [self.list count];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"tarifcell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    
    
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    label.font = [UIFont fontWithName:@"DSOfficinaSerif-Book" size:20];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        label.text = [self.filteredList objectAtIndex:indexPath.row];
    } else {
        label.text = [self.list objectAtIndex:indexPath.row];
    }

    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = RGBCOLOR(0xF0, 0xBE, 0x32);
    bgColorView.layer.cornerRadius = 7;
    bgColorView.layer.masksToBounds = YES;
    [cell setSelectedBackgroundView:bgColorView];

    return cell;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

//    [Common instance].selectedTarif = indexPath.row;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        [[Common instance] setSelectedTarifNum:[self.filteredList objectAtIndex:indexPath.row]];
    } else {

        [[Common instance] setSelectedTarifNum:[self.list objectAtIndex:indexPath.row]];
    }

    TarifDetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"detailTarif"];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    self.filteredList = [self.list filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {

    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

@end
