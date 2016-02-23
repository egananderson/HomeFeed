//
//  ViewController.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/1/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeFeedTextCell.h"
#import "HomeFeedImageCell.h"
#import "HomeFeedNewsCell.h"


@interface HomeFeedVC : UIViewController <HomeFeedTextCellDelegate, HomeFeedImageCellDelegate, HomeFeedNewsCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

