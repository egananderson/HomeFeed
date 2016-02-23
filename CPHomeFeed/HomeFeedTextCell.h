//
//  HomeFeedCell.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/1/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicPost.h"

@protocol HomeFeedTextCellDelegate;

@interface HomeFeedTextCell : UITableViewCell

@property (weak, nonatomic) id<HomeFeedTextCellDelegate> delegate;

- (void)setUpCell:(BasicPost *)post;

@end

@protocol HomeFeedTextCellDelegate <NSObject>

- (void)nameButtonPressed:(NSString *)posterName;

- (void)commentButtonPressed:(BasicPost *)post;

@end
