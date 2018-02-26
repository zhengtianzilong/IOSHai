//
//  ZLHomeShipInformationVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/31.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipInformationVC.h"
#import "ZLAnnouncementShipModel.h"
#import "ZLAnnounceQueryRiverRequest.h"
#import "ZLAnnouncementShipTableViewCell.h"
#import "ZLHomeShipInfoDetailVC.h"
@interface ZLHomeShipInformationVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSMutableArray *sourceData;
@property (nonatomic, assign) NSInteger requestStart;
@end

@implementation ZLHomeShipInformationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.sourceData = [NSMutableArray array];
        self.requestStart = 1;
    //    [self listData];
    [self.view addSubview:self.mainTableView];
    [self.mainTableView.mj_header beginRefreshing];
    
    
    
    
}

- (void)listData{
    ZLAnnounceQueryRiverRequest *request = [[ZLAnnounceQueryRiverRequest alloc]initWithPageNo:self.requestStart pageSize:10];
    
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        ZLAnnouncementShipModel *shipModel = [[ZLAnnouncementShipModel alloc]initWithDictionary:request.responseJSONObject error:nil];
        if ([shipModel.result isEqualToString:@"0"]) {
            if (_requestStart == 1) {
                [_sourceData removeAllObjects];
                
            }
            for (ZLOaNotifyListDetailModel *detailModel in shipModel.detail.oaNotifyList) {
                
                [self.sourceData addObject:detailModel];
            }
            [self.mainTableView.mj_header endRefreshing];
            [self.mainTableView.mj_footer endRefreshing];
            [self.mainTableView reloadData];
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

- (void)updateViewConstraints{
    [super updateViewConstraints];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZLAnnouncementShipTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLAnnouncementShipTableViewCell" forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    ZLOaNotifyListDetailModel *model = self.sourceData[indexPath.row];
    
    cell.detailModel = model;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLHomeShipInfoDetailVC *detailVC = [[ZLHomeShipInfoDetailVC alloc]init];
    
    ZLOaNotifyListDetailModel *model = self.sourceData[indexPath.row];
    
    detailVC.url = model.detailsUrl;
    detailVC.codeId = model.SEQ_ID;
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        
        [_mainTableView registerClass:[ZLAnnouncementShipTableViewCell class] forCellReuseIdentifier:@"ZLAnnouncementShipTableViewCell"];
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


@end
