//
//  ZLImportantTodayVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLImportantTodayVC.h"
#import "ZLImportantTodayTableViewCell.h"
#import "ZLShipDetailVC.h"
#import "ZLImportShipModel.h"
#import "ZLImportantTodayRequest.h"
@interface ZLImportantTodayVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSMutableArray *sourceData;
@end

@implementation ZLImportantTodayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     self.sourceData = [NSMutableArray array];
//    self.requestStart = 1;
//    [self listData];
    
    [self.mainTableView.mj_header beginRefreshing];
    
    
    [self.view addSubview:self.mainTableView];
    
}

- (void)listData{
    ZLImportantTodayRequest *request = [[ZLImportantTodayRequest alloc]initWithPageNo:1];
    
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        ZLImportShipModel *shipModel = [[ZLImportShipModel alloc]initWithDictionary:request.responseJSONObject error:nil];
        if ([shipModel.result isEqualToString:@"0"]) {
//            if (_requestStart == 1) {
//                [_sourceData removeAllObjects];
//
//            }
            for (ZLImportantShipListDetailModel *detailModel in shipModel.detail.shipList) {
                
                [self.sourceData addObject:detailModel];
            }
            [self.mainTableView.mj_header endRefreshing];
//            [self.mainTableView.mj_footer endRefreshing];
            [self.mainTableView reloadData];
        }
        ZLLog(@"%@", request.responseString);
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-TopBarHeight-46 - BottomBarHeight);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
    }];

}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZLImportantTodayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLImportantTodayTableViewCell" forIndexPath:indexPath];
    
    ZLImportantShipListDetailModel *model = self.sourceData[indexPath.row];
    
    cell.detailModel = model;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLShipDetailVC *detailVC = [[ZLShipDetailVC alloc]init];
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        
        [_mainTableView registerClass:[ZLImportantTodayTableViewCell class] forCellReuseIdentifier:@"ZLImportantTodayTableViewCell"];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
//            _requestStart = 1;
            [self listData];
            
        }];
        
//        _mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//            _requestStart += 1;
//            [self listData];
//
//        }];
        
        
    }
    return _mainTableView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
