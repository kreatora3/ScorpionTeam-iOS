//
//  Item.h
//  RoomDesigner
//
//  Created by Admin on 11/9/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Parse/Parse.h>

@interface Item : PFObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* type;
@property (strong, nonatomic) PFFile*  image;

@end
