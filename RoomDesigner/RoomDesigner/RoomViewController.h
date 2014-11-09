//
//  RoomViewController.h
//  RoomDesigner
//
//  Created by Admin on 11/7/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableView.h"
#import <Parse/Parse.h>

@interface RoomViewController : UIViewController
@property (nonatomic, strong)NSMutableArray *content;
@property (strong, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sampler;
@property (strong,nonatomic) NSMutableArray *furnitureImages;
- (IBAction)sample:(id)sender;
- (IBAction)pan:(UIPanGestureRecognizer *)sender;

@end
