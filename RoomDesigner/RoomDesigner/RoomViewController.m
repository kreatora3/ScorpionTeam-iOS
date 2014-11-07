//
//  RoomViewController.m
//  RoomDesigner
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "RoomViewController.h"

@interface RoomViewController ()

@end

@implementation RoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sample:(id)sender {
    if(_sampler.selectedSegmentIndex == 0)            // Checking which segment is selected using the segment index value
        
    {
        //implement changing datasource for table
        
        self.view.backgroundColor = [UIColor redColor];          // Change the background color to red
        
    }
    
    else
        
        if(_sampler.selectedSegmentIndex == 1)
            
        {
            //implement changing datasource for table
            self.view.backgroundColor = [UIColor greenColor];
            
        }
    
        else
            
            if(_sampler.selectedSegmentIndex == 2)
                
            {
                //implement changing datasource for table
                self.view.backgroundColor = [UIColor blueColor];
                
            }
    
}
@end
