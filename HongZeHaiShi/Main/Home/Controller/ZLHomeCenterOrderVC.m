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
@interface ZLHomeCenterOrderVC ()

@end

@implementation ZLHomeCenterOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *datas = [NSMutableArray array];
    SelwynFormItem *name = SelwynItemMake(@"船舶名称:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    name.placeholder = @"选填";
     [datas addObject:name];
    
    SelwynFormItem *taskTitle = SelwynItemMake(@"任务标题:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    taskTitle.placeholder = @"请输入标题";
    [datas addObject:taskTitle];
    
    SelwynFormItem *people = SelwynItemMake(@"接收人员:", @"", SelwynFormCellTypeSelect, UIKeyboardTypeDefault, NO, NO);
     [datas addObject:people];
    
    people.selectHandle = ^(SelwynFormItem *item) {
        
        NSLog(@"点击了people");
        
    };
    
    SelwynFormItem *time = SelwynItemMake(@"下发时间:", @"", SelwynFormCellTypeSelect, UIKeyboardTypeDefault, NO, NO);
    [datas addObject:time];
    
    time.selectHandle = ^(SelwynFormItem *item) {
        
        NSLog(@"点击了time");
        
    };
    
    SelwynFormItem *xxx = SelwynItemMake(@"任务标题:", @"", SelwynFormCellTypeInputAndImage, UIKeyboardTypeDefault, YES, NO);
    xxx.placeholder = @"请输入标题";
    xxx.imageName = @"day_rivers_total";
    [datas addObject:xxx];
    
    SelwynFormItem *content = SelwynDetailItemMake(@"任务内容", @"", SelwynFormCellTypeTextViewInput);
    content.editable = YES;
    content.placeholder = @"请填写内容";
    [datas addObject:content];
    
    
  
    
    
    
    SelwynFormSectionItem *sectionItem = [[SelwynFormSectionItem alloc]init];
    sectionItem.cellItems = datas;
    
    [self.mutableArray addObject:sectionItem];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
