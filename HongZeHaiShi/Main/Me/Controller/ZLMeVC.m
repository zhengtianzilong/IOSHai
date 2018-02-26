//
//  ZLMeVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/12.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMeVC.h"
#import "ZLMeTopView.h"
#import "ZLMeBottomView.h"
#import "ZLLoginViewController.h"
#import "ZLMeChangePasswordVC.h"
#import "ZLMyTaskVC.h"
#import "ZLMyMessageVC.h"
@interface ZLMeVC ()
@property (nonatomic, strong) ZLMeTopView *topView;

@property (nonatomic, strong) ZLMeBottomView *bottomView;

@end

@implementation ZLMeVC

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self.view addSubview:self.topView];
    [self.view addSubview:self.bottomView];

    __weak typeof(self) weakself= self;
    self.bottomView.bottomViewBlock = ^(ZLMeCollectionModel *model, NSIndexPath *indexpath) {
    
        
        if ([model.title isEqualToString:@"注销登录"]) {
            
            [UIAlertView alertWithCallBackBlock:^(NSInteger buttonIndex) {
                
                if (buttonIndex == 1) {
                    
                    ZLLoginViewController * login =[[ZLLoginViewController alloc]init];
                    
                    [weakself presentViewController:login animated:YES completion:^{
                        //                    [self removeFromParentViewController];
                       [UIApplication sharedApplication].keyWindow.rootViewController = login;
                    }];
                    
                }
                
            } title:@"提示" message:@"确定要退出登录" cancelButtonName:@"取消" otherButtonTitles:@"确定", nil];
            
        }
        
        if ([model.title isEqualToString:@"修改密码"]){
            
            ZLMeChangePasswordVC *changeVC = [[ZLMeChangePasswordVC alloc]init];
            
            [weakself.navigationController pushViewController:changeVC animated:YES];
            
        }
        
        if ([model.title isEqualToString:@"我的任务"]){
            
            ZLMyTaskVC *myTaskVC = [[ZLMyTaskVC alloc]init];
            
            [weakself.navigationController pushViewController:myTaskVC animated:YES];
            
        }
        if ([model.title isEqualToString:@"消息提醒"]){
            
            ZLMyMessageVC *myMessageVC = [[ZLMyMessageVC alloc]init];
            
            [weakself.navigationController pushViewController:myMessageVC animated:YES];
            
        }
    };
    
    
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view);
        make.width.mas_equalTo(Main_Screen_Width);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.topView.mas_bottom);
        make.centerX.equalTo(self.view);
        make.width.mas_offset(Main_Screen_Width);
        make.bottom.equalTo(self.view.mas_bottom);
        
    }];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    

    

    
}

- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"我的" attributes:dic];
    
    return title;
    
}
- (UIButton *)set_leftButton{
    return  nil;
}
- (ZLMeTopView *)topView{
    if (!_topView) {
        _topView = [[ZLMeTopView alloc]init];
    }
    return _topView;
    
}

- (ZLMeBottomView *)bottomView{
    if (!_bottomView) {
        
        _bottomView = [[ZLMeBottomView alloc]init];
        
        
    }
    return _bottomView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
