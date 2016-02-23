//
//  SavedFeedDataSource.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/8/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SavedFeedVC.h"

@interface SavedFeedDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView viewController:(SavedFeedVC *)viewController;

@end
