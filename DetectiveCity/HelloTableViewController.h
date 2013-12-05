//
//  HelloTableViewController.h
//  DetectiveCity
//
//  Created by a я on 05.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticTableParentProtocol.h"
#import "StaticTableViewControllerProtocol.h"

@interface HelloTableViewController : UITableViewController <StaticTableViewControllerProtocol>

{
    BOOL wasSelected;
}


@property (nonatomic, weak) UIViewController <StaticTableParentProtocol> *delegate;

//-----------------------------------------------------------------------------------------------------------
#pragma mark - Public interface methods
//-----------------------------------------------------------------------------------------------------------

- (void) deselectItemsWithAnimation: (BOOL) animation;

////-----------------------------------------------------------------------------------------------------------
//#pragma mark - IBAction methods
////-----------------------------------------------------------------------------------------------------------
//
//- (IBAction)cellButtonTapped:(id)sender;

@end
