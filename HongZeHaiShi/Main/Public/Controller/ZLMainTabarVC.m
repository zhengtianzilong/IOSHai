//
//  ZLMainTabarVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/12.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMainTabarVC.h"
#import "ZLHomeVC.h"
#import "ZLImportantShipVC.h"
#import "ZLTodayVC.h"
#import "ZLMeVC.h"
#import "ZLBaseNavgationViewController.h"
@interface ZLMainTabarVC ()

@property (nonatomic, strong) NSArray *tabbarVCs;

@property (nonatomic, strong) NSArray *tabbarAttrs;

@end

@implementation ZLMainTabarVC

- (instancetype)init{
        
    self = [super initWithViewControllers:self.tabbarVCs tabBarItemsAttributes:self.tabbarAttrs];
    return self;
}


- (NSArray *)tabbarVCs{
    if (!_tabbarVCs) {
        ZLHomeVC *firstViewController = [[ZLHomeVC alloc] init];
        UIViewController *firstNavigationController = [[ZLBaseNavgationViewController alloc]initWithRootViewController:firstViewController];
        
        ZLImportantShipVC *secondViewController = [[ZLImportantShipVC alloc] init];
        UIViewController *secondNavigationController = [[ZLBaseNavgationViewController alloc]initWithRootViewController:secondViewController];
        
        ZLTodayVC *thirdViewController = [[ZLTodayVC alloc] init];
        UIViewController *thirdNavigationController = [[ZLBaseNavgationViewController alloc]initWithRootViewController:thirdViewController];
        
        ZLMeVC *fourViewController = [[ZLMeVC alloc] init];
        UIViewController *fourNavigationController = [[ZLBaseNavgationViewController alloc]initWithRootViewController:fourViewController];
        
        _tabbarVCs = @[
                       firstNavigationController,
                       secondNavigationController,
                       thirdNavigationController,
                       fourNavigationController
                       ];
        
    }
    
    return _tabbarVCs;
}

- (NSArray *)tabbarAttrs{
    if (!_tabbarAttrs) {
        NSDictionary *dict1 = @{
                                CYLTabBarItemTitle : @"首页",
                                CYLTabBarItemImage : @"home_normal",
                                CYLTabBarItemSelectedImage : @"home_highlight",
                                };
        NSDictionary *dict2 = @{
                                CYLTabBarItemTitle : @"重点船舶",
                                CYLTabBarItemImage : @"mycity_normal",
                                CYLTabBarItemSelectedImage : @"mycity_highlight",
                                };
        NSDictionary *dict3 = @{
                                CYLTabBarItemTitle : @"今日值班",
                                CYLTabBarItemImage : @"mycity_normal",
                                CYLTabBarItemSelectedImage : @"mycity_highlight",
                                };
        NSDictionary *dict4 = @{
                                CYLTabBarItemTitle : @"我的",
                                CYLTabBarItemImage : @"mycity_normal",
                                CYLTabBarItemSelectedImage : @"mycity_highlight",
                                };
       _tabbarAttrs = @[dict1, dict2, dict3, dict4 ];
    }
    return _tabbarAttrs;
}


@end
