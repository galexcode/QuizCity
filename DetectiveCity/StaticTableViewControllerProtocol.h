//
//  StaticTableViewControllerProtocol.h
//  DetectiveCity
//
//  Created by a я on 05.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//Forward declaration of StaticTableParentProtocol,
//since the delegate in StaticTableViewControllerProtocol.h conforms to the StaticTableParentProtocol

@protocol StaticTableParentProtocol;

@protocol StaticTableViewControllerProtocol <NSObject>

@property (nonatomic, weak) UIViewController <StaticTableParentProtocol> *delegate;

@optional

- (void) deselectItemsWithAnimation: (BOOL) animation;

@end
