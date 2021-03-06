//
//  ZLHomeCenterOrderVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/22.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeCenterOrderVC.h"
#import "SelwynFormItem.h"
#import "SelwynFormHandle.h"
#import "SelwynFormSectionItem.h"
#import "ZLHomeShipQueryVC.h"
#import <BRPickerView/BRPickerView.h>
@interface ZLHomeCenterOrderVC ()

@end

@implementation ZLHomeCenterOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *datas = [NSMutableArray array];
    
    __weak typeof(self) weakSelf = self;
    
    SelwynFormItem *name = SelwynItemMake(@"船舶名称:", @"", SelwynFormCellTypeSelect, UIKeyboardTypeDefault, NO, NO);
    name.placeholder = @"选填";
    [datas addObject:name];
    
    name.selectHandle = ^(SelwynFormItem *item) {
        ZLHomeShipQueryVC *vc = [[ZLHomeShipQueryVC alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
        vc.shipBlock = ^(NSString *name) {
            item.formDetail = name;
            [weakSelf.formTableView reloadData];
        };
        
        NSLog(@"点击了name");
        
    };
    
    
    SelwynFormItem *taskTitle = SelwynItemMake(@"任务标题:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    taskTitle.placeholder = @"请输入标题";
    [datas addObject:taskTitle];
    
    SelwynFormItem *people = SelwynItemMake(@"接收人员:", @"", SelwynFormCellTypeSelect, UIKeyboardTypeDefault, NO, NO);
     [datas addObject:people];
    
    people.selectHandle = ^(SelwynFormItem *item) {
        
        NSLog(@"点击了people");
        
    };
    
    SelwynFormItem *time = SelwynItemMake(@"下发时间:", @"", SelwynFormCellTypeSelect, UIKeyboardTypeDefault, NO, NO);
    
    time.imageName =  @"day_rivers_total";
    
    [datas addObject:time];
    
    time.selectHandle = ^(SelwynFormItem *item) {
        
        NSLog(@"点击了time");
        [BRDatePickerView showDatePickerWithTitle:@"请选择日期" dateType:(UIDatePickerModeDateAndTime) defaultSelValue:nil minDateStr:nil maxDateStr:nil isAutoSelect:NO resultBlock:^(NSString *selectValue) {
            item.formDetail = selectValue;
            [weakSelf.formTableView reloadData];
            NSLog(@"%@", selectValue);
            
        }];
    };
    
    
    SelwynFormItem *content = SelwynDetailItemMake(@"任务内容", @"", SelwynFormCellTypeTextViewInput);
    content.editable = YES;
    content.placeholder = @"请填写内容";
    [datas addObject:content];
    
    SelwynFormItem *attachment = SelwynItemMake(@"附件", @"", SelwynFormCellTypeAttachment, UIKeyboardTypeDefault, YES, NO);
//    attachment.defaultCellHeight = 200;
    [datas addObject:attachment];
    
    
    SelwynFormSectionItem *sectionItem = [[SelwynFormSectionItem alloc]init];
    sectionItem.cellItems = datas;
    
    SelwynFormSectionItem *sectionItem1 = [[SelwynFormSectionItem alloc]init];
    sectionItem1.footerHeight = 80;
    sectionItem1.footerColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    sectionItem1.footerTitle = @"提交任务";
    sectionItem1.footerTitleColor = [UIColor greenColor];
    
    
    [self.mutableArray addObject:sectionItem];
    [self.mutableArray addObject:sectionItem1];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
