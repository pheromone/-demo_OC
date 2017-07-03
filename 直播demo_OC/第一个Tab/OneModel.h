//
//  OneModel.h
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/6/29.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;

@interface OneModel : NSObject
@property (nonatomic , strong) UserModel *creator; //用户信息模型
@property (nonatomic, copy) NSString *name; //标签
@property (nonatomic, copy) NSString *city;//所在城市
@property (nonatomic, copy) NSString *stream_addr;//视频地址
@end
