//
//  ZLHomeShipReportHistoryVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/31.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipReportHistoryVC.h"
#import "ZLQueryView.h"
#import "ZLImportantTodayTableViewCell.h"
@interface ZLHomeShipReportHistoryVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) ZLQueryView *queryView;
@property (nonatomic, strong) UITableView *mainTableView;
@end

@implementation ZLHomeShipReportHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.queryView];
    [self.view addSubview:self.mainTableView];
    
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
        make.bottom.equalTo(self.view.mas_bottom).offset(-TopBarHeight-46);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
    }];
    
}
#pragma mark -- 列表的代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZLImportantTodayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLImportantTodayTableViewCell" forIndexPath:indexPath];
    return cell;
    
}
- (ZLQueryView *)queryView{
    if (!_queryView) {
        _queryView = [[ZLQueryView alloc]init];
    }
    return _queryView;
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        
        [_mainTableView registerClass:[ZLImportantTodayTableViewCell class] forCellReuseIdentifier:@"ZLImportantTodayTableViewCell"];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}
@end
