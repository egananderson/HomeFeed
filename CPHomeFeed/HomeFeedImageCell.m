//
//  HomeFeedImageCell.m
//  CPHomeFeed
//
//  Created by Egan Anderson on 2/8/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

#import "HomeFeedImageCell.h"
#import "HomeFeedController.h"
#import "UIView+FLKAutoLayout.h"
#import "BasicPost.h"
#import "PersonController.h"

@interface HomeFeedImageCell ()

@property (nonatomic, strong) UIButton *contentImage;
@property (nonatomic, strong) UILabel *contentText;
@property (nonatomic, strong) UIView *postView;
@property (nonatomic, strong) UIButton *posterImage;
@property (nonatomic, strong) UIButton *posterNameButton;
@property (nonatomic, strong) UIView *grayView;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIButton *saveButton;
@property (nonatomic, strong) BasicPost *post;

@end


@implementation HomeFeedImageCell

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
        
        self.contentImage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.contentImage addTarget:self action:@selector(contentImagePressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.postView addSubview:self.contentImage];
        
        self.posterImage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.posterImage addTarget:self action:@selector(posterNameButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.postView addSubview:self.posterImage];
        
        self.contentText = [[UILabel alloc] init];
        self.contentText.numberOfLines = 0;
        self.contentText.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
        [self.postView addSubview:self.contentText];
        
        self.posterNameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.posterNameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.posterNameButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.posterNameButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
        [self.posterNameButton addTarget:self action:@selector(posterNameButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        self.posterNameButton.enabled = YES;
        [self.postView addSubview:self.posterNameButton];
        
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
        
        [self.posterImage constrainTopSpaceToView:self.grayView predicate:@"5"];
        [self.posterImage alignLeadingEdgeWithView:self.postView predicate:@"5"];
        [self.posterImage constrainAspectRatio:@"1"];
        [self.posterImage constrainWidthToView:self.postView predicate:@"*0.1"];
        
        [self.posterNameButton constrainTopSpaceToView:self.grayView predicate:@"5"];
        [self.posterNameButton constrainLeadingSpaceToView:self.posterImage predicate:@"5"];
        [self.posterNameButton constrainHeight:@"30"];
        
        [self.contentText constrainTopSpaceToView:self.posterNameButton predicate:@"5"];
        [self.contentText constrainLeadingSpaceToView:self.posterImage predicate:@"5"];
        [self.contentText alignTrailingEdgeWithView:self.postView predicate:@"-5"];
        
        [self.contentImage constrainTopSpaceToView:self.contentText predicate:@"10"];
        [self.contentImage alignLeading:@"10" trailing:@"0" toView:self.postView];
        [self.contentImage constrainBottomSpaceToView:self.commentButton predicate:@"-10"];
        
        [self.commentButton constrainLeadingSpaceToView:self.posterImage predicate:@"5"];
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
    
    [self.posterNameButton setTitle:self.post.posterName forState:UIControlStateNormal];
    self.contentText.text = self.post.contentText;
    [self.posterImage setBackgroundImage:self.post.posterImage forState:UIControlStateNormal];
    [self.commentButton setTitle:[NSString stringWithFormat: @"%@ Comments", self.post.numComments] forState:UIControlStateNormal];
    
    [self.contentImage setBackgroundImage:self.post.contentImage forState:UIControlStateNormal];
    [self.contentImage constrainWidthToView:self.postView predicate:@"-20"];
    [self.contentImage constrainAspectRatio:@"1"];
    
}

- (void)posterNameButtonPressed:(id)sender {
    UIButton *button = sender;
    if (button.touchInside == YES) {
        [self.delegate nameButtonPressed:self.post.posterName];
    }
}

- (void)contentImagePressed:(id)sender {
    UIButton *button = sender;
    if (button.touchInside == YES) {
        [self.delegate contentImagePressed:self.post];
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
