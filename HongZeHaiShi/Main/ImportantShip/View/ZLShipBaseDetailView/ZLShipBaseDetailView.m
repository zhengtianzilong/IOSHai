//
//  ZLShipBaseDetailView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/18.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLShipBaseDetailView.h"
#import "XDMultTableView.h"
#import "ZLInfoRecordTableViewCell.h"
#import "YUFoldingTableView.h"
@interface ZLShipBaseDetailView()<XDMultTableViewDatasource,XDMultTableViewDelegate, YUFoldingTableViewDelegate>

@property (nonatomic, strong) UILabel *baseInfoLabel;
@property (nonatomic, strong) ZLShipBaseTopInfoView *topInfoView;
@property (nonatomic, strong) ZLShipBaseBottomView *bottomInfoView;
@property (nonatomic, strong) UIButton *cancelImaportantBtn;
@property (nonatomic, strong) UILabel *infoQueryLabel;

//@property (nonatomic, strong) XDMultTableView *mainTableView;
@property (nonatomic, strong) YUFoldingTableView *mainTableView;
// 现场执法
@property (nonatomic, strong) UIButton *startWorkBtn;


@end

@implementation ZLShipBaseDetailView

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self addSubview:self.baseInfoLabel];
    [self addSubview:self.topInfoView];
    [self addSubview:self.bottomInfoView];
    [self addSubview:self.cancelImaportantBtn];
    [self addSubview:self.infoQueryLabel];
     [self addSubview:self.mainTableView];
    [self addSubview:self.startWorkBtn];
    
    [self.baseInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(Main_Screen_Width);
        
    }];
    
    [self.topInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.baseInfoLabel.mas_bottom);
        //        make.height.mas_equalTo(20);
        make.width.mas_equalTo(Main_Screen_Width);
        //        make.width.mas_equalTo(100);
        
    }];
    
    [self.bottomInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.topInfoView.mas_bottom).offset(1);
        //        make.height.mas_equalTo(20);
        make.width.mas_equalTo(Main_Screen_Width);
        //                make.height.mas_equalTo(200);
    }];
    
    [self.cancelImaportantBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.bottomInfoView.mas_bottom).offset(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(Main_Screen_Width);
        //                make.height.mas_equalTo(200);
    }];
    
    [self.infoQueryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self.cancelImaportantBtn.mas_bottom).offset(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(Main_Screen_Width);
        
    }];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self.infoQueryLabel.mas_bottom).offset(0);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(Main_Screen_Width);
//        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [self.startWorkBtn mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.mainTableView.mas_bottom).offset(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(Main_Screen_Width);
        make.bottom.equalTo(self.mas_bottom);
        //                make.height.mas_equalTo(200);
    }];
    
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    


}

#pragma mark - datasource
- (NSInteger)mTableView:(XDMultTableView *)mTableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (XDMultTableViewCell *)mTableView:(XDMultTableView *)mTableView
              cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"ZLInfoRecordTableViewCell";
    ZLInfoRecordTableViewCell *cell = (ZLInfoRecordTableViewCell *)[mTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[ZLInfoRecordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    UIView *view = [[UIView alloc] initWithFrame:cell.bounds] ;
    view.layer.backgroundColor  = [UIColor whiteColor].CGColor;
    view.layer.masksToBounds    = YES;
    view.layer.borderWidth      = 0.3;
    view.layer.borderColor      = [HEXCOLOR(CVIEW_GRAY_COLOR) CGColor];

    cell.backgroundView = view;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(XDMultTableView *)mTableView{
    return 2;
}

-(NSString *)mTableView:(XDMultTableView *)mTableView titleForHeaderInSection:(NSInteger)section{
    return @"我是头部";
}

#pragma mark - delegate
- (CGFloat)mTableView:(XDMultTableView *)mTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (CGFloat)mTableView:(XDMultTableView *)mTableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}


- (void)mTableView:(XDMultTableView *)mTableView willOpenHeaderAtSection:(NSInteger)section{
    NSLog(@"即将展开 %f", mTableView.tableView.contentSize.height);
    
    [self.mainTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.infoQueryLabel.mas_bottom).offset(0);
        make.height.mas_equalTo(mTableView.tableView.frame.size.height + 80);
        make.width.mas_equalTo(Main_Screen_Width);
//        make.bottom.equalTo(self.mas_bottom);

    }];
    
    [self.startWorkBtn mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.mainTableView.mas_bottom).offset(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(Main_Screen_Width);
//        make.bottom.equalTo(self.mas_bottom);
        //                make.height.mas_equalTo(200);
    }];
    
//    [self updateConstraintsIfNeeded];
//    [self layoutIfNeeded];
    
    
//    CGRect frame = mTableView.frame;
//    frame.size.height = mTableView.tableView.frame.size.height;
//
//    mTableView.frame = frame;
    
}


- (void)mTableView:(XDMultTableView *)mTableView willCloseHeaderAtSection:(NSInteger)section{
    NSLog(@"即将关闭 %f", mTableView.tableView.contentSize.height);
    
    [self.mainTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.infoQueryLabel.mas_bottom).offset(0);
        make.height.mas_equalTo(mTableView.tableView.frame.size.height);
        make.width.mas_equalTo(Main_Screen_Width);
//        make.bottom.equalTo(self.mas_bottom);
        
    }];
    [self.startWorkBtn mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.mainTableView.mas_bottom).offset(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(Main_Screen_Width);

    }];
}

