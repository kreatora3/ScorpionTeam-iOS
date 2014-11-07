//
//  Store.h
//  RoomDesigner
//
//  Created by Admin on 11/8/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface Store : PFObject<PFSubclassing>

+ (NSString *)parseClassName;

@property (nonatomic) NSString *name;

@end
