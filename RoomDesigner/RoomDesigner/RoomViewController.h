//
//  RoomViewController.h
//  RoomDesigner
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableView.h"

@interface RoomViewController : UIViewController
@property (strong, nonatomic) IBOutlet TableView *table;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sampler;
- (IBAction)sample:(id)sender;

@end
