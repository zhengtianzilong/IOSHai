//
//  ZLMyCompletedVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMyCompletedVC.h"
#import "ZLMyTaskTableViewCell.h"
@interface ZLMyCompletedVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;

@end

@implementation ZLMyCompletedVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.mainTableView];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"今日任务";
    }else{
        return @"其他任务";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZLMyTaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLMyTaskTableViewCell" forIndexPath:indexPath];
    return cell;
    
}
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        
        [_mainTableView registerClass:[ZLMyTaskTableViewCell class] forCellReuseIdentifier:@"ZLMyTaskTableViewCell"];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}
@end
