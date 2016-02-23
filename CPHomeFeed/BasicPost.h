//
//  BasicPost.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/1/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BasicPost : NSObject

@property (nonatomic, strong) NSString *postType;
@property (nonatomic, strong) NSString *posterName;
@property (nonatomic, strong) UIImage *posterImage;
@property (nonatomic, strong) NSString *contentText;
@property (nonatomic, strong) UIImage *contentImage;
@property (nonatomic, strong) NSString *postID;
@property (nonatomic, assign) NSNumber *numComments;

- (id)initWithText:(NSString *)contentText posterName:(NSString *)posterName posterImage:(UIImage *)posterImage postID:(NSString *)postID numComments:(NSNumber *)numComments postType:(NSString *)postType;

- (id)initWithImage:(UIImage *)contentImage contentText:(NSString *)contentText posterName:(NSString *)posterName posterImage:(UIImage *)posterImage postID:(NSString *)postID numComments:(NSNumber *)numComments postType:(NSString *)postType;

@end
