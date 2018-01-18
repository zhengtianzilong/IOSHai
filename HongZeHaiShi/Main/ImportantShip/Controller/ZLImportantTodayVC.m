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
@interface ZLImportantTodayVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@end

@implementation ZLImportantTodayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainTableView];
    
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
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZLImportantTodayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLImportantTodayTableViewCell" forIndexPath:indexPath];
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
    }
    return _mainTableView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
