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
    
    level = [[NSUserDefaults standardUserDefaults] integerForKey:@"Level"];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"QuizText" ofType:@"plist"];
    NSDictionary *creatureDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
    
    NSArray *texts = creatureDictionary[@"placeText"];
    NSArray *title = creatureDictionary[@"titleText"];
    NSArray *images = creatureDictionary[@"placeImage"];
    
    
    NSString *image = [[NSBundle mainBundle] pathForAuxiliaryExecutable:images[level]];
    NSString *background = [[NSBundle mainBundle] pathForResource:@"hexellence" ofType:@"png"];
    NSString *htmlContentString = [NSString stringWithFormat:
                                   @"<html>"
                                   "<body background=\"file://%@\">"
                                   "<h2 style=\"text-align:center;\">%@</h2>"
                                   "<p style=\"text-align: center;\"><img src=\"file://%@\" width=\"200\" height=\"200\" /></p>"
                                   "<p style=\"text-align:left;\"><span style=\"font-size:17px;\">%@</span></p>"
                                   "</body></html>", background, title[level], image, texts[level]];
    
    [self.webView loadHTMLString:htmlContentString baseURL:nil];
    [self.webView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hexellence.png"]]];
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
