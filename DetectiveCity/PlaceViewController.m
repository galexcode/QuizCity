//
//  PlaceViewController.m
//  DetectiveCity
//
//  Created by a я on 06.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "PlaceViewController.h"

@interface PlaceViewController ()

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
