//
//  Store.m
//  RoomDesigner
//
//  Created by Admin on 11/8/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Store.h"
#import <Parse/PFObject+Subclass.h>

@implementation Store

@dynamic name;

+(NSString *)parseClassName{
    return @"Item";
}

+(void)load{
    [self registerSubclass];
}

@end
