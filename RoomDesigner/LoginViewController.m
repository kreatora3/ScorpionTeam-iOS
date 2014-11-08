//
//  LoginViewController.m
//  RoomDesigner
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"
#import "RoomViewController.h"
#import "Alert.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (IBAction)login:(id)sender {
    
    NSString *username = self.username.text;
    NSString *password = self.password.text;

    [PFUser logInWithUsernameInBackground:username password:password
                                        block:^(PFUser *user, NSError *error) {
                                            if (user) {
                                                RoomViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"login"];
                                                [self.navigationController pushViewController:loginVC animated:YES];
                                                
                                            }
                                            else{
                                                [Alert alertWith:@"Error occured!" message:@"Wrong username or password" andButton:@"OK"];
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



@end
