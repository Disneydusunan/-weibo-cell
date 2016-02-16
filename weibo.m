//
//  weibo.m
//  weibo cell
//
//  Created by 谢谦 on 16/2/16.
//  Copyright © 2016年 杜苏南. All rights reserved.
//

#import "weibo.h"

@implementation weibo

-(instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _createdAt  = dic[@"createdAt"];
        _mbtype = dic[@"mbtype"];
        _profileImageUrl = dic[@"profileImageUrl"];
        _source = dic[@"source"];
        _text = dic[@"text"];
        _userName = dic[@"userName"];
        
        _Id = [dic[@"Id"] longLongValue];
        
    }
    return self;

}

+(instancetype)weiboWithDictionary:(NSDictionary *)dic
{

    return [[self alloc]initWithDictionary:dic];

}



@end
