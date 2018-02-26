//
//  ZLShipReportDetailVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/9.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLShipReportDetailVC.h"

#import "ZLShipReportDetailTableViewCell.h"
#import "ZLHomeShipReportDetailRequest.h"
#import "ZLShipReportDetailsModel.h"
#import "ZLShipReportDetailTopTableViewCell.h"

@interface ZLShipReportDetailVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, assign) NSInteger requestStart;



@property (nonatomic, strong) NSMutableArray *sourceData;


@end

@implementation ZLShipReportDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.requestStart = 1;
    self.sourceData = [NSMutableArray array];
    [self listData];
    [self.view addSubview:self.mainTableView];
    
}

- (void)listData{
    ZLHomeShipReportDetailRequest *request = [[ZLHomeShipReportDetailRequest alloc]initWithCode:self.code pageNo:self.requestStart pageSize:10];
    
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        ZLShipReportDetailsModel *shipReportModel = [[ZLShipReportDetailsModel alloc]initWithDictionary:request.responseJSONObject error:nil];
        if ([shipReportModel.result isEqualToString:@"0"]) {
            
            if (_requestStart == 1) {
                
                [_sourceData removeAllObjects];
                [self.sourceData addObject:shipReportModel.detail];
            }
            for (ZLShipReportFlotillaReportDeatilModel *detailModel in shipReportModel.detail.flotillaReportDetailsList) {
                
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
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
    }];
    
}
#pragma mark -- 列表的代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 60;
    }
    
    return 110;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sourceData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        ZLShipReportDetailTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLShipReportDetailTopTableViewCell" forIndexPath:indexPath];
        
        ZLShipReportDetailListModel *model = self.sourceData[indexPath.section];
        
        cell.count.text = model.countShipSum;
        cell.length.text = model.countShipLength;
        return cell;
    }else{
        ZLShipReportDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLShipReportDetailTableViewCell" forIndexPath:indexPath];
        
        ZLShipReportFlotillaReportDeatilModel *model = self.sourceData[indexPath.section];
        
        cell.detailModel = model;
        
        return cell;
    }
    return nil;
}


- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        
        [_mainTableView registerClass:[ZLShipReportDetailTableViewCell class] forCellReuseIdentifier:@"ZLShipReportDetailTableViewCell"];
        
        [_mainTableView registerClass:[ZLShipReportDetailTopTableViewCell class] forCellReuseIdentifier:@"ZLShipReportDetailTopTableViewCell"];
        
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


- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"船队详情" attributes:dic];
    
    return title;
    
}

@end
