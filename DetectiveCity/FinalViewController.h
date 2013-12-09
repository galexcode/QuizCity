//
//  FinalViewController.h
//  DetectiveCity
//
//  Created by a я on 09.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FlatUIKit.h>

@interface FinalViewController : UIViewController <UITextFieldDelegate, FUIAlertViewDelegate>
- (IBAction)answerTaped:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sendButton;

@end
