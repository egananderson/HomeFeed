//
//  HomeFeedController.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/1/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "HomeFeedController.h"
#import "HomeFeedVC.h"

@implementation HomeFeedController

+ (instancetype)sharedInstance {
    static HomeFeedController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HomeFeedController alloc] init];
    });
    
    return sharedInstance;
}

- (void) loadPosts {
    UIImage *nerdImage = [UIImage imageNamed:@"nerd"];
    self.posts =
    @[
      @{
          @"postID" : @"1",
          @"postType" : @"Text",
          @"posterName" : @"John Appleseed",
          @"posterImage" : nerdImage,
          @"contentText" : @"This is a post from John",
          @"contentImage" : [[UIImage alloc] init],
          @"numComments" : @5
          },
      @{
          @"postID" : @"2",
          @"postType" : @"Text",
          @"posterName" : @"James Appleseed",
          @"posterImage" : nerdImage,
          @"contentText" : @"This is a post from James. This post is longer the other posts to test out how the sizing works.",
          @"contentImage" : [[UIImage alloc] init],
          @"numComments" : @5
          },
      @{
          @"postID" : @"3",
          @"postType" : @"Image",
          @"posterName" : @"Paul Appleseed",
          @"posterImage" : nerdImage,
          @"contentText" : @"This is a post from Paul",
          @"contentImage" : nerdImage,
          @"numComments" : @4
          },
      @{
          @"postID" : @"3",
          @"postType" : @"Article",
          @"posterName" : @"Forbes",
          @"posterImage" : nerdImage,
          @"contentText" : @"<item><link>http://www.forbes.com/sites/marcbabej/2015/02/17/how-health-warrior-is-marketing-chia-as-the-superfood-of-the-21st-century/</link><title>How Health Warrior Is Marketing Chia As The Superfood Of The 21st Century</title><description>I recently spoke with Shane Emmett, the CEO of Health Warrior, about the marketing of a successful helath food startup. The short answerL an influential book on nutrition, three determined former college athletes, and an almost forgotten, nutrient-packed seed. Marc E. Babej: Chia seeds, the main ingredient in your food bars, [...]</description><dc:creator>Marc E. Babej, Contributor</dc:creator><atom:author><atom:name>Marc E. Babej, Contributor</atom:name><atom:url>http://www.forbes.com/sites/marcbabej/</atom:url><atom:uri>http://www.forbes.com/sites/marcbabej/</atom:uri></atom:author><guid isPermaLink=\"false\">54e3717be4b025b38eaa6369</guid><pubDate>Tue, 17 Feb 2015 12:31:00 -0500</pubDate><atom:updated>2015-02-17T12:31:00-05:00</atom:updated><content:encoded>I recently spoke with Shane Emmett, the CEO of Health Warrior, about the marketing of a successful helath food startup. The short answerL an influential book on nutrition, three determined former college athletes, and an almost forgotten, nutrient-packed seed. Marc E. Babej: Chia seeds, the main ingredient in your food bars, [...]</content:encoded><media:content url=\"http://blogs-images.forbes.com/marcbabej/files/2015/02/Overhead_Hero_Acai_LORes.jpg\"><media:thumbnail url=\"http://blogs-images.forbes.com/marcbabej/files/2015/02/Overhead_Hero_Acai_LORes.jpg\"/></media:content></item>",
//          @"contentText" : @"<item><link>http://www.forbes.com/sites/erikkain/2016/02/11/this-star-wars-meets-mario-kart-video-is-the-best-thing-ever/</link><title>This &apos;Star Wars&apos; Meets &apos;Mario Kart&apos; Video Is The Best Thing Ever</title><description>Disney and Nintendo should partner up and make this into an actual video game.</description><dc:creator>Erik Kain</dc:creator><guid>http://www.forbes.com/sites/erikkain/2016/02/11/this-star-wars-meets-mario-kart-video-is-the-best-thing-ever/</guid><pubDate>Thu, 11 Feb 2016 17:02:00 GMT</pubDate><dc:date>2016-02-11T12:02:00Z</dc:date><media:content url=\"http://blogs-images.forbes.com/erikkain/files/2016/02/Screenshot-886-1200x675.png\"><media:thumbnail url=\"http://blogs-images.forbes.com/erikkain/files/2016/02/Screenshot-886-1200x675.png\"/></media:content></item>",
          @"contentImage" : [UIImage imageNamed:@"chia"],
          @"numComments" : @"3"
          }
      ];
}

- (void) loadComments:(BasicPost *)post {
    NSDictionary *commentDictionary =
    @{
      @"1" : @[
              @"What does maté taste like?",
              @"A little bit like alfalfa",
              @"Dang that sounds delicious!",
              @"Yeah it really is",
              @"Can't wait to try it"
              ],
      @"2" : @[
              @"What does maté taste like?",
              @"A little bit like alfalfa",
              @"Dang that sounds delicious!",
              @"Yeah it really is",
              @"Can't wait to try it"
              ],
      @"3" : @[
              @"What does maté taste like?",
              @"A little bit like alfalfa",
              @"Dang that sounds delicious!",
              @"Yeah it really is"
              ]
      };
    
    self.comments = commentDictionary[post.postID];
}

- (void) loadSavedPosts {
    UIImage *nerdImage = [UIImage imageNamed:@"nerd"];
    self.savedPosts =
    @[
      @{
          @"postID" : @"1",
          @"posterName" : @"John Appleseed",
          @"posterImage" : nerdImage,
          @"contentText" : @"This is a post from John",
          @"contentImage" : [[UIImage alloc] init],
          @"numComments" : @5
          },
      @{
          @"postID" : @"3",
          @"posterName" : @"Paul Appleseed",
          @"posterImage" : nerdImage,
          @"contentText" : @"This is a post from Paul",
          @"contentImage" : nerdImage,
          @"numComments" : @4
          },
      @{
          @"postID" : @"4",
          @"posterName" : @"Gret Appleseed",
          @"posterImage" : nerdImage,
          @"contentText" : @"This is a post from Greg. This post is longer the other posts to test out how the sizing works.",
          @"contentImage" : [[UIImage alloc] init],
          @"numComments" : @0
          },
      ];
}





@end

