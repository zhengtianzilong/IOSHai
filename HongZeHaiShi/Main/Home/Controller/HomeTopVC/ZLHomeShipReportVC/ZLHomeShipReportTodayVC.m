//
//  ZLHomeShipReportTodayVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/31.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipReportTodayVC.h"
#import "ZLHomeShipReportTableViewCell.h"
#import "ZLHomeShipReportRequest.h"
#import "ZLHomeShipReportModel.h"
#import "ZLShipReportTodayRecordTableViewCell.h"
#import "ZLShipReportDetailVC.h"
@interface ZLHomeShipReportTodayVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, assign) NSInteger requestStart;

@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *endTime;

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *boatName;

@property (nonatomic, strong) NSMutableArray *sourceData;


@end

@implementation ZLHomeShipReportTodayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.requestStart = 1;
    self.sourceData = [NSMutableArray array];
    
    self.type = @"0";
    self.startTime = @"";
    self.endTime = @"";
    self.boatName = @"";
    
    [self listData];
    [self.view addSubview:self.mainTableView];
    
}

- (void)listData{
    ZLHomeShipReportRequest *request = [[ZLHomeShipReportRequest alloc]initWithType:self.type boatName:self.boatName pageNo:self.requestStart pageSize:10 st:self.startTime et:self.endTime];
    
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        ZLHomeShipReportModel *shipReportModel = [[ZLHomeShipReportModel alloc]initWithDictionary:request.responseJSONObject error:nil];
        if ([shipReportModel.result isEqualToString:@"0"]) {
            
            if (_requestStart == 1) {
                
                [_sourceData removeAllObjects];
                [self.sourceData addObject:shipReportModel];
            }
            for (ZLFlotillaReportModel *detailModel in shipReportModel.detail.flotillaReportList) {
                
                [self.sourceData addObject:detailModel];
            }
            [self.mainTableView.mj_header endRefreshing];
            [self.mainTableView.mj_footer endRefreshing];
            [self.mainTableView reloadData];
        }else{
            [self.mainTableView.mj_header endRefreshing];
            [self.mainTableView.mj_footer endRefreshing];
        }
        ZLLog(@"%@", request.responseString);
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        [self.mainTableView.mj_header endRefreshing];
        [self.mainTableView.mj_footer endRefreshing];
    }];
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-TopBarHeight-46);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
    }];
    
}
#pragma mark -- 列表的代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 44;
    }
    
    return 160;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sourceData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        ZLShipReportTodayRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLShipReportTodayRecordTableViewCell" forIndexPath:indexPath];
        
        ZLHomeShipReportModel *model = self.sourceData[indexPath.section];
        
        cell.countLabel.text = model.detail.countShipSum;
        
        return cell;
    }else{
        ZLHomeShipReportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLHomeShipReportTableViewCell" forIndexPath:indexPath];
        
        ZLFlotillaReportModel *model = self.sourceData[indexPath.section];
        
        cell.flotillaModel = model;
        
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return;
    }
    
    ZLFlotillaReportModel *model = self.sourceData[indexPath.section];
    
    ZLShipReportDetailVC *detailVC = [[ZLShipReportDetailVC alloc]init];
    detailVC.code = model.reportHarborCode;
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        
        [_mainTableView registerClass:[ZLHomeShipReportTableViewCell class] forCellReuseIdentifier:@"ZLHomeShipReportTableViewCell"];
        
        [_mainTableView registerClass:[ZLShipReportTodayRecordTableViewCell class] forCellReuseIdentifier:@"ZLShipReportTodayRecordTableViewCell"];
        
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        
        _mainTableView.sectionFooterHeight = 15;
        _mainTableView.sectionHeaderHeight = 0;
        _mainTableView.contentInset = UIEdgeInsetsMake(15 - 35, 0, 0, 0);
        
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            _requestStart = 1;
            [self listData];
            
        }];
        
        _mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            _requestStart += 1;
            [self listData];
            
        }];
        
    }
    return _mainTableView;
}
@end
