//
//  HomeFeedNewsCell.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/11/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "HomeFeedNewsCell.h"
#import "HomeFeedController.h"
#import "UIView+FLKAutoLayout.h"
#import "BasicPost.h"
#import "NewsController.h"
#import "NewsArticle.h"
#import "XMLReader.h"

@interface HomeFeedNewsCell ()

@property (nonatomic, strong) UIView *postView;
@property (nonatomic, strong) UIButton *publisherImage;
@property (nonatomic, strong) UIButton *publisherNameButton;
@property (nonatomic, strong) UIView *grayView;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) UIView *articleView;
@property (nonatomic, strong) UILabel *articleTitle;
@property (nonatomic, strong) UIImageView *articleThumbnail;
@property (nonatomic, strong) UIButton *articleButton;
@property (nonatomic, strong) BasicPost *post;
@property (nonatomic, strong) NewsArticle *article;

@end


@implementation HomeFeedNewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.postView = [[UIView alloc] init];
        [self.contentView addSubview:self.postView];
        
        self.publisherImage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.publisherImage addTarget:self action:@selector(publisherButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.postView addSubview:self.publisherImage];
        
        self.publisherNameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.publisherNameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.publisherNameButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.publisherNameButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
        [self.publisherNameButton addTarget:self action:@selector(publisherButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        self.publisherNameButton.enabled = YES;
        [self.postView addSubview:self.publisherNameButton];
        
        self.articleView = [[UIView alloc] init];
//        [self.articleView.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor blackColor])];
//        [self.articleView.layer setBorderWidth:3.0];
        [self.postView addSubview:self.articleView];
        
        self.articleThumbnail = [[UIImageView alloc] init];
        self.articleThumbnail.backgroundColor = [UIColor lightGrayColor];
        [self.articleView addSubview:self.articleThumbnail];
        
        self.articleTitle = [[UILabel alloc] init];
        self.articleTitle.numberOfLines = 0;
        self.articleTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
        [self.articleView addSubview:self.articleTitle];
        
        self.articleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.articleButton addTarget:self action:@selector(articleButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.articleView addSubview:self.articleButton];
        
        self.commentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.commentButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
        [self.commentButton addTarget:self action:@selector(commentButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        self.commentButton.enabled = YES;
        [self.postView addSubview:self.commentButton];
        
        self.shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        // [self.posterNameButton addTarget:self action:@selector(posterNameButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        self.shareButton.enabled = YES;
        [self.shareButton setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
        [self.postView addSubview:self.shareButton];
        
        self.saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.saveButton addTarget:self action:@selector(savePost:) forControlEvents:UIControlEventTouchUpInside];
        self.saveButton.enabled = YES;
        [self.saveButton setBackgroundImage:[UIImage imageNamed:@"save"] forState:UIControlStateNormal];
        [self.postView addSubview:self.saveButton];
        
        self.grayView = [[UIView alloc] init];
        self.grayView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        [self.postView addSubview:self.grayView];
        
        [self.grayView alignTop:@"0" leading:@"0" toView:self.postView];
        [self.grayView alignTrailingEdgeWithView:self.postView predicate:@"0"];
        [self.grayView constrainHeight:@"2"];
        
        [self.publisherImage constrainTopSpaceToView:self.grayView predicate:@"5"];
        [self.publisherImage alignLeadingEdgeWithView:self.postView predicate:@"5"];
        [self.publisherImage constrainAspectRatio:@"1"];
        [self.publisherImage constrainWidthToView:self.postView predicate:@"*0.1"];
        
        [self.publisherNameButton constrainTopSpaceToView:self.grayView predicate:@"5"];
        [self.publisherNameButton constrainLeadingSpaceToView:self.publisherImage predicate:@"5"];
        [self.publisherNameButton constrainHeight:@"30"];
        
        [self.articleView constrainTopSpaceToView:self.publisherImage predicate:@"5"];
        [self.articleView constrainLeadingSpaceToView:self.publisherImage predicate:@"5"];
        [self.articleView alignTrailingEdgeWithView:self.postView predicate:@"-5"];
        
        [self.articleThumbnail alignTop:@"5" bottom:@"5" toView:self.articleView];
        [self.articleThumbnail alignLeadingEdgeWithView:self.articleView predicate:@"0"];
        [self.articleThumbnail alignTrailingEdgeWithView:self.articleView predicate:@"-5"];
        [self.articleThumbnail constrainAspectRatio:@"1"];
        [self.articleThumbnail constrainWidthToView:self.articleView predicate:@"*0.3"];
        
        [self.articleTitle alignTop:@"5" bottom:@"5" toView:self.articleView];
        [self.articleTitle constrainLeadingSpaceToView:self.articleThumbnail predicate:@"5"];
        [self.articleTitle alignTrailingEdgeWithView:self.articleView predicate:@"-5"];
        
        [self.articleButton alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.articleView];
        
        [self.commentButton constrainTopSpaceToView:self.articleView predicate:@"15"];
        [self.commentButton constrainLeadingSpaceToView:self.publisherImage predicate:@"5"];
        [self.commentButton alignBottomEdgeWithView:self.postView predicate:@"-5"];
        
        [self.saveButton alignTrailingEdgeWithView:self.postView predicate:@"-10"];
        [self.saveButton alignBottomEdgeWithView:self.postView predicate:@"-5"];
        [self.saveButton constrainWidthToView:self.postView predicate:@"*.05"];
        [self.saveButton constrainAspectRatio:@"1"];
        
        [self.shareButton constrainTrailingSpaceToView:self.saveButton predicate:@"-10"];
        [self.shareButton alignBottomEdgeWithView:self.postView predicate:@"-5"];
        [self.shareButton constrainWidthToView:self.postView predicate:@"*.05"];
        [self.shareButton constrainAspectRatio:@"1"];
        
        [self.postView alignTop:@"0" leading:@"0" bottom:@"0" trailing:@"0" toView:self.contentView];
        
    }
    return self;
}

- (void)setUpCell:(BasicPost *)post{
    self.post = post;
    
    NewsController *newsController = [[NewsController alloc] init];
    
    NSData* data = [post.contentText dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;

    NSDictionary *serializedResults = [XMLReader dictionaryForXMLData:data
                                                              options:XMLReaderOptionsProcessNamespaces
                                                                error:&error];
    
    self.article = [[NewsArticle alloc] initWithDictionary:serializedResults[@"item"]];
    
    [self.publisherNameButton setTitle:self.post.posterName forState:UIControlStateNormal];
    self.articleTitle.text = self.article.title;
//    [self.articleThumbnail setImage:newsController.thumbnailImage];
    [self.articleThumbnail setImage:self.post.contentImage];
    [self.publisherImage setBackgroundImage:[UIImage imageNamed:@"logo-forbes"] forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat: @"%@ Comments", self.post.numComments] forState:UIControlStateNormal];
}

- (void)publisherButtonPressed:(id)sender {
    UIButton *button = sender;
    if (button.touchInside == YES) {
        [self.delegate publisherButtonPressed];
    }
}

- (void)articleButtonPressed:(id)sender {
    UIButton *button = sender;
    if (button.touchInside == YES) {
        [self.delegate articleButtonPressed:self.article];
    }
}

- (void)commentButtonPressed:(id)sender {
    UIButton *button = sender;
    if (button.touchInside == YES) {
        [self.delegate commentButtonPressed:self.post];
    }
}

- (void)savePost:(id)sender {
    UIButton *button = sender;
    if (button.touchInside == YES) {
        if (self.saveButton.backgroundColor == [UIColor lightGrayColor]) {
            [self.saveButton setBackgroundColor:[UIColor whiteColor]];
        } else {
            [self.saveButton setBackgroundColor:[UIColor lightGrayColor]];
        }
    }
}





@end
