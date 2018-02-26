//
//  ZLHomeShipInfoDetailVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipInfoDetailVC.h"
#import "ZLQueryNoticeListModel.h"
#import "ZLAnnounceQueryNoticeListRequest.h"
#import "ZLAnnouncementShipPeopleTableViewCell.h"
@interface ZLHomeShipInfoDetailVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSMutableArray *sourceData;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, assign) NSInteger requestStart;
@end

@implementation ZLHomeShipInfoDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - TopBarHeight - 60)];
    [self.view addSubview:_webView];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@", Law_Base_URL, self.url];
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [_webView loadRequest:request];
    self.sourceData = [NSMutableArray array];
    self.requestStart = 1;
    //    [self listData];
    [self.view addSubview:self.mainTableView];
    [self.mainTableView.mj_header beginRefreshing];
    
    
    
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(60);
    }];
    
    
}


- (void)listData{
    ZLAnnounceQueryNoticeListRequest *request = [[ZLAnnounceQueryNoticeListRequest alloc]initWithId:self.codeId isRead:@"1" pageNo:self.requestStart pageSize:10];
    
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        ZLQueryNoticeListModel *listModel = [[ZLQueryNoticeListModel alloc]initWithDictionary:request.responseJSONObject error:nil];
        if ([listModel.result isEqualToString:@"0"]) {
            if (_requestStart == 1) {
                [_sourceData removeAllObjects];
                
            }
            for (ZLHsNotifyListDetailModel *detailModel in listModel.detail.hsNotifyList) {
                
                [self.sourceData addObject:detailModel];
            }
            [self.mainTableView.mj_header endRefreshing];
            [self.mainTableView.mj_footer endRefreshing];
            [self.mainTableView reloadData];
        }
        ZLLog(@"%@", request.responseString);
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        [self.mainTableView.mj_header endRefreshing];
        [self.mainTableView.mj_footer endRefreshing];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZLAnnouncementShipPeopleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLAnnouncementShipPeopleTableViewCell" forIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    ZLHsNotifyListDetailModel *model = self.sourceData[indexPath.row];
    
    cell.detailModel = model;
    
    return cell;
    
}


- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        
        [_mainTableView registerClass:[ZLAnnouncementShipPeopleTableViewCell class] forCellReuseIdentifier:@"ZLAnnouncementShipPeopleTableViewCell"];
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
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"公告详情" attributes:dic];
    return title;
    
}

@end
