//
//  QuizViewController.m
//  DetectiveCity
//
//  Created by a я on 06.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "QuizViewController.h"
#import "AnswerViewController.h"
#import <FUIButton.h>
#import <FlatUIKit/UIColor+FlatUI.h>

@interface QuizViewController ()
{
    NSString *youranswer;
    NSInteger level;
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

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationItem setHidesBackButton:YES animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    level = [[NSUserDefaults standardUserDefaults] integerForKey:@"Level"];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"QuizText" ofType:@"plist"];
    NSDictionary *creatureDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
    
    NSArray *texts = creatureDictionary[@"questionText"];
    
    UITextView* textView = (id)[self.view viewWithTag:10];
    textView.text = texts[level];
    
    NSArray *variants = [creatureDictionary[@"variantsText"] objectAtIndex:level];
    for(int i=0; i<variants.count; i++)
    {
        FUIButton *myButton = (id)[self.view viewWithTag:(i+1)*100];
        [myButton setTitle:variants[i] forState:UIControlStateNormal];
        myButton.buttonColor = [UIColor colorFromHexCode:@"e75659"];
        myButton.shadowColor = [UIColor colorFromHexCode:@"bb2c38"];
        myButton.shadowHeight = 3.0f;
        myButton.cornerRadius = 6.0f;
//        myButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    }
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
