//
//  HelloTableViewController.m
//  DetectiveCity
//
//  Created by a я on 05.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "HelloTableViewController.h"
//#import "UITableView+indexPathForCellContainingView.h"

@interface HelloTableViewController ()

@end

@implementation HelloTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *currentSelection = [self.tableView indexPathForSelectedRow];
    wasSelected = [indexPath compare: currentSelection] == NSOrderedSame;
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //If the cell started out selected, un-select it.
    if (wasSelected)
    {
        [self.tableView deselectRowAtIndexPath: indexPath animated: NO];
    }
    if ([self.delegate respondsToSelector: @selector(tableView:didSelect:cellAtIndexPath:inViewController:)])
    {
        [self.delegate tableView: tableView
                       didSelect:  !wasSelected
                 cellAtIndexPath: indexPath
                inViewController: self];
    }
}

- (void) deselectItemsWithAnimation: (BOOL) animation;
{
    NSIndexPath *currentSelection = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath: currentSelection animated: animation];
}

@end
