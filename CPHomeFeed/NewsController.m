//
//  NewsController.m
//  RSSFeed
//
//  Created by Egan Anderson on 2/10/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "NewsController.h"
#import "XMLReader.h"

@implementation NewsController

+ (NewsController *)sharedInstance {
    
    static NewsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [NewsController new];
    });
    return sharedInstance;
    
}

- (void)networkController{
    NSURLSession *session = [NSURLSession sharedSession];
    
    //NSString *rootURL = @"http://www.forbes.com/business/feed/";
    NSString *rootURL = @"http://rss.forbes.com/feed/search/tech";
    NSURL *searchURL = [NSURL URLWithString:rootURL];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:searchURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *serializedResults = [XMLReader dictionaryForXMLData:data
                                                     options:XMLReaderOptionsProcessNamespaces
                                                       error:&error];
        
        NSArray *arrayOfResults = serializedResults[@"rss"][@"channel"][@"item"];
        
        NSMutableArray *convertedResults = [NSMutableArray new];
        
        NSLog(@"%@", serializedResults);
        
        for (NSDictionary *dictionary in arrayOfResults){
            NewsArticle *result = [[NewsArticle alloc] initWithDictionary:dictionary];
            [convertedResults addObject:result];
            
        }
        self.resultArticles = convertedResults;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"requestFinished" object:nil];
        
        
    }];
    
    [dataTask resume];
}

- (void)detailNetworkController:(NSString *)movieID{
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSString *idURL = [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@?api_key=8f4d94bf8c273bcb1899f9c853b6d8a2", movieID];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:idURL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *serializedResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        NSLog(@"Starting Now \n \n");
        NSLog(@"%@", serializedResults);
        
        self.articleDetail = [[NewsArticle alloc]initWithDictionary:serializedResults];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"detailMovie" object:nil];
        
        
    }];
    
    [dataTask resume];
}

- (void)imageNetworkController:(NSString *)imageURL{
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:imageURL] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        self.thumbnailImage = [UIImage imageWithData:data];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"pictureFinished" object:nil];
        
        
    }];
    self.thumbnailImage = self.thumbnailImage;
    [dataTask resume];
}


@end
