//
//  ZLBaseNavgationViewController.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/16.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseNavgationViewController.h"

@interface ZLBaseNavgationViewController ()

@end

@implementation ZLBaseNavgationViewController

//- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
//    
//    ZLBaseNavgationViewController *nvc = [super initWithRootViewController:rootViewController];
//    
//    self.interactivePopGestureRecognizer.delegate = self;
//    
//    nvc.delegate = self;
//    
//    return nvc;
//    
//    
//}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        //第二级则隐藏底部Tab
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
