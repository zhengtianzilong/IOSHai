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
#import "ZLHomeCruiseTaskVC.h"
#import "ZLHomeAccidentInvestigationVC.h"
#import "ZLHomeShipFlagVC.h"
#import "ZLHomeSOSTaskVC.h"
#import "ZLHomeEnforcementLawVC.h"
#import "ZLHomePunishmentRecordVC.h"
#import "ZLHomePortToQueryVC.h"
#import "ZLHomeShipReportVC.h"
@interface ZLHomeVC ()
@property (nonatomic, strong) ZLHomeTopView *homeTopView;
@property (nonatomic, strong) ZLHomeCenterView *homeCenterView;
@property (nonatomic, strong) ZLHomeDynamicView *homeDynamicView;
@property (nonatomic, strong) ZLHomeBottomView *homeBottomView;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@end

@implementation ZLHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    
    [self.view addSubview:self.mainScrollView];
    
    [self.mainScrollView addSubview:self.homeTopView];
    [self.mainScrollView addSubview:self.homeCenterView];
    [self.mainScrollView addSubview:self.homeDynamicView];
    [self.mainScrollView addSubview:self.homeBottomView];
    
     __weak typeof(self) weakSelf = self;
    
    self.homeCenterView.centerItemBlock = ^(ZLHomeCenterCollectionModel *model, NSIndexPath *indexpath) {
      
        if ([model.title isEqualToString:@"船舶查询"]) {
            ZLHomeShipQueryVC *vc = [[ZLHomeShipQueryVC alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        
        if ([model.title isEqualToString:@"处罚记录"]) {
            ZLHomePunishmentRecordVC *vc = [[ZLHomePunishmentRecordVC alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        
        if ([model.title isEqualToString:@"报港查询"]) {
            ZLHomePortToQueryVC *vc = [[ZLHomePortToQueryVC alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        
        if ([model.title isEqualToString:@"船队报港"]) {
            ZLHomeShipReportVC *vc = [[ZLHomeShipReportVC alloc]init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        
    };
    
    self.homeBottomView.bottomViewBlock = ^(ZLHomeBottomCollectionModel *model, NSIndexPath *indexpath) {
        if ([model.title isEqualToString:@"中心指令"]) {
            
            ZLHomeCenterOrderVC *vc = [[ZLHomeCenterOrderVC alloc]init];
            
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }
        
        if ([model.title isEqualToString:@"巡航任务"]) {
            
            ZLHomeCruiseTaskVC *vc = [[ZLHomeCruiseTaskVC alloc]init];
            
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }
        
        if ([model.title isEqualToString:@"事故调查"]) {
            
            ZLHomeAccidentInvestigationVC *vc = [[ZLHomeAccidentInvestigationVC alloc]init];
            
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }
        if ([model.title isEqualToString:@"船旗国安检"]) {
            
            ZLHomeShipFlagVC *vc = [[ZLHomeShipFlagVC alloc]init];
            
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }
        if ([model.title isEqualToString:@"搜救任务"]) {
            
            ZLHomeSOSTaskVC *vc = [[ZLHomeSOSTaskVC alloc]init];
            
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }
        if ([model.title isEqualToString:@"现场执法"]) {
            ZLHomeShipQueryVC *vc = [[ZLHomeShipQueryVC alloc]init];
            vc.tag = @"ZLHomeEnforcementLawVC";
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }
        if ([model.title isEqualToString:@"快速巡航"]) {
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
    
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-BottomBarHeight);
        make.width.equalTo(self.view);
        make.left.equalTo(self.view);
    }];
    
    [self.homeTopView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.mainScrollView);
        make.centerX.equalTo(self.mainScrollView);
        make.width.mas_equalTo(Main_Screen_Width);
        
    }];
    
    [self.homeCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.homeTopView.mas_bottom);
        make.centerX.equalTo(self.mainScrollView);
        make.width.mas_equalTo(Main_Screen_Width);
        make.height.mas_equalTo(Main_Screen_Width / 2);
        
    }];
    [self.homeDynamicView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.homeCenterView.mas_bottom).offset(7);
        make.centerX.equalTo(self.mainScrollView);
        make.width.mas_equalTo(Main_Screen_Width);
        make.height.mas_equalTo(50);
        
    }];
    
    [self.homeBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.homeDynamicView.mas_bottom).offset(7);
        make.centerX.equalTo(self.mainScrollView);
        make.width.mas_equalTo(Main_Screen_Width);
//        make.height.mas_equalTo(Main_Screen_Height);
        make.bottom.equalTo(self.mainScrollView.mas_bottom);
    }];
    
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.homeBottomView.mas_bottom);
    }];

    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    NSLog(@"%f",self.mainScrollView.contentSize.height);
    // 设置过渡视图的底边距（此设置将影响到scrollView的contentSize）
//    self.mainScrollView.contentSize = CGSizeMake(0, 2 * Main_Screen_Height);

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

- (UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc]init];
        _mainScrollView.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
        _mainScrollView.showsHorizontalScrollIndicator = NO;
    }
    return _mainScrollView;
}

@end
