//
//  PersonController.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/2/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonController : NSObject

@property (nonatomic, strong) NSString *currentPerson;

+ (instancetype) sharedInstance;

@end
