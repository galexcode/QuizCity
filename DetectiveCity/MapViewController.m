//
//  MapViewController.m
//  DetectiveCity
//
//  Created by a я on 06.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "MapViewController.h"
#import "MyAnnotation.h"

@interface MapViewController ()
{
    NSMutableArray *locations;
    NSInteger level;
    NSMutableSet *answersSet;
}
@end

@implementation MapViewController

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
    
    UIBarButtonItem *btnHome = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(performHome)];
    UIBarButtonItem *btnProgress = [[UIBarButtonItem alloc] initWithTitle:@"Progress" style:UIBarButtonItemStyleBordered target:self action:@selector(performProgress)];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:btnProgress, btnHome, nil]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    level = [[NSUserDefaults standardUserDefaults] integerForKey:@"Level"];
    answersSet = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"Answers"]];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"QuizText" ofType:@"plist"];
    NSDictionary *creatureDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
    
    NSArray *coords = creatureDictionary[@"locations"];
    locations = [NSMutableArray arrayWithCapacity:coords.count];
    
    for(int i =0; i<coords.count;i++)
    {
        float lat = [[coords[i] objectAtIndex:0] doubleValue];
        float lng = [[coords[i] objectAtIndex:1] doubleValue];
        MyAnnotation *pin = [[MyAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(lat, lng)];
        
  
        if(i>=level)
                pin.picTag = 1;
        else
            if([answersSet containsObject:[NSNumber numberWithInt:i]])
                pin.picTag = 2;
            else
                pin.picTag = 3;
        
        locations[i] = pin;
    }
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(((MyAnnotation*)locations[level]).coordinate, 700, 700);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustedRegion animated:YES];
    
    [self.mapView addAnnotations:locations];
}

- (void)performHome
{
    NSLog(@"Home");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)performProgress
{
    NSLog(@"Progress");
       [self performSegueWithIdentifier:@"progress" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id<MKAnnotation>) annotation {
    MKAnnotationView *pin = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier: @"myPin"];
    
    if (pin == nil) {
        pin = [[MKAnnotationView alloc] initWithAnnotation: annotation reuseIdentifier: @"myPin"];
    } else {
        pin.annotation = annotation;
    }

    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return pin;
    }
    pin.selected = NO;
    MyAnnotation *myannatation = (MyAnnotation*)annotation;
    switch (myannatation.picTag) {
        case 1:
            pin.image = [UIImage imageNamed:@"yellow.png"];
            break;
        case 2:
            pin.image = [UIImage imageNamed:@"green.png"];
            break;
        case 3:
            pin.image = [UIImage imageNamed:@"red.png"];
            break;
        default:
            break;
    }
    pin.frame = CGRectMake(pin.frame.origin.x, pin.frame.origin.y, 32, 32);
    
    return pin;
}



@end
