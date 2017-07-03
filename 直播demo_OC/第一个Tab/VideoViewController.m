//
//  VideoViewController.m
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/7/3.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController
- (UIButton *)backBtn{
    if(!_backBtn){
        self.backBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [self.backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [self.backBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (UIButton *)heartBtn{
    if(!_heartBtn){
        self.heartBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [self.heartBtn setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        [self.heartBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _heartBtn;
}

- (UIButton *)giftBtn{
    if(!_giftBtn){
        self.giftBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [self.giftBtn setImage:[UIImage imageNamed:@"gift"] forState:UIControlStateNormal];
        [self.giftBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _giftBtn;
}

- (void)backAction {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubView];
    [self addCons];
    // Do any additional setup after loading the view.
}
- (void)addSubView{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gift"]];
    imageView.frame = [UIScreen mainScreen].bounds;
//    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
//     UIVisualEffectView *visual = [[UIVisualEffectView alloc] initWithEffect:blur];
//    visual.alpha = 1.0f;
//    visual.frame = imageView.bounds;
    [self.view addSubview:imageView];
    
     [self.view addSubview:self.backBtn];
     [self.view addSubview:self.heartBtn];
     [self.view addSubview:self.giftBtn];
}
- (void)addCons{
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@60);
        make.height.equalTo(@60);
        make.topMargin.equalTo(self.view.mas_top).offset(20);
        make.leading.equalTo(@5);
     }];
    [self.giftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@40);
        make.leading.equalTo(@20);
        make.topMargin.equalTo(self.view.mas_bottom).offset(-50);
    }];
    [self.heartBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@40);
        make.trailing.equalTo(@-20);
        make.topMargin.equalTo(self.view.mas_bottom).offset(-50);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
