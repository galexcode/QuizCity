//
//  StaticTableParentProtocol.h
//  DetectiveCity
//
//  Created by a я on 05.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "StaticTableViewControllerProtocol.h"

@protocol StaticTableParentProtocol <NSObject>

@optional

- (void) tableView: (UITableView *) tableView
         didSelect: (BOOL) select
   cellAtIndexPath: (NSIndexPath *)indexPath
 inViewController : (UIViewController <StaticTableViewControllerProtocol> *) viewController;


@end
