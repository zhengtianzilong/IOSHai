//
//  ZLHomeAnnouncementsVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/31.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeAnnouncementsVC.h"
#import "ZLHomeShipInformationVC.h"
#import "ZLHomeShipInternalVC.h"
@interface ZLHomeAnnouncementsVC ()

@end

@implementation ZLHomeAnnouncementsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    ZLHomeShipInformationVC *infoVC = [[ZLHomeShipInformationVC alloc]init];
    ZLHomeShipInternalVC *interVC = [[ZLHomeShipInternalVC alloc]init];
    NinaPagerView *ninaPagerView = [[NinaPagerView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) WithTitles:@[@"通航信息", @"内部通知"] WithVCs:@[infoVC, interVC]];
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
