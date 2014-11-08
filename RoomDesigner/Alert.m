//
//  Alert.m
//  RoomDesigner
//
//  Created by Admin on 11/8/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "Alert.h"

@interface Alert ()

@end

@implementation Alert

+(void)alertWith:(NSString *)title message:(NSString *)message andButton:(NSString *)button{
    [[[UIAlertView alloc] initWithTitle:title
                                message:message
                               delegate:nil
                      cancelButtonTitle:button otherButtonTitles:nil, nil]
     show];
}
@end
