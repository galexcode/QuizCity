//
//  HelloViewController.m
//  DetectiveCity
//
//  Created by a я on 05.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "HelloViewController.h"
#import <FlatUIKit.h>
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@interface HelloViewController ()

@end

@implementation HelloViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hexellence.png"]];
   
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor colorFromHexCode:@"e75659"]];
   
    if(!IS_OS_7_OR_LATER)
        [UIBarButtonItem configureFlatButtonsWithColor:[UIColor colorFromHexCode:@"ff8c69"]
                                      highlightedColor:[UIColor pomegranateColor]
                                          cornerRadius:3];
    
    [self.navigationItem.rightBarButtonItem removeTitleShadow];
    [self.navigationItem.leftBarButtonItem removeTitleShadow];

    self.navigationController.navigationBar.tintColor = [UIColor cloudsColor];
    

    for(int i=0; i<3; i++)
    {
        FUIButton *myButton = (id)[self.view viewWithTag:(i+1)*100];
        myButton.buttonColor = [UIColor colorFromHexCode:@"e75659"];
        myButton.shadowColor = [UIColor colorFromHexCode:@"bb2c38"];
        myButton.shadowHeight = 3.0f;
        myButton.cornerRadius = 6.0f;
        myButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.identifier isEqualToString: @"start"])
    {
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Level"];
        [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"Lives"];
        NSMutableSet *set = [NSMutableSet set];
        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:set] forKey:@"Answers"];
    }
}

- (IBAction)startTaped:(id)sender
{
    [self performSegueWithIdentifier:@"start" sender:nil];
}
@end
