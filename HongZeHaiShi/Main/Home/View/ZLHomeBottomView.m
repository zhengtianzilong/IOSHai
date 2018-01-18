//
//  ZLHomeBottomView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeBottomView.h"

@interface ZLHomeBottomView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *mainCollectionView;

// cell数据
@property (nonatomic, strong) NSMutableArray *itemArray;;

@end

@implementation ZLHomeBottomView

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
    
    ZLHomeBottomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZLHomeBottomCollectionViewCell" forIndexPath:indexPath];
    
    cell.model = self.itemArray[indexPath.row];
    return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLHomeBottomCollectionModel *model = self.itemArray[indexPath.row];
    
    if (self.bottomViewBlock)
    {
        self.bottomViewBlock(model, indexPath);
    }
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return (CGSizeMake(Main_Screen_Width / 3, Main_Screen_Width / 6 + 10));
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark 懒加载
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
        [_mainCollectionView registerClass:[ZLHomeBottomCollectionViewCell class] forCellWithReuseIdentifier:@"ZLHomeBottomCollectionViewCell"];
        
    }
    return _mainCollectionView;
}


- (NSMutableArray *)itemArray{
    if (!_itemArray) {
        _itemArray = @[].mutableCopy;
        NSArray *titleArray = @[@"中心指令", @"巡航任务", @"事故调查", @"船旗国安检", @"搜救任务", @"现场执法"];
        
        for (NSInteger i = 0; i < titleArray.count; i++)
        {
            ZLHomeBottomCollectionModel *model = [ZLHomeBottomCollectionModel new];
            model.imageTitle = @"day_rivers_total";
            model.title = titleArray[i];
            [self.itemArray addObject:model];
        }
    }
    
    return _itemArray;
}


@end
