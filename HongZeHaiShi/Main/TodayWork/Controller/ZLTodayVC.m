//
//  ZLTodayVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/12.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLTodayVC.h"

@interface ZLTodayVC ()

@end

@implementation ZLTodayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"今日值班" attributes:dic];
    
    return title;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
