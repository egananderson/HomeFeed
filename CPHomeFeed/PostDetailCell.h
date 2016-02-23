//
//  PostDetailCell.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/4/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicPost.h"


@protocol PostDetailCellDelegate;

@interface PostDetailCell : UITableViewCell

@property (weak, nonatomic) id<PostDetailCellDelegate> delegate;

- (void)setUpCell:(NSDictionary *)contents;

@end

@protocol PostDetailCellDelegate <NSObject>

- (void)nameButtonPressed:(NSString *)posterName;

- (void)commentButtonPressed:(BasicPost *)post;

@end
