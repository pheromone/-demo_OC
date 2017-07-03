//
//  OneTableViewCell.m
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/6/29.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import "OneTableViewCell.h"
@interface OneTableViewCell ()

@end

@implementation OneTableViewCell
//头像
-(UIImageView *)userimageView{
    if(!_userimageView){
        self.userimageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.userimageView.image = [UIImage imageNamed:@"money"];
        self.userimageView.layer.masksToBounds = YES;
        self.userimageView.layer.cornerRadius = 6;
    }
    return _userimageView;
}
//名字
-(UILabel *)nameLabel{
    if(!_nameLabel){
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    }
    return _nameLabel;
}
//城市
-(UILabel *)cityLabel{
    if(!_cityLabel){
        self.cityLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    }
    return _cityLabel;
}
//大图
-(UIImageView *)userBigImg{
    if(!_userBigImg){
        self.userBigImg = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _userBigImg;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self setupUI];
    [self addCons];
    return self;
}

-(void)setupUI{
    [self.contentView addSubview:self.userimageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.cityLabel];
    [self.contentView addSubview:self.userBigImg];
}

-(void)addCons{
    [self.userimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@5);
        make.top.equalTo(@5);
        make.width.height.equalTo(@60);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH-65));
        make.height.equalTo(@30);
        make.leftMargin.equalTo(self.userimageView.mas_right).offset(10);
        make.top.equalTo(@5);
    }];
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH-65));
        make.height.equalTo(@30);
        make.leftMargin.equalTo(self.userimageView.mas_right).offset(10);
        make.topMargin.equalTo(self.nameLabel.mas_bottom).offset(5);
    }];
    [self.userBigImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH));
        make.height.equalTo(@230);
        make.topMargin.equalTo(_userimageView.mas_bottom).offset(10);
    }];
}

-(void)setOneModel:(OneModel *)oneModel{
    self.nameLabel.text = oneModel.creator.nick;
    self.cityLabel.text = oneModel.city;
    [self.userBigImg sd_setImageWithURL:[NSURL URLWithString:oneModel.creator.portrait]];
    [self.userimageView sd_setImageWithURL:[NSURL URLWithString:oneModel.creator.portrait]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
