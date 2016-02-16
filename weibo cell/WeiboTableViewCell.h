//
//  WeiboTableViewCell.h
//  weibo cell
//
//  Created by 谢谦 on 16/2/16.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import <UIKit/UIKit.h>


@class weibo;
@interface WeiboTableViewCell : UITableViewCell


@property (nonatomic,strong)weibo *weiboModel;
@property (nonatomic,assign)CGFloat height;//行高



@end
