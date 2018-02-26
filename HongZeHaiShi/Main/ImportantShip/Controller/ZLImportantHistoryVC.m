//
//  ZLImportantHistoryVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLImportantHistoryVC.h"
#import "ZLQueryView.h"
#import "ZLImportantTodayTableViewCell.h"
#import "ZLImportantOtherRequest.h"
#import "ZLImportShipModel.h"
@interface ZLImportantHistoryVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) ZLQueryView *queryView;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSString *shipName;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, assign) NSInteger requestStart;
@property (nonatomic, strong) NSMutableArray *sourceData;
@end

@implementation ZLImportantHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.requestStart = 1;
    self.shipName = @"";
    self.startTime = @"";
    self.endTime = @"";
    
    self.sourceData = [NSMutableArray array];
    [self.view addSubview:self.queryView];
    [self.view addSubview:self.mainTableView];
//    [self listData];
    [self.mainTableView.mj_header beginRefreshing];
}

- (void)listData{
    ZLImportantOtherRequest *request = [[ZLImportantOtherRequest alloc]initWithshipName:self.shipName EndTime:self.endTime StarTime:self.startTime pageNo:self.requestStart pageSize:10];
    
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        ZLImportShipModel *shipModel = [[ZLImportShipModel alloc]initWithDictionary:request.responseJSONObject error:nil];
        if ([shipModel.result isEqualToString:@"0"]) {
            
            if (_requestStart == 1) {
                
                [_sourceData removeAllObjects];
            }
            for (ZLImportantShipListDetailModel *detailModel in shipModel.detail.shipList) {
                
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
    self.shipName = self.queryView.selectInfoView.shipName.infoTextField.text;
    [self.mainTableView.mj_header beginRefreshing];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.queryView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(0);
//        make.height.mas_equalTo(Main_Screen_Height / 3);
        
    }];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.queryView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom).offset(-TopBarHeight-46 - BottomBarHeight);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
    }];
    
}
#pragma mark -- 列表的代理
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
- (ZLQueryView *)queryView{
    if (!_queryView) {
        _queryView = [[ZLQueryView alloc]init];
         [_queryView.queryButton addTarget:self action:@selector(queryButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _queryView;
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        
        [_mainTableView registerClass:[ZLImportantTodayTableViewCell class] forCellReuseIdentifier:@"ZLImportantTodayTableViewCell"];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
