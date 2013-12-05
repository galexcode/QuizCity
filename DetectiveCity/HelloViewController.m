//
//  HelloViewController.m
//  DetectiveCity
//
//  Created by a я on 05.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "HelloViewController.h"
#import "HelloTableViewController.h"

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"logo.jpg"]];
    
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
    if ([segue.identifier isEqualToString: @"table"])
    {
        self.helloTableViewController = segue.destinationViewController;
        self.helloTableViewController.delegate =self;
    }
}

- (void) tableView: (UITableView *) tableView
         didSelect: (BOOL) select
   cellAtIndexPath: (NSIndexPath *)indexPath
 inViewController : (UIViewController <StaticTableViewControllerProtocol> *) viewController;
{
    if (indexPath.section == 0)
        [self performSegueWithIdentifier:@"start" sender:nil];

}

@end
