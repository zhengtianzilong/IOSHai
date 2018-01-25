//
//  ZLHomeShipQueryVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/24.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipQueryVC.h"
#import "ZLHomeShipQueryTopView.h"
#import "ZLHomeShipQueryTableViewCell.h"
#import "ZLHomeCenterOrderVC.h"
#import "ZLShipDetailVC.h"
#import "ZLHomeVC.h"
@interface ZLHomeShipQueryVC ()<UITableViewDelegate, UITableViewDataSource>
//@property (nonatomic, strong) UIButton *queryButton;

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) ZLHomeShipQueryTopView *queryTopView;
@end

@implementation ZLHomeShipQueryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    [self.view addSubview:self.queryTopView];
    [self.view addSubview:self.mainTableView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self.queryTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view).offset(10);
    }];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.queryTopView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
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
    
    ZLHomeShipQueryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLHomeShipQueryTableViewCell" forIndexPath:indexPath];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger count = self.navigationController.viewControllers.count;
    
    Class class = [self.navigationController.viewControllers objectAtIndex:count - 2].class;
    
    if ([class isEqual: [ZLHomeCenterOrderVC class]]) {
        
        if (self.shipBlock) {
            ZLHomeShipQueryTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
           
            self.shipBlock(cell.titleLabel.text);
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }else if ([class isEqual: [ZLHomeVC class]]){
        ZLHomeVC *vc = [[ZLHomeVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    ZLLog(@"%@",class);
    
}




- (ZLHomeShipQueryTopView *)queryTopView{
    if (!_queryTopView) {
        
        _queryTopView = [[ZLHomeShipQueryTopView alloc]init];
        
    }
    return _queryTopView;
}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        [_mainTableView registerClass:[ZLHomeShipQueryTableViewCell class] forCellReuseIdentifier:@"ZLHomeShipQueryTableViewCell"];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}


@end
