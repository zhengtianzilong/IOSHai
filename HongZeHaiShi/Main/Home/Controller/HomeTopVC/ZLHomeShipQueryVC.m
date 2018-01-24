//
//  ZLHomeShipQueryVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/24.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipQueryVC.h"
#import "SelwynFormItem.h"
#import "SelwynFormHandle.h"
#import "SelwynFormSectionItem.h"
#import "ZLImportantTodayTableViewCell.h"
@interface ZLHomeShipQueryVC ()<UITableViewDelegate, UITableViewDataSource>
//@property (nonatomic, strong) UIButton *queryButton;

@property (nonatomic, strong) UITableView *mainTableView;

@end

@implementation ZLHomeShipQueryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *datas = [NSMutableArray array];
    
//    SelwynFormItem *shipCount = SelwynItemMake(@"船号:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
//    shipCount.placeholder = @"请输入船舶号";
//    [datas addObject:shipCount];
//
//    SelwynFormItem *shipPeopleName = SelwynItemMake(@"船员姓名:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
//    shipPeopleName.placeholder = @"请输入船员姓名";
//    [datas addObject:shipPeopleName];
//
//    SelwynFormItem *shipPeoplePhone = SelwynItemMake(@"电话号码:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
//    shipPeoplePhone.placeholder = @"请输入电话号码";
//    [datas addObject:shipPeoplePhone];
//
//    SelwynFormItem *shipIdentify = SelwynItemMake(@"船舶识别号:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
//    shipIdentify.placeholder = @"请输入船舶识别号";
//    [datas addObject:shipIdentify];
//
//    SelwynFormSectionItem *sectionItem = [[SelwynFormSectionItem alloc]init];
//    sectionItem.cellItems = datas;
//
//    sectionItem.footerHeight = 100;
//    sectionItem.footerColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
//    sectionItem.footerTitleColor = [UIColor greenColor];
//    sectionItem.footerTitle = @"section footer";
//
//    [self.mutableArray addObject:sectionItem];
//
//    [self.view addSubview:self.queryButton];
    
   [self.view addSubview:self.mainTableView];
    
//    [self.queryButton mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.centerX.equalTo(self.view);
//        make.top.equalTo(self.formTableView.mas_bottom).offset(10);
//        make.height.mas_equalTo(40);
//        make.left.equalTo(self.view).offset(10);
//        make.right.equalTo(self.view.mas_right).offset(-10);
//    }];

    
    
}
//
//- (void)updateFormInputWithText:(NSString *)text indexPath:(NSIndexPath *)indexPath{
//
//    [super updateFormInputWithText:text indexPath:indexPath];
//
//     NSLog(@"%f",self.formTableView.contentSize.height);
//
//    [self.mainTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.formTableView.contentSize.height);
//        make.bottom.equalTo(self.view.mas_bottom).offset(0);
//        make.left.equalTo(self.view);
//        make.right.equalTo(self.view.mas_right);
//    }];
//
//}
//
//- (void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
//    CGRect rect=[self.queryButton convertRect: self.queryButton.bounds toView:window];
//
////    self.formTableView.frame = CGRectMake(0, 0, self.formTableView.contentSize.width, self.formTableView.contentSize.height);
//
////    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 232, Main_Screen_Width, 200)];
//
////    view.backgroundColor = [UIColor redColor];
////    [self.view addSubview:view];
//
//    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.formTableView.contentSize.height);
//        make.bottom.equalTo(self.view.mas_bottom).offset(0);
//        make.left.equalTo(self.view);
//        make.right.equalTo(self.view.mas_right);
//    }];
//
//}
#pragma mark -- 列表的代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = nil;
    static NSString *CellIdentifier = @"Cell1";
    
    cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:CellIdentifier];
    }
    
//    cell.textLabel.text = [[_arraySection objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", [_arrayIndex objectAtIndex:indexPath.section]]];
    return cell;
    
//
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
//    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (UIButton *)queryButton{
//    if (!_queryButton) {
//        _queryButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, Main_Screen_Width, 50)];
//                _queryButton.backgroundColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
//
//        [_queryButton setTitle:@"查询" forState:(UIControlStateNormal)];
//
//    }
//    return _queryButton;
//
//}

- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        
//        [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}


@end
