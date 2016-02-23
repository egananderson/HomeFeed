//
//  PostDetailDataSource.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/4/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostDetailVC.h"

@interface PostDetailDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView viewController:(PostDetailVC *)viewController;

@end
