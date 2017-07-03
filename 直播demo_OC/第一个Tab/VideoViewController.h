//
//  VideoViewController.h
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/7/3.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewController : UIViewController
@property (nonatomic,strong)UIButton *backBtn;
@property (nonatomic,strong)UIButton *heartBtn;
@property (nonatomic,strong)UIButton *giftBtn;
@property (nonatomic,copy)NSString *stream_addr;
@property (nonatomic,copy)NSString *portrait;
@end
