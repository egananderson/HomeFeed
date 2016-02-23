//
//  PersonController.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/2/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "PersonController.h"

@implementation PersonController

+ (instancetype)sharedInstance {
    static PersonController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PersonController alloc] init];
    });
    
    return sharedInstance;
}

@end
