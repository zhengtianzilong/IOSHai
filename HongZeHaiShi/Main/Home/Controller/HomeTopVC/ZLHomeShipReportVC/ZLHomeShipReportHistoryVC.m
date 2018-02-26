//
//  ZLHomeShipReportHistoryVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/31.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipReportHistoryVC.h"
#import "ZLQueryView.h"
#import "ZLHomeShipReportTableViewCell.h"
#import "ZLHomeShipReportRequest.h"
#import "ZLHomeShipReportModel.h"
#import "ZLShipReportDetailVC.h"
@interface ZLHomeShipReportHistoryVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) ZLQueryView *queryView;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, assign) NSInteger requestStart;

@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *endTime;

@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *boatName;

@property (nonatomic, strong) NSMutableArray *sourceData;


@end

@implementation ZLHomeShipReportHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.requestStart = 1;
    self.sourceData = [NSMutableArray array];
    
    self.type = @"1";
    self.startTime = @"";
    self.endTime = @"";
    self.boatName = @"";
    
    [self listData];
    
    [self.view addSubview:self.queryView];
    [self.view addSubview:self.mainTableView];
    
}

- (void)listData{
    ZLHomeShipReportRequest *request = [[ZLHomeShipReportRequest alloc]initWithType:self.type boatName:self.boatName pageNo:self.requestStart pageSize:10 st:self.startTime et:self.endTime];
    
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        ZLHomeShipReportModel *shipReportModel = [[ZLHomeShipReportModel alloc]initWithDictionary:request.responseJSONObject error:nil];
        if ([shipReportModel.result isEqualToString:@"0"]) {

            if (_requestStart == 1) {

                [_sourceData removeAllObjects];
            }
            for (ZLFlotillaReportModel *detailModel in shipReportModel.detail.flotillaReportList) {

                [self.sourceData addObject:detailModel];
            }
            [self.mainTableView.mj_header endRefreshing];
            [self.mainTableView.mj_footer endRefreshing];
            [self.mainTableView reloadData];
        }
        ZLLog(@"%@", request.responseString);
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}


/**
 查询按钮
 */
- (void)queryButtonClick{
    
    if ([self.queryView.selectInfoView.startTimeView.selectTimeLabel.text isEqualToString:@"请选择时间"]) {
        self.startTime = @"";
    }else{
        NSString *time = self.queryView.selectInfoView.startTimeView.selectTimeLabel.text;
        
        time = [time substringToIndex:time.length - 3];
        
        self.startTime = time;
    }
    
    if ([self.queryView.selectInfoView.endTimeView.selectTimeLabel.text isEqualToString:@"请选择时间"]) {
        self.endTime = @"";
    }else{
        NSString *time = self.queryView.selectInfoView.endTimeView.selectTimeLabel.text;
        
        time = [time substringToIndex:time.length - 3];
        
        self.endTime = time;
    }
    self.boatName = self.queryView.selectInfoView.shipName.infoTextField.text;
    
    if ([self.startTime isEqualToString:@""] && [self.endTime isEqualToString:@""] && [self.boatName isEqualToString:@""] ) {
        self.type = @"1";
    }else{
        self.type = @"2";
    }
//    [self listData];
    [self.mainTableView.mj_header beginRefreshing];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.queryView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(0);
        
    }];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.queryView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom).offset(-TopBarHeight-46);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
    }];
    
}
#pragma mark -- 列表的代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sourceData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ZLHomeShipReportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLHomeShipReportTableViewCell" forIndexPath:indexPath];
    
    ZLFlotillaReportModel *model = self.sourceData[indexPath.section];
    
    cell.flotillaModel = model;
    
    return cell;
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



- (ZLQueryView *)queryView{
    if (!_queryView) {
        _queryView = [[ZLQueryView alloc]init];
        [_queryView.queryButton addTarget:self action:@selector(queryButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _queryView;
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        
        [_mainTableView registerClass:[ZLHomeShipReportTableViewCell class] forCellReuseIdentifier:@"ZLHomeShipReportTableViewCell"];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        
        _mainTableView.sectionFooterHeight = 20;
        _mainTableView.sectionHeaderHeight = 0;
        _mainTableView.contentInset = UIEdgeInsetsMake(20 - 35, 0, 0, 0);
        
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
