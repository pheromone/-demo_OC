//
//  OneModel.h
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/6/29.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *stream_addr;
+ (instancetype)detailImgWithDict:(NSDictionary *)dict;

@end
