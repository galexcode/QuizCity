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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)performContinue
{
    NSLog(@"Continue");
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
