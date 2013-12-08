//
//  AnswerViewController.m
//  DetectiveCity
//
//  Created by a я on 06.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()
{
    NSInteger level;
}
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

- (void)viewWillAppear:(BOOL)animated
{
    UIBarButtonItem *btnContinue = [[UIBarButtonItem alloc] initWithTitle:@"Continue" style:UIBarButtonItemStyleBordered target:self action:@selector(performContinue)];
    [self.navigationItem setRightBarButtonItem:btnContinue animated:NO];
    [self.navigationItem setHidesBackButton:YES animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
//    UIImageView * imageView = (id)[cell.contentView viewWithTag:200];
    level = [[NSUserDefaults standardUserDefaults] integerForKey:@"Level"];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"QuizText" ofType:@"plist"];
    NSDictionary *creatureDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
    
    NSArray *answers = creatureDictionary[@"answerText"];
    
    UILabel* answerLabel = (id)[self.view viewWithTag:100];
    answerLabel.text = [NSString stringWithFormat:@"Your answer is: %@", self.answer];
    UILabel* resultLabel = (id)[self.view viewWithTag:200];

    if( [self.answer isEqualToString:answers[level]])
    {
        resultLabel.text = @"Correct!";

    }
    else
    {
        resultLabel.text = @"Incorrect =(";
        UIBarButtonItem *btnRetry = [[UIBarButtonItem alloc] initWithTitle:@"Retry" style:UIBarButtonItemStyleBordered target:self action:@selector(retryTaped)];
        [self.navigationItem setLeftBarButtonItem:btnRetry animated:NO];
    }
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)retryTaped
{
    NSLog(@"Retry");
//    [self dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"Dismiss completed");
//    }];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)performContinue
{
    NSLog(@"Progress");
    [self performSegueWithIdentifier:@"progress" sender:nil];
}

@end
