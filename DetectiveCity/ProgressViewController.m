//
//  ProgressViewController.m
//  DetectiveCity
//
//  Created by a я on 06.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "ProgressViewController.h"
#import "LevelViewController.h"

@interface ProgressViewController ()
{
    NSInteger level;
    NSMutableSet *answersSet;
    NSInteger quizSize;
}
@end

@implementation ProgressViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    UIBarButtonItem *btnContinue = [[UIBarButtonItem alloc] initWithTitle:@"Continue" style:UIBarButtonItemStyleBordered target:self action:@selector(performContinue)];
    [self.navigationItem setRightBarButtonItem:btnContinue animated:NO];
    [self.navigationItem setHidesBackButton:YES animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    level = [[NSUserDefaults standardUserDefaults] integerForKey:@"Level"];
    answersSet = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"Answers"]];
 
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"QuizText" ofType:@"plist"];
    NSDictionary *creatureDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
    
    NSArray *texts = creatureDictionary[@"levelText"];
    quizSize = texts.count;
    
    for(int i =0; i<level; i++)
    {
        if([answersSet containsObject:[NSNumber numberWithInt:i]])
        {
            UIImageView *imageView = (id)[self.view viewWithTag:(i+1)*100];
            imageView.hidden = YES;
        }
    }
    if([answersSet containsObject:[NSNumber numberWithInt:level]])
    {
        UIImageView *imageView = (id)[self.view viewWithTag:(level+1)*100];
        [UIView animateWithDuration:0.5 delay:0.5 options:0 animations:^{
            imageView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            imageView.hidden = YES;
        }];
    }
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)performContinue
{
    NSLog(@"Continue");
    if(level!=quizSize-1)
        [self performSegueWithIdentifier:@"level" sender:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"level"])
    {
        level++;
        [[NSUserDefaults standardUserDefaults] setInteger:level forKey:@"Level"];
        LevelViewController *lvl = [segue destinationViewController];
        [lvl hideBackButton];
    }
}

@end
