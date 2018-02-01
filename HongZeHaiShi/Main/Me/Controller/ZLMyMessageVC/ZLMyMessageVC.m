//
//  ZLMyMessageVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/1.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMyMessageVC.h"
#import "ZLMyMessageTableViewCell.h"
@interface ZLMyMessageVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;

@end

@implementation ZLMyMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainTableView];
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
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
        return @"今日消息";
    }else{
        return @"其他消息";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZLMyMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLMyMessageTableViewCell" forIndexPath:indexPath];
    return cell;
    
}
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        
        [_mainTableView registerClass:[ZLMyMessageTableViewCell class] forCellReuseIdentifier:@"ZLMyMessageTableViewCell"];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}



- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"消息提醒" attributes:dic];
    
    return title;
    
}

@end
