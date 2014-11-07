//
//  LoginViewController.m
//  RoomDesigner
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (IBAction)login:(id)sender {
    
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    
    [PFUser logInWithUsernameInBackground:username password:password
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self alertMessage:@"Succesfull login."];
                                            //[self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:3] animated:YES];
                                            // todo clear segue and manual
                                        } else {
                                            // The login failed. Check error to see why.
                                            //NSString *errorString = [error userInfo][@"error"];
                                            [self alertMessage:[NSString stringWithFormat:@"Login failed"]];
                                            // todo return to login
                                        }
                                    }];
    
    [self.username resignFirstResponder];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)alertMessage:(NSString*)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message: message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
}


@end
