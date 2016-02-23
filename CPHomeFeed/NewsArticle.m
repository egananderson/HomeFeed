//
//  NewsArticle.m
//  RSSFeed
//
//  Created by Egan Anderson on 2/10/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "NewsArticle.h"

@implementation NewsArticle

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self)
    {
        self.title = dictionary[@"title"][@"text"];
        self.pubDate = dictionary[@"pubDate"][@"text"];
        self.articleDescription = dictionary[@"description"][@"text"];
        self.picturePath = dictionary[@"content"][@"thumbnail"][@"url"];
        self.articleID = dictionary[@"guid"][@"text"];
        self.link = dictionary[@"link"][@"text"];
    }
    return self;
}

@end