- (void)mTableView:(XDMultTableView *)mTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击cell");
}






// 返回箭头的位置
- (YUFoldingSectionHeaderArrowPosition)perferedArrowPositionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    return YUFoldingSectionHeaderArrowPositionLeft;
}
- (NSInteger )numberOfSectionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    return 2;
}
- (NSInteger )yuFoldingTableView:(YUFoldingTableView *)yuTableView numberOfRowsInSection:(NSInteger )section
{
    return 3;
}
- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForHeaderInSection:(NSInteger )section
{
    return 50;
}
- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSString *)yuFoldingTableView:(YUFoldingTableView *)yuTableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Title %ld",section];
}
- (UITableViewCell *)yuFoldingTableView:(YUFoldingTableView *)yuTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [yuTableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld",indexPath.row];
    return cell;
}

- (void )yuFoldingTableView:(YUFoldingTableView *)yuTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [yuTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)yuFoldingTableView:(YUFoldingTableView *)yuTableView tapHeader:(CGFloat)height{
    
    [self.mainTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.infoQueryLabel.mas_bottom).offset(0);
        make.height.mas_equalTo(height);
        make.width.mas_equalTo(Main_Screen_Width);
        //        make.bottom.equalTo(self.mas_bottom);
        
    }];
    
}


#pragma mark - YUFoldingTableViewDelegate / optional （可选择实现的）
- (NSString *)yuFoldingTableView:(YUFoldingTableView *)yuTableView descriptionForHeaderInSection:(NSInteger )section
{
    return @"detailText";
}







- (UILabel *)baseInfoLabel{
    if (!_baseInfoLabel) {
        _baseInfoLabel = [[UILabel alloc]init];
        _baseInfoLabel.font = CHINESE_SYSTEM(15);
        _baseInfoLabel.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
        _baseInfoLabel.text = @"基本信息";
    }
    return _baseInfoLabel;
}

- (ZLShipBaseTopInfoView *)topInfoView{
    if (!_topInfoView) {
        _topInfoView = [[ZLShipBaseTopInfoView alloc]init];
    }
    return _topInfoView;
}

- (ZLShipBaseBottomView *)bottomInfoView{
    if (!_bottomInfoView) {
        _bottomInfoView = [[ZLShipBaseBottomView alloc]init];
    }
    return _bottomInfoView;
}

- (UIButton *)cancelImaportantBtn{
    if (!_cancelImaportantBtn) {
        _cancelImaportantBtn = [[UIButton alloc]init];
        [_cancelImaportantBtn setTitle:@"取消重点" forState:(UIControlStateNormal)];
        [_cancelImaportantBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_cancelImaportantBtn setBackgroundColor:HEXCOLOR(CNAVGATIONBAR_COLOR)];
    }
    return _cancelImaportantBtn;
}

- (UILabel *)infoQueryLabel{
    if (!_infoQueryLabel) {
        _infoQueryLabel = [[UILabel alloc]init];
        _infoQueryLabel.font = CHINESE_SYSTEM(15);
        _infoQueryLabel.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
        _infoQueryLabel.text = @"信息查询";
    }
    return _infoQueryLabel;
}

//- (XDMultTableView *)mainTableView{
//    if (!_mainTableView) {
//        _mainTableView = [[XDMultTableView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 300)];
////        _mainTableView.openSectionArray = [NSArray arrayWithObjects:@1,@2, nil];
//        _mainTableView.delegate = self;
//        _mainTableView.datasource = self;
////        _mainTableView.autoAdjustOpenAndClose = YES;
//        _mainTableView.backgroundColor = [UIColor whiteColor];
//        _mainTableView.tableView.scrollEnabled = NO;
//        _mainTableView.autoAdjustOpenAndClose = NO;
//    }
//    return _mainTableView;
//}

- (YUFoldingTableView *)mainTableView{
        if (!_mainTableView) {
            _mainTableView = [[YUFoldingTableView alloc] initWithFrame:CGRectZero];
    //        _mainTableView.openSectionArray = [NSArray arrayWithObjects:@1,@2, nil];
            _mainTableView.foldingDelegate = self;
//            _mainTableView.datasource = self;
    //        _mainTableView.autoAdjustOpenAndClose = YES;
            _mainTableView.backgroundColor = [UIColor whiteColor];
            _mainTableView.scrollEnabled = NO;
//            _mainTableView.autoAdjustOpenAndClose = NO;
        }
        return _mainTableView;
}


- (UIButton *)startWorkBtn{
    if (!_startWorkBtn) {
        _startWorkBtn = [[UIButton alloc]init];
        [_startWorkBtn setTitle:@"现场执法" forState:(UIControlStateNormal)];
        [_startWorkBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_startWorkBtn setBackgroundColor:HEXCOLOR(CNAVGATIONBAR_COLOR)];
    }
    return _startWorkBtn;
}

@end
