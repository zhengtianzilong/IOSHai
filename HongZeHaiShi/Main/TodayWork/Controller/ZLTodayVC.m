//
//  ZLTodayVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/12.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLTodayVC.h"
#import "ZLTodayWorkTableViewCell.h"
#import "ZLTodayWorkRequest.h"
#import "ZLTodayTopContainView.h"
#import "ZLTodayWorkModel.h"
#import "ZLTodayListRequest.h"
#import "ZLZbbModel.h"
#import "ZLTodayDetailVC.h"
@interface ZLTodayVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) ZLTodayTopContainView *topContainView;
@property (nonatomic, strong) ZLTodayWorkModel *headModel;

@property (nonatomic, strong) NSMutableArray *sourceData;

@property (nonatomic, assign) NSInteger requestStart;

@end

@implementation ZLTodayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.requestStart = 1;
    
    [self initData];
    [self listData];
    [self.view addSubview:self.mainTableView];
    self.sourceData = [NSMutableArray array];
    
}

- (void)initData{
    
    ZLTodayWorkRequest *todayRequest = [[ZLTodayWorkRequest alloc]initWithId:@"" pageNo:1 pageSize:10];
    
    [todayRequest startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        _headModel = [[ZLTodayWorkModel alloc]initWithDictionary:request.responseObject error:nil];
        
        if ([_headModel.result isEqualToString:@"0"]) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.topContainView.todayWorkModel = _headModel;
                
            });
//            [self.mainTableView reloadData];
        }
        
        
        ZLLog(@"%@", request.responseString);
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

- (void)listData{
    ZLTodayListRequest *todayRequest = [[ZLTodayListRequest alloc]initWithId:@"" pageNo:_requestStart pageSize:10];
    
    [todayRequest startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        ZLZbbModel *zbbModel = [[ZLZbbModel alloc]initWithDictionary:request.responseJSONObject error:nil];
        

        
        if ([zbbModel.result isEqualToString:@"0"]) {
            
            if (_requestStart == 1) {
                
                [_sourceData removeAllObjects];
                
            }
            for (ZLZbbListDetailModel *detailModel in zbbModel.detail.zbbList) {
                
                [self.sourceData addObject:detailModel];
                
                
            }
            [self.mainTableView.mj_header endRefreshing];
            [self.mainTableView.mj_footer endRefreshing];
            [self.mainTableView reloadData];
        }
        
        
        
        
        ZLLog(@"%@", request.responseString);
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}




- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view.mas_right);
    }];
    
}


#pragma mark -- 列表的代理

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 430;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString *IDD = @"dddd";
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:IDD];
    if (!view) {
        view = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 430)];
        view.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
        self.topContainView = [[ZLTodayTopContainView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 430)];
        self.topContainView.todayWorkModel = _headModel;
        [view addSubview:self.topContainView];
    }
//    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 500)];
    return view;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 430;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZLTodayWorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLTodayWorkTableViewCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    ZLZbbListDetailModel *model = self.sourceData[indexPath.row];
    
    cell.titleLabel.text = model.TITLE;
    cell.timeLabel.text = model.CREATETIME;
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLTodayDetailVC *detailVC = [[ZLTodayDetailVC alloc]init];
    
    ZLZbbListDetailModel *model = self.sourceData[indexPath.row];
    
    detailVC.htmlTableString = model.CONTENT;
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
}


- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        [_mainTableView registerClass:[ZLTodayWorkTableViewCell class] forCellReuseIdentifier:@"ZLTodayWorkTableViewCell"];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           
            _requestStart = 1;
            [self listData];
            
        }];
        
        _mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            _requestStart += 1;
            [self listData];
            
        }];
    }
    return _mainTableView;
}



- (NSMutableAttributedString *)setTitle{
    
    NSDictionary *dic = @{NSFontAttributeName:CHINESE_SYSTEM(18),
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"今日值班" attributes:dic];
    
    return title;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
