//
//  HelloViewController.h
//  DetectiveCity
//
//  Created by a я on 05.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticTableViewControllerProtocol.h"
#import "StaticTableParentProtocol.h"

@interface HelloViewController : UIViewController <StaticTableParentProtocol>
@property (nonatomic, weak) UITableViewController <StaticTableViewControllerProtocol> *helloTableViewController;

@end