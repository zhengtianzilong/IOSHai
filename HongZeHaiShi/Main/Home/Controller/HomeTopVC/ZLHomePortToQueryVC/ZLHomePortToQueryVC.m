//
//  ZLHomePortToQueryVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/31.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomePortToQueryVC.h"
#import "ZLHomePortTodayVC.h"
#import "ZLHomePortHistoryVC.h"
@interface ZLHomePortToQueryVC ()

@end

@implementation ZLHomePortToQueryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    ZLHomePortTodayVC *todayVC = [[ZLHomePortTodayVC alloc]init];
    ZLHomePortHistoryVC *historyVC = [[ZLHomePortHistoryVC alloc]init];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
