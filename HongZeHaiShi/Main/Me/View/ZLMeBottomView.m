//
//  ZLMeBottomView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/16.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMeBottomView.h"
@interface ZLMeBottomView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *mainCollectionView;

// cell数据
@property (nonatomic, strong) NSMutableArray *itemArray;;

@end

@implementation ZLMeBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setUpViews];
        
        
    }
    return self;
    
}
- (void)setUpViews{
    
    [self addSubview:self.mainCollectionView];
    
}

- (void)updateConstraints{
    [super updateConstraints];
  

    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(self.mas_right);
        
    }];
}

#pragma mark -- collection的代理方法


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLMeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZLMeCollectionViewCell" forIndexPath:indexPath];

    cell.model = self.itemArray[indexPath.row];
    return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLMeCollectionModel *model = self.itemArray[indexPath.row];
    
    if (self.bottomViewBlock)
    {
        self.bottomViewBlock(model, indexPath);
    }
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return (CGSizeMake(Main_Screen_Width / 3, Main_Screen_Width / 3));
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (UICollectionView *)mainCollectionView{
    if (!_mainCollectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        _mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
        _mainCollectionView.dataSource = self;
        _mainCollectionView.delegate = self;
        _mainCollectionView.scrollEnabled = NO;
        [_mainCollectionView registerClass:[ZLMeCollectionViewCell class] forCellWithReuseIdentifier:@"ZLMeCollectionViewCell"];

    }
    return _mainCollectionView;
}


- (NSMutableArray *)itemArray{
    if (!_itemArray) {
        _itemArray = @[].mutableCopy;
        NSArray *titleArray = @[@"我的任务", @"统计分析", @"消息提醒", @"修改密码", @"注销登录", @"版本更新"];
        NSArray *imageArray = @[@"me_task", @"me_analyse", @"me_notifactions", @"me_changepassword", @"me_loginout", @"me_version"];
        for (NSInteger i = 0; i < titleArray.count; i++)
        {
            ZLMeCollectionModel *model = [ZLMeCollectionModel new];
            model.imageTitle = imageArray[i];
            model.title = titleArray[i];
            
            [self.itemArray addObject:model];
        }
    }
    
    return _itemArray;
    
}



@end
