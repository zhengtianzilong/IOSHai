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
#import "ZLHomeCenterOrderVC.h"
#import "SelwynFormViewController.h"
#import "ZLLoginRequest.h"
#import "ZLLoginModel.h"
#import "ZLWeatherRequest.h"
#import "ZLWeatherModel.h"
@interface ZLLoginViewController ()<YTKChainRequestDelegate>
@property (nonatomic, strong) ZLLoginBaseView *loginBaseView;
@property (nonatomic, strong) IQKeyboardReturnKeyHandler *returnKeyHandler;
@property (nonatomic, strong) YTKKeyValueStore *dbStore;
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
    
    ZLDBStoreManager *dbManager = [ZLDBStoreManager shareDbStoreManager];
    
    self.dbStore = [dbManager createDB];
    
    [self.dbStore createTableWithName:@"LoginTable"];
    
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
    
    [SVProgressHUD showWithStatus:@"正在登陆"];
    ZLLoginRequest *loginRequest = [[ZLLoginRequest alloc]initWithName:self.loginBaseView.loginInputView.nameTextField.text password:self.loginBaseView.loginInputView.passTextField.text];
    
   
    
    YTKChainRequest *chainRequest = [[YTKChainRequest alloc]init];
    [chainRequest addRequest:loginRequest callback:^(YTKChainRequest * _Nonnull chainRequest, YTKBaseRequest * _Nonnull baseRequest) {
        
        ZLLoginRequest *loginRequest = (ZLLoginRequest *)baseRequest;
        
        ZLLoginModel *model = [[ZLLoginModel alloc]initWithDictionary:loginRequest.responseJSONObject error:nil];
        
        ZLLog(@"%@", model);
        
        
        if ([model.result isEqualToString:@"0"]) {
             ZLWeatherRequest *weatherRequest = [[ZLWeatherRequest alloc]init];
            [chainRequest addRequest:weatherRequest callback:^(YTKChainRequest * _Nonnull chainRequest, YTKBaseRequest * _Nonnull baseRequest) {
                
                ZLWeatherRequest *weatherRequest = (ZLWeatherRequest *)baseRequest;
                ZLWeatherModel *weatherModel = [[ZLWeatherModel alloc]initWithDictionary:weatherRequest.responseJSONObject error:nil];
                
                ZLLog(@"%@", weatherModel);
                
                if ([weatherModel.result isEqualToString:@"0"]) {
//                    [self.dbStore putObject:weatherRequest.responseJSONObject withId:DBLOGIN_ID_WEATHER intoTable:DBLOGIN_TABLE];
                    
                    [self.dbStore putString:weatherModel.toJSONString withId:DBLOGIN_ID_WEATHER intoTable:DBLOGIN_TABLE];
                    
                    
                }
                
                [SVProgressHUD dismissWithCompletion:^{
                    
                    [self removeFromParentViewController];
                    self.view = nil;
                    ZLMainTabarVC *mainTabarVC = [[ZLMainTabarVC alloc]init];
                    [UIApplication sharedApplication].keyWindow.rootViewController = mainTabarVC;
                }];
                
            }];
            
            
            
        }else{
            [SVProgressHUD showInfoWithStatus:model.resultNote];
            [SVProgressHUD dismissWithDelay:2];
        }
        
        
    }];
    
    chainRequest.delegate = self;
    [chainRequest start];
    
    
    
//    YTKBatchRequest *batch = [[YTKBatchRequest alloc]initWithRequestArray:@[loginRequest,weatherRequest]];
//
//    [batch startWithCompletionBlockWithSuccess:^(YTKBatchRequest * _Nonnull batchRequest) {
//
//
//
//
//
//
//    } failure:^(YTKBatchRequest * _Nonnull batchRequest) {
//
//    }];
//
//
//
//
//
//
//    [loginRequest startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//
//
//
//
//
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//
//
//    }];
//
    
}

- (void)chainRequestFinished:(YTKChainRequest *)chainRequest{
    
}

- (void)chainRequestFailed:(YTKChainRequest *)chainRequest failedBaseRequest:(YTKBaseRequest *)request{
    
    [SVProgressHUD showErrorWithStatus:@"请检查网络"];
    
    [SVProgressHUD dismissWithDelay:2];
    
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
