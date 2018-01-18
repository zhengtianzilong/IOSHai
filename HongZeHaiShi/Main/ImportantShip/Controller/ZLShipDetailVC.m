//
//  ZLShipDetailVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/18.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLShipDetailVC.h"
#import "ZLShipBaseDetailView.h"
@interface ZLShipDetailVC ()
@property (nonatomic, strong) ZLShipBaseDetailView *detailView;
@end

@implementation ZLShipDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.detailView];
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.width.mas_equalTo(Main_Screen_Width);
        make.height.mas_equalTo(Main_Screen_Height);
        
    }];
    
}

- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"船舶详情" attributes:dic];
    
    return title;
    
}

- (ZLShipBaseDetailView *)detailView{
    if (!_detailView) {
        _detailView = [[ZLShipBaseDetailView alloc]init];
        
    }
    return _detailView;
}




@end
