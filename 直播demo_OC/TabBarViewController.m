//
//  TabBarViewController.m
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/6/29.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//


@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OneViewController * oneVC = [[OneViewController alloc]init];
    UIImage * oneImg = [UIImage imageNamed:@"1_"];
    UIImage * oneImgSel = [UIImage imageNamed:@"1_selected"];
    [self addChildVCandRootVC:@"直播列表" tabTitle:@"直播" rootVC:oneVC img:oneImg img_selected:oneImgSel];
    
    TwoViewController * twoVC = [[TwoViewController alloc]init];
    UIImage * twoImg = [UIImage imageNamed:@"2_"];
    UIImage * twoImgSel = [UIImage imageNamed:@"2_selected"];
    [self addChildVCandRootVC:@"歌曲列表" tabTitle:@"歌曲" rootVC:twoVC img:twoImg img_selected:twoImgSel];
}

- (void)addChildVCandRootVC:(NSString *)navTitle tabTitle:(NSString *)tabTitle rootVC:(UIViewController *)rootVC img:(UIImage *)img img_selected:(UIImage *)img_selected{
    rootVC.title = navTitle;
    [rootVC.tabBarItem setImage:img];
    [rootVC.tabBarItem setSelectedImage:img_selected];
    rootVC.tabBarItem.title = tabTitle;
    UINavigationController *  rNav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    [self addChildViewController:rNav];
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
