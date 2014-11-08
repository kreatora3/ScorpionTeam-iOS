//
//  RegisterViewController.m
//  RoomDesigner
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "RegisterViewController.h"
#import "Parse/Parse.h"
#import "RoomViewController.h"
#import "Alert.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
- (IBAction)registerBtn:(id)sender {
    [self registerMethod];
}

- (void)registerMethod {
    NSString *userName = self.username.text;
    NSString *password = self.password.text;
    
    if(userName == nil || userName.length < 3){
        [Alert alertWith:@"Invalid username"
                        message:@"Username must be at least 3 characters"
                      andButton:@"OK"];
        
    }
    else if(password == nil || password.length < 6){
        [Alert alertWith:@"Invalid password"
                        message:@"Password must be at least 5 characters"
                      andButton:@"OK"];
        
    }
    else{
        
        PFUser *user = [PFUser user];
        user.username = self.username.text;
        user.password = self.password.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                RoomViewController *regVC = [self.storyboard instantiateViewControllerWithIdentifier:@"toRoomVC"];
                [self.navigationController pushViewController:regVC animated:YES];        }
            else {
//                [Alert alertWith:@"Register failed"
//                         message:@"Error!"
//                       andButton:@"OK"];

            }
        }];}
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
