//
//  ZLBaseCustomNavViewController.m
//  AIProduct
//
//  Created by mac on 2017/8/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ZLBaseCustomNavViewController.h"

@interface ZLBaseCustomNavViewController ()

@end

@implementation ZLBaseCustomNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}



- (UIColor *)set_colorBackground{
    return HEXCOLOR(CNAVGATIONBAR_COLOR);
}

- (UIButton *)set_leftButton{
    
    UIImage* backItemImage = [UIImage imageNamed:@"nav_back"];
//    UIImage* backItemHlImage = [[UIImage imageNamed:@"login_nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 23, 23)];
//    [backButton setImage:backItemImage forState:UIControlStateNormal];
    
    [backButton setBackgroundImage:backItemImage forState:(UIControlStateNormal)];
    
    
    
//    [backButton setImage:backItemHlImage forState:UIControlStateHighlighted];
//    [backButton sizeToFit];
    return backButton;
}

- (void)left_button_event:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
