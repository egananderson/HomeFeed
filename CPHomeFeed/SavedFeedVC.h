//
//  SavedFeedVC.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/8/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeFeedTextCell.h"
#import "HomeFeedImageCell.h"


@interface SavedFeedVC : UIViewController <HomeFeedTextCellDelegate, HomeFeedImageCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end
