//
//  ZLHomeVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/12.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeVC.h"
#import "ZLHomeTopView.h"
#import "ZLHomeCenterView.h"
#import "ZLHomeDynamicView.h"
#import "ZLHomeBottomView.h"
#import "ZLHomeCenterOrderVC.h"
#import "ZLHomeShipQueryVC.h"
@interface ZLHomeVC ()
@property (nonatomic, strong) ZLHomeTopView *homeTopView;
@property (nonatomic, strong) ZLHomeCenterView *homeCenterView;
@property (nonatomic, strong) ZLHomeDynamicView *homeDynamicView;
@property (nonatomic, strong) ZLHomeBottomView *homeBottomView;
@end

@implementation ZLHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.homeTopView];
    [self.view addSubview:self.homeCenterView];
    [self.view addSubview:self.homeDynamicView];
    [self.view addSubview:self.homeBottomView];
    
     __weak typeof(self) weakSelf = self;
    
    self.homeCenterView.centerItemBlock = ^(ZLHomeCenterCollectionModel *model, NSIndexPath *indexpath) {
      
        if ([model.title isEqualToString:@"船舶查询"]) {
            ZLHomeShipQueryVC *vc = [[ZLHomeShipQueryVC alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        
    };
    
    self.homeBottomView.bottomViewBlock = ^(ZLHomeBottomCollectionModel *model, NSIndexPath *indexpath) {
        if ([model.title isEqualToString:@"中心指令"]) {
            
            ZLHomeCenterOrderVC *vc = [[ZLHomeCenterOrderVC alloc]init];
            
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }
    };
    
    
}

- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"洪泽海事移动执法平台" attributes:dic];
    
    return title;
    
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    
    [self.homeTopView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(Main_Screen_Width);
        
    }];
    
    [self.homeCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.homeTopView.mas_bottom);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(Main_Screen_Width);
        make.height.mas_equalTo(Main_Screen_Width / 2);
        
    }];
    [self.homeDynamicView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.homeCenterView.mas_bottom).offset(7);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(Main_Screen_Width);
        make.height.mas_equalTo(50);
        
    }];
    
    [self.homeBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.homeDynamicView.mas_bottom).offset(7);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(Main_Screen_Width);
        make.height.mas_equalTo(Main_Screen_Width / 2);
        
    }];
}


- (UIButton *)set_leftButton{
    return  nil;
}


- (ZLHomeTopView *)homeTopView{
    if (!_homeTopView) {
        _homeTopView = [[ZLHomeTopView alloc]init];
        
    }
    return _homeTopView;
    
}

- (ZLHomeCenterView *)homeCenterView{
    if (!_homeCenterView) {
        _homeCenterView = [[ZLHomeCenterView alloc]init];
    }
    return _homeCenterView;
}

- (ZLHomeDynamicView *)homeDynamicView{
    if (!_homeDynamicView) {
        _homeDynamicView = [[ZLHomeDynamicView alloc]init];
    }
    return _homeDynamicView;
}
- (ZLHomeBottomView *)homeBottomView{
    if (!_homeBottomView) {
        _homeBottomView = [[ZLHomeBottomView alloc]init];
    }
    return _homeBottomView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
