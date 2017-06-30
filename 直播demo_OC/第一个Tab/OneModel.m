//
//  OneModel.m
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/6/29.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import "OneModel.h"

@implementation OneModel


+ (instancetype)detailImgWithDict:(NSDictionary *)dict{
    OneModel * oneModel = [[self alloc]init];
    oneModel.name = dict[@"name"];
    oneModel.city = dict[@"city"];
    oneModel.stream_addr = dict[@"stream_addr"];
    return oneModel;
}

@end
