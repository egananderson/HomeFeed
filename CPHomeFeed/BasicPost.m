//
//  BasicPost.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/1/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "BasicPost.h"

@implementation BasicPost

- (id)initWithText:(NSString *)contentText posterName:(NSString *)posterName posterImage:(UIImage *)posterImage postID:(NSString *)postID numComments:(NSNumber *)numComments postType:(NSString *)postType{
    self = [super init];
    self.posterName = posterName;
    self.posterImage = posterImage;
    self.contentText = contentText;
    self.postID = postID;
    self.numComments = numComments;
    self.postType = postType;
    return self;
}

- (id)initWithImage:(UIImage *)contentImage contentText:(NSString *)contentText posterName:(NSString *)posterName posterImage:(UIImage *)posterImage postID:(NSString *)postID numComments:(NSNumber *)numComments postType:(NSString *)postType{
    self = [super init];
    self.posterName = posterName;
    self.posterImage = posterImage;
    self.contentText = contentText;
    self.contentImage = contentImage;
    self.postID = postID;
    self.numComments = numComments;
    self.postType = postType;
    return self;
}

@end
