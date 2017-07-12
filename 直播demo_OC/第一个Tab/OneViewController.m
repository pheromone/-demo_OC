//
//  OneViewController.m
//  直播demo_OC
//
//  Created by Shaoting Zhou on 2017/6/29.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

#import "OneViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface OneViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) OneModel *oneModel;
@property(nonatomic,strong)UITableView  *tableView;
@property(nonatomic,strong)AVAudioPlayer   *player ;
@property(nonatomic,assign)BOOL isAnimation;
@end

@implementation OneViewController
static NSString * cellIdentifier = @"oneCell";

- (NSMutableArray *)totalArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

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
    [self loadData];
    // Do any additional setup after loading the view.
}

- (void)loadData{
    __weak typeof(self) weakself = self;
    [[NetWorkManager sharedManager]requestData:nil path:@"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1" success:^(id responseObject) {
        weakself.dataArray = [OneModel mj_objectArrayWithKeyValuesArray:responseObject[@"lives"]];
        [weakself.tableView reloadData];
//        NSLog(@"OK%@",responseObject);
    } failure:^(id error) {
        NSLog(@"网络请求出错了%@",error);
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OneTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//    NSLog(@"%@",self.dataArray);
    cell.oneModel = self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * path = [NSBundle.mainBundle pathForResource:@"start" ofType:@"mp3"];
    NSData * data = [[NSData alloc]initWithContentsOfFile:path];
    self.player = [[AVAudioPlayer alloc]initWithData:data error:nil];
    [self.player updateMeters];
    [self.player prepareToPlay];
    [self.player play];
    
    VideoViewController * video = [[VideoViewController alloc]init];
    self.oneModel = self.dataArray[indexPath.row];
    video.stream_addr = _oneModel.stream_addr;
    video.portrait = _oneModel.creator.portrait;
    [self presentViewController:video animated:YES completion:nil] ;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static CGFloat y = 0;
    if (scrollView.contentOffset.y > y)
    {
        self.isAnimation = YES;
    }
    else
    {
        self.isAnimation = NO;
    }
    y = scrollView.contentOffset.y;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!_isAnimation)
    {
        return;
    }
    CGAffineTransform tran = CGAffineTransformMakeTranslation(cell.transform.tx, cell.transform.ty + 70);
    cell.transform = tran;
    [UIView animateWithDuration:0.8 animations:^{
        cell.transform = CGAffineTransformMakeTranslation(cell.transform.tx, cell.transform.ty - 70);
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
