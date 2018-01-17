//
//  ZLMyTaskVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMyTaskVC.h"
#import "ZLMyWaitDealVC.h"
#import "ZLMyCompletedVC.h"
@interface ZLMyTaskVC ()



@end

@implementation ZLMyTaskVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ZLMyWaitDealVC *waitVC = [[ZLMyWaitDealVC alloc]init];
    ZLMyCompletedVC *completed = [[ZLMyCompletedVC alloc]init];
    
    
    
    NinaPagerView *ninaPagerView = [[NinaPagerView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) WithTitles:@[@"待处理", @"已处理"] WithVCs:@[waitVC, completed]];
//    ninaPagerView.nina_navigationBarHidden = YES;
    ninaPagerView.selectTitleColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
    ninaPagerView.unSelectTitleColor = [UIColor blackColor];
    ninaPagerView.underlineColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
    [self.view addSubview:ninaPagerView];
    
    
    
//    [ninaPagerView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.left.equalTo(self.view);
//        make.right.equalTo(self.view.mas_right);
//        make.top.equalTo(self.view);
//        make.bottom.equalTo(self.view.mas_bottom);
//
//    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
