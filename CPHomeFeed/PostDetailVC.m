//
//  PostDetailVC.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/4/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "PostDetailVC.h"
#import "HomeFeedController.h"
#import "PostDetailDataSource.h"
#import "PersonVC.h"
#import "PersonController.h"
#import "ImageVC.h"

@interface PostDetailVC () <UITableViewDelegate>

@property (nonatomic, strong) PostDetailDataSource *dataSource;

@end

@implementation PostDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.dataSource = [PostDetailDataSource new];
    [self.dataSource registerTableView:self.tableView viewController:self];
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
    
    HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
    [homeFeedController loadPosts];

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
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
