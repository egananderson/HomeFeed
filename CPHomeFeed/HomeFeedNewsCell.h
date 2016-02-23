//
//  HomeFeedNewsCell.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/11/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicPost.h"
#import "NewsArticle.h"

@protocol HomeFeedNewsCellDelegate;

@interface HomeFeedNewsCell : UITableViewCell

@property (weak, nonatomic) id<HomeFeedNewsCellDelegate> delegate;

- (void)setUpCell:(BasicPost *)post;

@end

@protocol HomeFeedNewsCellDelegate <NSObject>

- (void)publisherButtonPressed;

- (void)articleButtonPressed: (NewsArticle *)article;

- (void)commentButtonPressed:(BasicPost *)post;

@end
