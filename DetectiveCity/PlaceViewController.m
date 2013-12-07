//
//  PlaceViewController.m
//  DetectiveCity
//
//  Created by a я on 06.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "PlaceViewController.h"

@interface PlaceViewController ()
{
    NSInteger level;
}
@end

@implementation PlaceViewController

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
    UIBarButtonItem *btnMap = [[UIBarButtonItem alloc] initWithTitle:@"Map" style:UIBarButtonItemStyleBordered target:self action:@selector(performMap)];
    UIBarButtonItem *btnClue = [[UIBarButtonItem alloc] initWithTitle:@"Clue" style:UIBarButtonItemStyleBordered target:self action:@selector(performClue)];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:btnClue, btnMap, nil]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    level = [[NSUserDefaults standardUserDefaults] integerForKey:@"Level"];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"QuizText" ofType:@"plist"];
    NSDictionary *creatureDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
    
    NSArray *texts = creatureDictionary[@"placeText"];

    UITextView* textView = (id)[self.view viewWithTag:10];
    textView.text = texts[level];

    NSArray *images = creatureDictionary[@"placeImage"];
    UIImageView* imageView = (id)[self.view viewWithTag:20];
    imageView.image = [UIImage imageNamed:images[level]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)performMap
{
    NSLog(@"Map");
    [self performSegueWithIdentifier:@"map" sender:nil];
}

- (void)performClue
{
    NSLog(@"Clue");
    [self performSegueWithIdentifier:@"quiz" sender:nil];
}

@end
