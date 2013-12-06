//
//  QuizViewController.m
//  DetectiveCity
//
//  Created by a я on 06.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "QuizViewController.h"
#import "AnswerViewController.h"

@interface QuizViewController ()
{
    NSString *youranswer;
}

@end

@implementation QuizViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTaped:(UIButton*)sender
{
    youranswer = sender.titleLabel.text;
    NSLog(@"Your answer is: %@", youranswer);
    [self performSegueWithIdentifier:@"answer" sender:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"answer"])
    {
        AnswerViewController *answerview = [segue destinationViewController];
        answerview.answer = youranswer;
    }
}
@end
