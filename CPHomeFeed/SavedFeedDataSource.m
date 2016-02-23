//
//  SavedFeedDataSource.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/8/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "SavedFeedDataSource.h"
#import "HomeFeedController.h"
#import "BasicPost.h"
#import "HomeFeedTextCell.h"
#import "HomeFeedImageCell.h"

static NSString *homeFeedTextCellID = @"homeFeedTextCellID";
static NSString *homeFeedImageCellID = @"homeFeedImageCellID";

@interface SavedFeedDataSource()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) SavedFeedVC *viewController;

@end

@implementation SavedFeedDataSource

- (void)registerTableView:(UITableView *)tableView viewController:(SavedFeedVC *)viewController {
    self.tableView = tableView;
    self.viewController = viewController;
    [self.tableView registerClass:[HomeFeedTextCell class] forCellReuseIdentifier:homeFeedTextCellID];
    [self.tableView registerClass:[HomeFeedImageCell class] forCellReuseIdentifier:homeFeedImageCellID];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
    NSDictionary *postInfo = homeFeedController.savedPosts[indexPath.row];
    UITableViewCell *homeFeedCell;
    if (((UIImage *)postInfo[@"contentImage"]).size.width == 0){
        homeFeedCell = [tableView dequeueReusableCellWithIdentifier:homeFeedTextCellID];
        ((HomeFeedTextCell *)homeFeedCell).delegate = self.viewController;
        BasicPost *post = [[BasicPost alloc] initWithText: postInfo[@"contentText"] posterName:postInfo[@"posterName"] posterImage:postInfo[@"posterImage"] postID:postInfo[@"postID"] numComments:postInfo[@"numComments"] postType:postInfo[@"postType"]];
        [((HomeFeedTextCell *)homeFeedCell) setUpCell:post];
        [homeFeedCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    } else {
        homeFeedCell = [tableView dequeueReusableCellWithIdentifier:homeFeedImageCellID];
        ((HomeFeedImageCell *)homeFeedCell).delegate = self.viewController;
        BasicPost *post = [[BasicPost alloc] initWithImage: postInfo[@"contentImage"] contentText:postInfo[@"contentText"] posterName:postInfo[@"posterName"] posterImage:postInfo[@"posterImage"] postID:postInfo[@"postID"] numComments:postInfo[@"numComments"] postType:postInfo[@"postType"]];
        [((HomeFeedImageCell *)homeFeedCell) setUpCell:post];
        [homeFeedCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    return homeFeedCell;
    //    for (NSDictionary *postInfo in homeFeedController.posts) {
    //        if ([postInfo[@"postID"] isEqualToString:post.postID]) {
    //            posterInfo = postInfo;
    //            [homeFeedCell setUpCell:posterInfo];
    //            [homeFeedCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    //            return homeFeedCell;
    //        }
    //    }
    
    
    //    return [[UITableViewCell alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

@end
