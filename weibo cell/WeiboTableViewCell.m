//
//  WeiboTableViewCell.m
//  weibo cell
//
//  Created by 谢谦 on 16/2/16.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "WeiboTableViewCell.h"
#import "weibo.h"

#define  doTextGrayColor
#define  doTableViewCellControllSpacing 10
#define doUserNameFontSize 16

#define doTimeFontSize 14
#define doTextFontSize 14
#define doSourceFontSize 14
@implementation WeiboTableViewCell
{
    UIImageView *_photoImageView;
    UIImageView *_mbtypeImageView;
    UILabel *_timeLabel;
    UILabel *_sourceLabel;
    UILabel *_textLabel;
    UILabel *_userNameLabel;


}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initTableViewCell];
    }
    return self;
}


-(void)initTableViewCell
{
    _photoImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_photoImageView];
    
    
    _mbtypeImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_mbtypeImageView];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.font = [UIFont systemFontOfSize:doTimeFontSize];
    [self.contentView addSubview:_timeLabel];
    
    //来源控件
    _sourceLabel = [[UILabel alloc]init];
    _sourceLabel.textColor = [UIColor grayColor];
    _sourceLabel.font = [UIFont systemFontOfSize:doSourceFontSize];
    [self.contentView addSubview:_sourceLabel];
    
    //文本控件
    _textLabel = [[UILabel alloc]init];
    _textLabel.textColor = [UIColor blackColor];
    _textLabel.font = [UIFont systemFontOfSize:13];
    _textLabel.numberOfLines = 0;
    [self.contentView addSubview:_textLabel];
    
    //用户名控件
    _userNameLabel = [[UILabel alloc]init];
    _userNameLabel.textColor= [UIColor blackColor];
    _userNameLabel.font = [UIFont systemFontOfSize:doUserNameFontSize];
    _userNameLabel.numberOfLines = 0;
    
    [self.contentView addSubview:_userNameLabel];
    

}


-(void)setWeiboModel:(weibo *)weiboModel
{

    //头像控件
    _photoImageView.frame = CGRectMake(10, 10, 40, 40);
    _photoImageView.image = [UIImage imageNamed:weiboModel.profileImageUrl];


    //用户名控件
    
    CGFloat usernameX = CGRectGetMaxX(_photoImageView.frame) + doTableViewCellControllSpacing;
    CGFloat usernameY = _photoImageView.frame.origin.y;
    CGSize usernameSize = [weiboModel.userName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:doUserNameFontSize]}];
    _userNameLabel.frame = CGRectMake(usernameX, usernameY, usernameSize.width, usernameSize.height);
    _userNameLabel.text = weiboModel.userName;
    
    //等级控件
    CGFloat mbtypeX = CGRectGetMaxX(_userNameLabel.frame) + doTableViewCellControllSpacing;
    CGFloat mbtypeY = usernameY;
    
    _mbtypeImageView.frame = CGRectMake(mbtypeX, mbtypeY, 20, 20);
    _mbtypeImageView.image = [UIImage imageNamed:weiboModel.mbtype];
    
    //时间控件
    
    CGSize timeLabelSize = [weiboModel.createdAt sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:doTimeFontSize]}];
    
    CGFloat timeLabelX = usernameX;
    CGFloat timeLabelY = CGRectGetMaxY(_photoImageView.frame) - timeLabelSize.height;
    
    
    _timeLabel.frame = CGRectMake(timeLabelX, timeLabelY, timeLabelSize.width, timeLabelSize.height);
    _timeLabel.text = weiboModel.createdAt;
    
    //来源控件
    CGFloat sourceLabelX = timeLabelX + timeLabelSize.width+ doTableViewCellControllSpacing;
    CGFloat sourceLabelY = timeLabelY;
    CGSize sourceLabelSize = [weiboModel.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:doSourceFontSize]}];
    _sourceLabel.frame = CGRectMake(sourceLabelX, sourceLabelY, sourceLabelSize.width, sourceLabelSize.height);
    _sourceLabel.text = weiboModel.source;

    //文本控件
    CGFloat textLabelY = CGRectGetMaxY(_photoImageView.frame) + doTableViewCellControllSpacing;
    CGFloat textLabelX = 10;
    CGFloat textWidth = self.frame.size.width - doTableViewCellControllSpacing*2;
    
    CGSize textLabelSize = [weiboModel.text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil].size;
    
    
    CGRect rect = CGRectMake(textLabelX, textLabelY, textLabelSize.width, textLabelSize.height);
    _textLabel.text = weiboModel.text;
    _textLabel.frame = rect;


    
    _height = CGRectGetMaxY(_textLabel.frame) + doTableViewCellControllSpacing;
}



- (void)awakeFromNib {
    
   
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
