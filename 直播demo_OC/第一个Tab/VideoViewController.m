//
//  VideoViewController.m
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/7/3.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()
@property(nonatomic,strong)IJKFFMoviePlayerController *ijkLiveVeiw;

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
    NSLog(@"000%@",self.portrait);
    NSLog(@"111%@",self.stream_addr);

    // Do any additional setup after loading the view.
}
- (void)addSubView{
    //背景虚化
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = [UIScreen mainScreen].bounds;
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.portrait]];
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
     UIVisualEffectView *visual = [[UIVisualEffectView alloc] initWithEffect:blur];
    visual.frame = imageView.bounds;
    visual.alpha  = 0.8f;
    [imageView addSubview:visual];
    [self.view addSubview:imageView];
    
    // 拉流地址
    NSURL *url = [NSURL URLWithString:_stream_addr];
    
    self.ijkLiveVeiw = [[IJKFFMoviePlayerController alloc]initWithContentURL:url withOptions:nil];
    self.ijkLiveVeiw.view.frame = [UIScreen mainScreen].bounds;
    [self.ijkLiveVeiw prepareToPlay];
    
    [self.view addSubview:_ijkLiveVeiw.view];
    [self.view insertSubview:self.backBtn aboveSubview: self.ijkLiveVeiw.view];
    [self.view insertSubview:self.heartBtn aboveSubview: self.ijkLiveVeiw.view];
    [self.view insertSubview:self.giftBtn aboveSubview: self.ijkLiveVeiw.view];
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
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
    if (_ijkLiveVeiw) {
        [_ijkLiveVeiw pause];
        [_ijkLiveVeiw stop];
        [_ijkLiveVeiw shutdown];
    }
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
