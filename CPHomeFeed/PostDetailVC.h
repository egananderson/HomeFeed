//
//  PostDetailVC.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/4/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeFeedTextCell.h"
#import "HomeFeedImageCell.h"
#import "HomeFeedNewsCell.h"

@interface PostDetailVC : UIViewController <HomeFeedTextCellDelegate, HomeFeedImageCellDelegate, HomeFeedNewsCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end
