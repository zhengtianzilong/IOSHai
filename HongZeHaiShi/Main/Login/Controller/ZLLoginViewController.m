//
//  ZLLoginViewController.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/15.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLLoginViewController.h"
#import "ZLLoginBaseView.h"
#import "ZLMainTabarVC.h"
@interface ZLLoginViewController ()
@property (nonatomic, strong) ZLLoginBaseView *loginBaseView;
@property (nonatomic, strong) IQKeyboardReturnKeyHandler *returnKeyHandler;
@end

@implementation ZLLoginViewController

- (void)dealloc{
    self.returnKeyHandler = nil;
}

- (void)configIQKeyboard {
    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    self.returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyDone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.loginBaseView];
    
    [self configIQKeyboard];
    
    [self.loginBaseView.loginInputView.loginBtn addTarget:self action:@selector(loginClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    [self.loginBaseView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.height.mas_equalTo(Main_Screen_Height);
        make.width.mas_equalTo(Main_Screen_Width);
        
    }];
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    
    
}



/**
 登录方法
 */
- (void)loginClick{
    
    [self removeFromParentViewController];
    
    ZLMainTabarVC *mainTabarVC = [[ZLMainTabarVC alloc]init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = mainTabarVC;

    
}


#pragma mark -- 懒加载
- (ZLLoginBaseView *)loginBaseView{
    if (!_loginBaseView) {
        _loginBaseView = [[ZLLoginBaseView alloc]init];
    }
    return _loginBaseView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
