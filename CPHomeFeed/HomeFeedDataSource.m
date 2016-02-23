//
//  HomeFeedDataSource.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/1/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "HomeFeedDataSource.h"
#import "HomeFeedVC.h"
#import "HomeFeedController.h"
#import "BasicPost.h"
#import "HomeFeedTextCell.h"
#import "HomeFeedImageCell.h"
#import "NewsController.h"
#import "HomeFeedNewsCell.h"

static NSString *homeFeedTextCellID = @"homeFeedTextCellID";
static NSString *homeFeedImageCellID = @"homeFeedImageCellID";
static NSString *homeFeedNewsCellID = @"homeFeedNewsCellID";

@interface HomeFeedDataSource()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) HomeFeedVC *viewController;

@end

@implementation HomeFeedDataSource

- (void)registerTableView:(UITableView *)tableView viewController:(HomeFeedVC *)viewController {
    self.tableView = tableView;
    self.viewController = viewController;
    [self.tableView registerClass:[HomeFeedTextCell class] forCellReuseIdentifier:homeFeedTextCellID];
    [self.tableView registerClass:[HomeFeedImageCell class] forCellReuseIdentifier:homeFeedImageCellID];
    [self.tableView registerClass:[HomeFeedNewsCell class] forCellReuseIdentifier:homeFeedNewsCellID];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
    NSDictionary *postInfo = homeFeedController.posts[indexPath.row];
    UITableViewCell *homeFeedCell;
    if ([((UIImage *)postInfo[@"postType"]) isEqual: @"Text"]){
        homeFeedCell = [tableView dequeueReusableCellWithIdentifier:homeFeedTextCellID];
        ((HomeFeedTextCell *)homeFeedCell).delegate = self.viewController;
        BasicPost *post = [[BasicPost alloc] initWithText: postInfo[@"contentText"] posterName:postInfo[@"posterName"] posterImage:postInfo[@"posterImage"] postID:postInfo[@"postID"] numComments:postInfo[@"numComments"] postType:postInfo[@"postType"]];
        [((HomeFeedTextCell *)homeFeedCell) setUpCell:post];
        [homeFeedCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    } else if ([((UIImage *)postInfo[@"postType"]) isEqual: @"Image"]){
        homeFeedCell = [tableView dequeueReusableCellWithIdentifier:homeFeedImageCellID];
        ((HomeFeedImageCell *)homeFeedCell).delegate = self.viewController;
        BasicPost *post = [[BasicPost alloc] initWithImage: postInfo[@"contentImage"] contentText:postInfo[@"contentText"] posterName:postInfo[@"posterName"] posterImage:postInfo[@"posterImage"] postID:postInfo[@"postID"] numComments:postInfo[@"numComments"] postType:postInfo[@"postType"]];
        [((HomeFeedImageCell *)homeFeedCell) setUpCell:post];
        [homeFeedCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    } else if ([((UIImage *)postInfo[@"postType"]) isEqual: @"Article"]){
        homeFeedCell = [tableView dequeueReusableCellWithIdentifier:homeFeedNewsCellID];
        ((HomeFeedNewsCell *)homeFeedCell).delegate = self.viewController;
        BasicPost *post = [[BasicPost alloc] initWithImage:postInfo[@"contentImage"]  contentText:postInfo[@"contentText"] posterName:postInfo[@"posterName"] posterImage:postInfo[@"posterImage"] postID:postInfo[@"postID"] numComments:postInfo[@"numComments"] postType:postInfo[@"postType"]];
        [((HomeFeedNewsCell *)homeFeedCell) setUpCell:post];
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
    return 4;
}

@end
