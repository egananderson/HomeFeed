//
//  HomeFeedImageCell.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/8/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicPost.h"

@protocol HomeFeedImageCellDelegate;

@interface HomeFeedImageCell : UITableViewCell

@property (weak, nonatomic) id<HomeFeedImageCellDelegate> delegate;

- (void)setUpCell:(BasicPost *)post;

@end

@protocol HomeFeedImageCellDelegate <NSObject>

- (void)nameButtonPressed:(NSString *)posterName;

- (void)contentImagePressed:(BasicPost *)post;

- (void)commentButtonPressed:(BasicPost *)post;

@end
