//
//  NetWorkManager.h
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/6/30.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkManager : NSObject
+ (instancetype)sharedManager;
- (void)requestData:(NSMutableDictionary *)para
               path:(NSString *)path
            success:(void(^)(id responseObject))success
            failure:(void(^)(id error))failure;
@end
