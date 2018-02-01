//
//  ZLHomePunishmentRecordVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/31.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomePunishmentRecordVC.h"
#import "ZLHomePunishmentTodayVC.h"
#import "ZLHomePunishmentHistoryVC.h"
@interface ZLHomePunishmentRecordVC ()

@end

@implementation ZLHomePunishmentRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    ZLHomePunishmentTodayVC *todayVC = [[ZLHomePunishmentTodayVC alloc]init];
    ZLHomePunishmentHistoryVC *historyVC = [[ZLHomePunishmentHistoryVC alloc]init];
    NinaPagerView *ninaPagerView = [[NinaPagerView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) WithTitles:@[@"今日记录", @"历史记录"] WithVCs:@[todayVC, historyVC]];
    ninaPagerView.selectTitleColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
    ninaPagerView.unSelectTitleColor = [UIColor blackColor];
    ninaPagerView.underlineColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
    //    ninaPagerView.nina_navigationBarHidden = YES;
    [self.view addSubview:ninaPagerView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
