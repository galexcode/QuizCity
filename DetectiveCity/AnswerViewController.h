//
//  AnswerViewController.h
//  DetectiveCity
//
//  Created by a я on 06.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FUIAlertView.h>

@interface AnswerViewController : UIViewController <FUIAlertViewDelegate>

@property (strong, nonatomic) NSString* answer;

@end
