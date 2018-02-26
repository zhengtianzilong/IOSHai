//
//  ZLHomeLawVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeLawVC.h"
#import "ZLHomeLawTableViewCell.h"
#import "ZLHomeLawRequest.h"
#import "ZLLawModel.h"
#import "ZLHomeLawDetailVC.h"
@interface ZLHomeLawVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) UIImageView *headImageView;
//@property (nonatomic, strong) ZLTodayWorkModel *headModel;

@property (nonatomic, strong) NSMutableArray *sourceData;

@property (nonatomic, assign) NSInteger requestStart;

@end

@implementation ZLHomeLawVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.requestStart = 1;
     self.sourceData = [NSMutableArray array];
    [self listData];
    
    [self.view addSubview:self.mainTableView];
   
    
}

- (void)listData{
    ZLHomeLawRequest *lawRequest = [[ZLHomeLawRequest alloc]initWithId:@"" pageNo:_requestStart pageSize:10];
    
    [lawRequest startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        ZLLawModel *lawModel = [[ZLLawModel alloc]initWithDictionary:request.responseJSONObject error:nil];
        if ([lawModel.result isEqualToString:@"0"]) {
            if (_requestStart == 1) {
                [_sourceData removeAllObjects];

            }
            for (ZLLawListDetailModel *detailModel in lawModel.detail.notifyList) {

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
    CGFloat sectionHeaderHeight = 120;
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
        view = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 120)];
        self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 120)];
        self.headImageView.image = [UIImage imageNamed:@"home_law_pic"];
        [view addSubview:self.headImageView];
    }
    //    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 500)];
    return view;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 120;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZLHomeLawTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZLHomeLawTableViewCell" forIndexPath:indexPath];
    ZLLawListDetailModel *model = self.sourceData[indexPath.row];

    cell.titleLabel.text = model.SUBJECT;
    cell.timeLabel.text = model.SEND_TIME;
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZLHomeLawDetailVC *detailVC = [[ZLHomeLawDetailVC alloc]init];

    ZLLawListDetailModel *model = self.sourceData[indexPath.row];

//    detailVC.url = model.CONTENT;
    
    if (model.url != nil) {
        ZLLawUrlModel *urlModel = model.url.firstObject;
        detailVC.attachurl = urlModel.attachurl;
        
        
        NSArray *docArray = [model.ATTACHMENT_NAME componentsSeparatedByString:@"."];
        
        NSString *docName = docArray.firstObject;
        detailVC.attachName = docName;
    }
    detailVC.url = model.CONTENT;

    [self.navigationController pushViewController:detailVC animated:YES];
    
}


- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        [_mainTableView registerClass:[ZLHomeLawTableViewCell class] forCellReuseIdentifier:@"ZLHomeLawTableViewCell"];
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
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:@"法律法规" attributes:dic];
    
    return title;
    
}


@end
