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
        [self.heartBtn addTarget:self action:@selector(heartAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _heartBtn;
}

- (UIButton *)giftBtn{
    if(!_giftBtn){
        self.giftBtn = [[UIButton alloc]initWithFrame:CGRectZero];
        [self.giftBtn setImage:[UIImage imageNamed:@"gift"] forState:UIControlStateNormal];
        [self.giftBtn addTarget:self action:@selector(giftAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _giftBtn;
}

//返回按钮事件
- (void)backAction {
    [self dismissViewControllerAnimated:NO completion:nil];
}

//点击爱心事件
-(void)heartAction:(UIButton *)btn{
    //爱心动画
    DMHeartFlyView * heart = [[DMHeartFlyView alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
    heart.center = CGPointMake(self.heartBtn.frame.origin.x, self.heartBtn.frame.origin.y);
    [self.view insertSubview:heart aboveSubview:self.ijkLiveVeiw.view];
    [heart animateInView:self.view];
    
    
    //按钮大小点击动画
    CAKeyframeAnimation *  btnAnime = [[CAKeyframeAnimation alloc]init];
    btnAnime.keyPath = @"transform.scale";
    btnAnime.values =      @[@1.0, @0.7, @0.5, @0.3, @0.5, @0.7, @1.0, @1.2, @1.4, @1.2, @1.0];
    btnAnime.keyTimes = @[@0.0,@0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1.0 ];
    btnAnime.duration = 0.2;
    
    [btn.layer addAnimation:btnAnime forKey:@"SHOW"];
}

//点击礼物动画
-(void)giftAction:(UIButton *)btn{
   //跑车动画
    int duration = 3.0;
    CGFloat carWidth = 250;
    CGFloat carHeight = 125;
    UIImageView * car = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"porsche"]];
    car.frame = CGRectMake(0, 0, 0, 0);
    [self.view insertSubview:car aboveSubview:self.ijkLiveVeiw.view];
    
    [UIView animateWithDuration:duration animations:^{
        car.frame = CGRectMake(self.view.center.x - carWidth/2, self.view.center.x - carHeight/2, carWidth, carHeight);
    } completion:^(BOOL finished) {
        [car removeFromSuperview];
    }];
    
    //烟花特效动画
    CAEmitterLayer * layerFw = [[CAEmitterLayer alloc]init];
    [self.view.layer addSublayer:layerFw];
    [[[emmitParticles alloc]init] emmitParticlesFrom:btn.center emitter:layerFw in:self.view];
    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 5*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [layerFw removeFromSuperlayer];
    });
    
    
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

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
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
