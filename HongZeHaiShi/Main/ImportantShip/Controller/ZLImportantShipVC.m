//
//  ZLImportantShipVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/12.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLImportantShipVC.h"
#import "ZLImportantTodayVC.h"
#import "ZLImportantHistoryVC.h"
@interface ZLImportantShipVC ()

@end

@implementation ZLImportantShipVC

- (void)viewDidLoad {
    [super viewDidLoad];
    ZLImportantTodayVC *todayVC = [[ZLImportantTodayVC alloc]init];
    ZLImportantHistoryVC *historyVC = [[ZLImportantHistoryVC alloc]init];
    NinaPagerView *ninaPagerView = [[NinaPagerView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) WithTitles:@[@"今日重点船舶", @"历史重点船舶"] WithVCs:@[todayVC, historyVC]];
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
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"重点船舶" attributes:dic];
    
    return title;
    
}

- (UIButton *)set_leftButton{
    return  nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
