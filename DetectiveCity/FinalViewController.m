//
//  FinalViewController.m
//  DetectiveCity
//
//  Created by a я on 09.12.13.
//  Copyright (c) 2013 zhorkov023. All rights reserved.
//

#import "FinalViewController.h"
#import "DAKeyboardControl.h"
#import <UIToolbar+FlatUI.h>
@interface FinalViewController ()

@end

@implementation FinalViewController

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
    UIToolbar *toolBar = (id)[self.view viewWithTag:500];
//    UILabel *label = (id)[self.view viewWithTag:100];

    [toolBar configureFlatToolbarWithColor:[UIColor colorFromHexCode:@"e75659"]];
    
    [self.sendButton configureFlatButtonWithColor:[UIColor colorFromHexCode:@"ff8c69"]
                                  highlightedColor:[UIColor pomegranateColor]
                                      cornerRadius:3];
    
    [self.view addKeyboardPanningWithActionHandler:^(CGRect keyboardFrameInView) {
        CGRect toolBarFrame = toolBar.frame;
        toolBarFrame.origin.y = keyboardFrameInView.origin.y - toolBarFrame.size.height;
        toolBar.frame = toolBarFrame;
      
//        CGRect labelFrame = label.frame;
//        labelFrame.origin.y =  toolBarFrame.origin.y - labelFrame.size.height;
//        label.frame = labelFrame;
    }];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hexellence.png"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self.view removeKeyboardControl];
    
    [super viewWillDisappear:animated];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self answerTaped:textField];
    return YES;
}

- (IBAction)answerTaped:(id)sender {
    NSString* answer = [self.textField text];
    if([answer isEqualToString:@""]) return;
    
    [self.view hideKeyboard];
    if([answer isEqualToString:@"Кропоткин"])
    {
        FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"You win!!!!"
                                                              message:@"Congratulations!"
                                                             delegate:self cancelButtonTitle:@"Ok!"
                                                    otherButtonTitles:nil];
        alertView.titleLabel.textColor = [UIColor cloudsColor];
        alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        alertView.messageLabel.textColor = [UIColor cloudsColor];
        alertView.messageLabel.font = [UIFont flatFontOfSize:14];
        alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
        alertView.alertContainer.backgroundColor = [UIColor orangeColor];
        alertView.defaultButtonColor = [UIColor sunflowerColor];
        alertView.defaultButtonShadowColor = [UIColor pumpkinColor];
        alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        alertView.defaultButtonTitleColor = [UIColor pumpkinColor];
        [alertView show];
    }
    else
    {
        FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"You lose..."
                                                              message:@"Let's try again"
                                                             delegate:self cancelButtonTitle:@"Ok"
                                                    otherButtonTitles:nil];
        alertView.titleLabel.textColor = [UIColor cloudsColor];
        alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        alertView.messageLabel.textColor = [UIColor cloudsColor];
        alertView.messageLabel.font = [UIFont flatFontOfSize:14];
        alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
        alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
        alertView.defaultButtonColor = [UIColor cloudsColor];
        alertView.defaultButtonShadowColor = [UIColor asbestosColor];
        alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        alertView.defaultButtonTitleColor = [UIColor asbestosColor];
        [alertView show];
    }
}

-(void)alertView:(FUIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
