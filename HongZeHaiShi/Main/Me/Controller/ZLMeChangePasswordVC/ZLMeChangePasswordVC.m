//
//  ZLMeChangePasswordVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/16.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMeChangePasswordVC.h"
#import "ZLMeChangePasswordView.h"
@interface ZLMeChangePasswordVC ()
@property (nonatomic, strong) ZLMeChangePasswordView *changePasswordView;;
@end

@implementation ZLMeChangePasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.changePasswordView];
    [self.changePasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view).offset(TopBarHeight);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    

    
    
}


- (ZLMeChangePasswordView *)changePasswordView{
    if (!_changePasswordView) {
        
        _changePasswordView = [[ZLMeChangePasswordView alloc]init];
        
    }
    return _changePasswordView;
}


- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"修改密码" attributes:dic];
    
    return title;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
