//
//  ImageViewController.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/8/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "ImageVC.h"
#import "HomeFeedController.h"
#import "UIView+FLKAutoLayout.h"

@implementation ImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    HomeFeedController *homeFeedController = [HomeFeedController sharedInstance];
    UIImage *contentImage = homeFeedController.currentPost.contentImage;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:contentImage];
//    UIImageView *imageView = [[UIImageView alloc] init];
//    [imageView setImage:homeFeedController.currentPost.contentImage];
    [imageView alignTop:@"0" leading:@"0" toView:self.view];
    [imageView alignTrailingEdgeWithView:self.view predicate:@"0"];
  //  [imageView constrainAspectRatio:@"1"];
    [imageView constrainWidthToView:self.view predicate:@"0"];
    
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
