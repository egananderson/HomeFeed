//
//  ViewController.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/1/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "HomeFeedVC.h"
#import "HomeFeedDataSource.h"
#import "HomeFeedController.h"
#import "BasicPost.h"
#import "PersonController.h"
#import "PersonVC.h"
#import "PostDetailVC.h"
#import "ImageVC.h"
#import "SavedFeedVC.h"
#import "NewsController.h"
#import "KINWebBrowserViewController.h"

@interface HomeFeedVC () <UITableViewDelegate>

@property (nonatomic, strong) HomeFeedDataSource *dataSource;

@end

@implementation HomeFeedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *savedFeedButton = [[UIBarButtonItem alloc] initWithTitle:@"Saved" style:UIBarButtonItemStylePlain target:self action:@selector(pushSavedFeed:)];
    self.navigationItem.rightBarButtonItem = savedFeedButton;
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    self.dataSource = [HomeFeedDataSource new];
    [self.dataSource registerTableView:self.tableView viewController:self];
    self.tableView.dataSource = self.dataSource;
    [self.view addSubview:self.tableView];
    
    NewsController *newsController = [NewsController sharedInstance];
    [newsController imageNetworkController:@"http://blogs-images.forbes.com/marcbabej/files/2015/02/Overhead_Hero_Acai_LORes.jpg"];
    
    HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
    [homeFeedController loadPosts];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"pictureFinished" object:nil];
}

- (void)reloadData{
    [self.tableView reloadData];
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

- (void) publisherButtonPressed{
    KINWebBrowserViewController *browserVC = [KINWebBrowserViewController new];
    NSURL *url = [NSURL URLWithString:@"http://forbes.com"];
    [browserVC loadURL:url];
    [self.navigationController pushViewController:browserVC animated:YES];
}

- (void)articleButtonPressed: (NewsArticle *)article{
    KINWebBrowserViewController *browserVC = [KINWebBrowserViewController new];
    NSURL *url = [NSURL URLWithString:article.link];
    [browserVC loadURL:url];
    [self.navigationController pushViewController:browserVC animated:YES];
//    NewsController *newsController = [NewsController sharedInstance];
//    HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
//    homeFeedController.currentPost = [[BasicPost alloc] init];
//    homeFeedController.currentPost.contentImage = newsController.thumbnailImage;
//    ImageVC *imageVC = [ImageVC new];
//    [self.navigationController pushViewController:imageVC animated:YES];
}

- (IBAction)pushSavedFeed:(id)sender{
    SavedFeedVC *savedFeed = [[SavedFeedVC alloc] init];
    [self.navigationController pushViewController:savedFeed animated:true];
}




@end
