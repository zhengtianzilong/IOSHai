//
//  ZLTodayDetailVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLTodayDetailVC.h"

@interface ZLTodayDetailVC ()

@end

@implementation ZLTodayDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - TopBarHeight)];
    [self.view addSubview:webView];
    [webView loadHTMLString:_htmlTableString baseURL:nil];
    
    
    
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
