//
//  OneTableViewCell.h
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/6/29.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OneModel;
@interface OneTableViewCell : UITableViewCell
@property (nonatomic , strong) OneModel *oneModel;
@property (nonatomic,strong)UIImageView *userimageView;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *cityLabel;
@property (nonatomic,strong)UIImageView *userBigImg;
@end
