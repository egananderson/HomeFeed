//
//  SavedFeedVC.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/8/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "SavedFeedVC.h"
#import "SavedFeedDataSource.h"
#import "HomeFeedController.h"
#import "BasicPost.h"
#import "PersonController.h"
#import "PersonVC.h"
#import "PostDetailVC.h"
#import "ImageVC.h"

@interface SavedFeedVC () <UITableViewDelegate>

@property (nonatomic, strong) SavedFeedDataSource *dataSource;

@end

@implementation SavedFeedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.dataSource = [SavedFeedDataSource new];
    [self.dataSource registerTableView:self.tableView viewController:self];
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
    
    HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
    [homeFeedController loadSavedPosts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) nameButtonPressed:(NSString *)person {
    PersonController *personController = [PersonController sharedInstance];
    personController.currentPerson = person;
    PersonVC *personVC = [PersonVC new];
    [self.navigationController pushViewController:personVC animated:YES];
}

- (void) contentImagePressed:(BasicPost *)post {
    HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
    homeFeedController.currentPost = post;
    ImageVC *imageVC = [ImageVC new];
    [self.navigationController pushViewController:imageVC animated:YES];
}

- (void) commentButtonPressed:(BasicPost *)post {
    HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
    homeFeedController.currentPost = post;
    [homeFeedController loadComments:post];
    homeFeedController.currentPost.numComments = [NSNumber numberWithInteger:homeFeedController.comments.count];
    PostDetailVC *postDetailVC = [PostDetailVC new];
    [self.navigationController pushViewController:postDetailVC animated:YES];
    
}




@end
