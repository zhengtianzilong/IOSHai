//
//  ZLHomeCenterView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeCenterView.h"
@interface ZLHomeCenterView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *mainCollectionView;

// cell数据
@property (nonatomic, strong) NSMutableArray *itemArray;;

@end

@implementation ZLHomeCenterView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
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
    
    ZLHomeCenterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZLHomeCenterCollectionViewCell" forIndexPath:indexPath];
    
    cell.model = self.itemArray[indexPath.row];
    return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLHomeCenterCollectionModel *model = self.itemArray[indexPath.row];
    
    if (self.centerItemBlock)
    {
        self.centerItemBlock(model, indexPath);
    }
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return (CGSizeMake(Main_Screen_Width / 4, Main_Screen_Width / 4));
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
        [_mainCollectionView registerClass:[ZLHomeCenterCollectionViewCell class] forCellWithReuseIdentifier:@"ZLHomeCenterCollectionViewCell"];
        
    }
    return _mainCollectionView;
}


- (NSMutableArray *)itemArray{
    if (!_itemArray) {
        _itemArray = @[].mutableCopy;
        NSArray *titleArray = @[@"船舶查询", @"处罚记录", @"法律法规", @"报港查询", @"通讯录", @"通知公告", @"视频监控",@"船队报港"];
        NSArray *imageTitle = @[@"home_ship_query", @"home_punishment_record", @"home_law", @"home_portToQuery", @"home_contact", @"home_notification", @"home_video",@"home_ship_Report"];
        for (NSInteger i = 0; i < titleArray.count; i++)
        {
            ZLHomeCenterCollectionModel *model = [ZLHomeCenterCollectionModel new];
            model.imageTitle = imageTitle[i];
            model.title = titleArray[i];
            
            [self.itemArray addObject:model];
        }
    }
    
    return _itemArray;
    
}

@end
