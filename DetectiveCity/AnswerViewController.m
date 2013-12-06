//
//  AnswerViewController.m
//  DetectiveCity
//
//  Created by a я on 06.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()

@end

@implementation AnswerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    UIImageView * imageView = (id)[cell.contentView viewWithTag:200];
    
    UILabel* answerLabel = (id)[self.view viewWithTag:100];
    answerLabel.text = [NSString stringWithFormat:@"Your answer is: %@", self.answer];
    UILabel* resultLabel = (id)[self.view viewWithTag:200];
    if( [self.answer isEqualToString:@"11"])
        resultLabel.text = @"Correct!";
    else
    {
        resultLabel.text = @"Incorrect =(";
        
    }
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)retryTaped:(id)sender
{
    NSLog(@"Retry");
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dismiss completed");
    }];
    
}

- (IBAction)continueTaped:(id)sender {
}
@end
