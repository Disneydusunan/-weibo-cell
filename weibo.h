//
//  weibo.h
//  weibo cell
//
//  Created by 谢谦 on 16/2/16.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weibo : NSObject

@property (nonatomic,copy)NSString *createdAt;
@property (nonatomic,copy)NSString *mbtype;
@property (nonatomic,copy)NSString *profileImageUrl;
@property (nonatomic,copy)NSString *source;
@property (nonatomic,copy)NSString *text;
@property (nonatomic,copy)NSString *userName;

@property (nonatomic,assign)long long Id;


-(instancetype)initWithDictionary:(NSDictionary *)dic;
+(instancetype)weiboWithDictionary:(NSDictionary *)dic;

@end
