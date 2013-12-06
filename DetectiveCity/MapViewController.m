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
//    CLLocationCoordinate2D droppedAt;
    NSArray *locations;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *btnHome = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(performHome)];
    UIBarButtonItem *btnProgress = [[UIBarButtonItem alloc] initWithTitle:@"Progress" style:UIBarButtonItemStyleBordered target:self action:@selector(performProgress)];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:btnProgress, btnHome, nil]];

    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(55.752511, 37.623136), 7000, 7000);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustedRegion animated:YES];
    
    MyAnnotation *pin1 = [[MyAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(55.752511, 37.623136)];
    MyAnnotation *pin2 = [[MyAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(55.760079,37.618587)];
    MyAnnotation *pin3 = [[MyAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(55.748971,37.53855)];
    MyAnnotation *pin4 = [[MyAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(55.749903,37.615905)];
    pin1.picTag = 1;
    pin2.picTag = 2;
    pin3.picTag = 3;
    pin4.picTag = 1;
    locations = [NSArray arrayWithObjects:pin1, pin2, pin3, pin4, nil];
    [self.mapView addAnnotations:locations];
}

- (void)performHome
{
    NSLog(@"Home");
    [self performSegueWithIdentifier:@"hello" sender:nil];
}

- (void)performProgress
{
    NSLog(@"Progress");
    //    [self performSegueWithIdentifier:@"progress" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id<MKAnnotation>) annotation {
    MKPinAnnotationView *pin = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier: @"myPin"];
    
    if (pin == nil) {
        pin = [[MKPinAnnotationView alloc] initWithAnnotation: annotation reuseIdentifier: @"myPin"];
    } else {
        pin.annotation = annotation;
    }

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
