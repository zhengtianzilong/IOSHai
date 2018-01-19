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
@property (nonatomic, strong) UIScrollView *mainScrollView;
@end

@implementation ZLShipDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView addSubview:self.detailView];
    
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.left.equalTo(self.view);
//        make.top.equalTo(self.view);
//        make.width.mas_equalTo(Main_Screen_Width);
//        make.height.mas_equalTo( 5 *  Main_Screen_Height);
        
        
        
        //设置边距相对于scrollView的约束
        //（自己的见解：contentView的edges相对scrollView的edges的约束  contentView实际上被拉伸的宽高是相对于scrollView的contentSize的）
        make.edges.equalTo(self.mainScrollView);
        make.bottom.equalTo(self.mainScrollView.mas_bottom);
//        //因为上面的宽高是相对于contentSize的  所以为0  这里需要设置contentView的宽度约束后  scrollView的contentSize.width就会拉伸
        make.width.equalTo(self.mainScrollView);
        
    }];
    // 设置过渡视图的底边距（此设置将影响到scrollView的contentSize）
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.detailView.mas_bottom);
    }];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    self.mainScrollView.contentSize = CGSizeMake(0, 6 * Main_Screen_Height);
//    NSLog(@"%f %f", self.mainScrollView.contentSize.height, self.mainScrollView.frame.size.height);
  
    
}

- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"船舶详情" attributes:dic];
    
    return title;
    
}

- (UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc]init];
        _mainScrollView.backgroundColor = [UIColor whiteColor];
    }
    return _mainScrollView;
}

- (ZLShipBaseDetailView *)detailView{
    if (!_detailView) {
        _detailView = [[ZLShipBaseDetailView alloc]init];
        
    }
    return _detailView;
}




@end
