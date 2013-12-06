//
//  AnswerViewController.h
//  DetectiveCity
//
//  Created by a я on 06.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerViewController : UIViewController

@property (strong, nonatomic) NSString* answer;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *retry;
- (IBAction)retryTaped:(id)sender;
- (IBAction)continueTaped:(id)sender;

@end
