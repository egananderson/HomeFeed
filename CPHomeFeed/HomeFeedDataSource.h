//
//  HomeFeedDataSource.h
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/1/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HomeFeedVC.h"

@interface HomeFeedDataSource : NSObject <UITableViewDataSource>

- (void)registerTableView:(UITableView *)tableView viewController:(HomeFeedVC *)viewController;

@end
