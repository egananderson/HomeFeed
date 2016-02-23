//
//  NewsController.h
//  RSSFeed
//
//  Created by Egan Anderson on 2/10/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "NewsArticle.h"

@interface NewsController : NSObject

@property (nonatomic, strong) NSString *searchString;
@property (nonatomic, strong) NSArray *resultArticles;
@property (nonatomic, strong) NewsArticle *articleDetail;
@property (nonatomic, strong) UIImage *thumbnailImage;


+ (NewsController *)sharedInstance;
- (void)networkController;
- (void)detailNetworkController:(NSString *)articleID;
- (void)imageNetworkController:(NSString *)posterPath;

@end
