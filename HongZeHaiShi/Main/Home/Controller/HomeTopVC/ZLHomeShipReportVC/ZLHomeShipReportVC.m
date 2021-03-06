//
//  ZLHomeShipReportVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/31.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipReportVC.h"
#import "ZLHomeShipReportTodayVC.h"
#import "ZLHomeShipReportHistoryVC.h"
@interface ZLHomeShipReportVC ()

@end

@implementation ZLHomeShipReportVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZLHomeShipReportTodayVC *todayVC = [[ZLHomeShipReportTodayVC alloc]init];
    ZLHomeShipReportHistoryVC *historyVC = [[ZLHomeShipReportHistoryVC alloc]init];
    NinaPagerView *ninaPagerView = [[NinaPagerView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) WithTitles:@[@"今日记录", @"历史记录"] WithVCs:@[todayVC, historyVC]];
    ninaPagerView.selectTitleColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
    ninaPagerView.unSelectTitleColor = [UIColor blackColor];
    ninaPagerView.underlineColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
    //    ninaPagerView.nina_navigationBarHidden = YES;
    [self.view addSubview:ninaPagerView];
    
    
}


- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"船队报港" attributes:dic];
    
    return title;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
