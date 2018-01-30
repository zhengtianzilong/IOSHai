//
//  ZLHomeEnforcementLawVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/30.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeEnforcementLawVC.h"
#import "SelwynFormItem.h"
#import "SelwynFormHandle.h"
#import "SelwynFormSectionItem.h"
#import "ZLHomeShipQueryVC.h"
#import <BRPickerView/BRPickerView.h>
@interface ZLHomeEnforcementLawVC ()

@end

@implementation ZLHomeEnforcementLawVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *datas = [NSMutableArray array];
    
//    __weak typeof(self) weakSelf = self;
    
    SelwynFormItem *name = SelwynItemMake(@"船舶名称:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    name.placeholder = @"请输入标题";
    [datas addObject:name];
    
    SelwynFormItem *taskTitle = SelwynItemMake(@"任务内容:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    taskTitle.placeholder = @"请输入标题";
    [datas addObject:taskTitle];
    
    SelwynFormItem *riverArea = SelwynItemMake(@"任务类型:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    riverArea.placeholder = @"选填";
    [datas addObject:riverArea];
    
    SelwynFormItem *phone = SelwynItemMake(@"发起人:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    phone.placeholder = @"选填";
    [datas addObject:phone];
    
    SelwynFormItem *department = SelwynItemMake(@"发起部门:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    department.placeholder = @"选填";
    [datas addObject:department];
    
    SelwynFormItem *receivePeople = SelwynItemMake(@"接收人:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    receivePeople.placeholder = @"选填";
    [datas addObject:receivePeople];
    
    SelwynFormItem *receiveDepartment = SelwynItemMake(@"接收部门:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    receiveDepartment.placeholder = @"选填";
    [datas addObject:receiveDepartment];
    
    SelwynFormItem *staus = SelwynItemMake(@"状态:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    staus.placeholder = @"选填";
    [datas addObject:staus];
    
    
    SelwynFormItem *downTime = SelwynItemMake(@"下发时间:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, YES, NO);
    downTime.placeholder = @"选填";
    [datas addObject:downTime];
    
 
    
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
