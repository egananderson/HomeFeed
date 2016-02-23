//
//  HomeFeedController.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/1/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BasicPost.h"

@interface HomeFeedController : NSObject

@property (nonatomic, strong) NSArray *posts;

@property (nonatomic, strong) NSArray *comments;

@property (nonatomic, strong) BasicPost *currentPost;

@property (nonatomic, strong) NSArray *savedPosts;

+ (instancetype) sharedInstance;

- (void) loadPosts;

- (void) loadSavedPosts;

- (void) loadComments:(BasicPost *)post;

@end
