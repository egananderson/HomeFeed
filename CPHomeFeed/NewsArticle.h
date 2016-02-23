//
//  NewsArticle.h
//  RSSFeed
//
//  Created by Egan Anderson on 2/10/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NewsArticle : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *articleDescription;
@property (nonatomic, strong) NSString *pubDate;
@property (nonatomic, strong) UIImage *picture;
@property (nonatomic, strong) NSString *picturePath;
@property (nonatomic, strong) NSString *articleID;
@property (nonatomic, strong) NSString *link;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
