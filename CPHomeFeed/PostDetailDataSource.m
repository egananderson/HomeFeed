//
//  PostDetailDataSource.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/4/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "PostDetailDataSource.h"
#import "HomeFeedTextCell.h"
#import "HomeFeedController.h"
#import "HomeFeedNewsCell.h"

static NSString *commentCellID = @"commentCellID";
static NSString *composeCellID = @"composeCellID";
static NSString *homeFeedTextCellID = @"homeFeedTextCellID";
static NSString *homeFeedImageCellID = @"homeFeedImageCellID";
static NSString *homeFeedNewsCellID = @"homeFeedNewsCellID";

@interface PostDetailDataSource()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) PostDetailVC *viewController;

@end

@implementation PostDetailDataSource

- (void)registerTableView:(UITableView *)tableView viewController:(PostDetailVC *)viewController {
    self.tableView = tableView;
    self.viewController = viewController;
    [self.tableView registerClass:[HomeFeedTextCell class] forCellReuseIdentifier:homeFeedTextCellID];
    [self.tableView registerClass:[HomeFeedImageCell class] forCellReuseIdentifier:homeFeedImageCellID];
    [self.tableView registerClass:[HomeFeedNewsCell class] forCellReuseIdentifier:homeFeedNewsCellID];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:commentCellID];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:composeCellID];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
    [homeFeedController loadComments:homeFeedController.currentPost];
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:{
//            if(!cell)
//                cell = [tableView dequeueReusableCellWithIdentifier:postDetailCellID];
//            ((HomeFeedTextCell *)cell).delegate = self.viewController;
//            BasicPost *post = homeFeedController.currentPost;
//            [((HomeFeedTextCell *)cell) setUpCell:post];
//            [((HomeFeedTextCell *)cell) setSelectionStyle:UITableViewCellSelectionStyleNone];
            HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
            BasicPost *post = homeFeedController.currentPost;
            if ([post.postType isEqual: @"Text"]){
                cell = [tableView dequeueReusableCellWithIdentifier:homeFeedTextCellID];
                ((HomeFeedTextCell *)cell).delegate = self.viewController;
                [((HomeFeedTextCell *)cell) setUpCell:post];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            } else if ([post.postType isEqual: @"Image"]){
                cell = [tableView dequeueReusableCellWithIdentifier:homeFeedImageCellID];
                ((HomeFeedImageCell *)cell).delegate = self.viewController;
                [((HomeFeedImageCell *)cell) setUpCell:post];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            } else if ([post.postType isEqual: @"Article"]){
                cell = [tableView dequeueReusableCellWithIdentifier:homeFeedNewsCellID];
                ((HomeFeedNewsCell *)cell).delegate = self.viewController;
                [((HomeFeedNewsCell *)cell) setUpCell:post];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }

        }
            break;
        case 1: {
            cell = [tableView dequeueReusableCellWithIdentifier:commentCellID];
            cell.textLabel.text = homeFeedController.comments[indexPath.row];
            cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
        }
            break;
        case 2:{
            cell = [tableView dequeueReusableCellWithIdentifier:composeCellID];
            cell.textLabel.text = @"write new comment";
        }
            break;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
    NSArray *numberOfRowsPerSection = @[@1, homeFeedController.currentPost.numComments, @1];
    return [numberOfRowsPerSection[section] integerValue];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    BasicPost *post = [HomeFeedController sharedInstance].currentPost;
//    if(post.numComments == 0){
//        return 2;
//    } else {
//        return 3;
//    }
    
    return 3;
}

@end
