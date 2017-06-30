//
//  OneViewController.m
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/6/29.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView  *tableView;

@end

@implementation OneViewController
static NSString * cellIdentifier = @"oneCell";

- (UITableView *)tableView {
    if(!_tableView){
        self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [self.tableView registerClass:[OneTableViewCell class] forCellReuseIdentifier:cellIdentifier];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 300;
    [self.view addSubview:self.tableView];
    [self addCons];
    
    [self loadData];
    // Do any additional setup after loading the view.
}

- (void)loadData{
    [[NetWorkManager sharedManager]requestData:nil path:@"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1" success:^(id responseObject) {
        NSLog(@"OK%@",responseObject);
    } failure:^(id error) {
        NSLog(@"网络请求出错了%@",error);
    }];
}

- (void)addCons {

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OneTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
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
