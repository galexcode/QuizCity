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
    NSMutableSet *answersSet;
    NSInteger lives;
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
    lives = [[NSUserDefaults standardUserDefaults] integerForKey:@"Lives"];
    answersSet = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"Answers"]];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"QuizText" ofType:@"plist"];
    NSDictionary *creatureDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
    
    NSArray *answers = creatureDictionary[@"answerText"];
    
    UILabel* answerLabel = (id)[self.view viewWithTag:100];
    answerLabel.text = [NSString stringWithFormat:@"Your answer is: %@", self.answer];
    UILabel* resultLabel = (id)[self.view viewWithTag:200];

    if( [self.answer isEqualToString:answers[level]])
    {
        resultLabel.text = @"Correct!";
        [answersSet addObject:[NSNumber numberWithInt:level]];
        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:answersSet] forKey:@"Answers"];
        
    }
    else
    {
        resultLabel.text = @"Incorrect =(";
        UIBarButtonItem *btnRetry = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"Retry: %d", lives] style:UIBarButtonItemStyleBordered target:self action:@selector(retryTaped)];
        [self.navigationItem setLeftBarButtonItem:btnRetry animated:NO];
        if(!lives)
            btnRetry.enabled = NO;
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
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Warring!"
                                                          message:@"Are you sure?"
                                                         delegate:self cancelButtonTitle:@"No"
                                                otherButtonTitles:@"Yes", nil];
    alertView.titleLabel.textColor = [UIColor cloudsColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    alertView.messageLabel.textColor = [UIColor cloudsColor];
    alertView.messageLabel.font = [UIFont flatFontOfSize:14];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
    alertView.defaultButtonColor = [UIColor cloudsColor];
    alertView.defaultButtonShadowColor = [UIColor asbestosColor];
    alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
    alertView.defaultButtonTitleColor = [UIColor asbestosColor];
    [alertView show];
//
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%d",buttonIndex);
    if(buttonIndex==0)
    {
        lives--;
        [[NSUserDefaults standardUserDefaults] setInteger:lives forKey:@"Lives"];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)performContinue
{
    NSLog(@"Progress");
    [self performSegueWithIdentifier:@"progress" sender:nil];
}

@end
