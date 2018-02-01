//
//  ZLMyTaskDetailVC.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/1.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMyTaskDetailVC.h"
#import "SelwynFormItem.h"
#import "SelwynFormHandle.h"
#import "SelwynFormSectionItem.h"
#import "ZLHomeShipQueryVC.h"
#import <BRPickerView/BRPickerView.h>
@interface ZLMyTaskDetailVC ()

@end

@implementation ZLMyTaskDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *datas = [NSMutableArray array];
    
    //    __weak typeof(self) weakSelf = self;
    
    SelwynFormItem *name = SelwynItemMake(@"船舶名称:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, NO, NO);
    name.placeholder = @"请输入标题";
    [datas addObject:name];
    
    SelwynFormItem *taskTitle = SelwynItemMake(@"任务内容:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, NO, NO);
    taskTitle.placeholder = @"请输入标题";
    [datas addObject:taskTitle];
    
    SelwynFormItem *riverArea = SelwynItemMake(@"任务类型:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, NO, NO);
    riverArea.placeholder = @"选填";
    [datas addObject:riverArea];
    
    SelwynFormItem *phone = SelwynItemMake(@"发起人:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, NO, NO);
    phone.placeholder = @"选填";
    [datas addObject:phone];
    
    SelwynFormItem *department = SelwynItemMake(@"发起部门:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, NO, NO);
//    department.placeholder = @"选填";
    [datas addObject:department];
    
    SelwynFormItem *receivePeople = SelwynItemMake(@"接收人:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, NO, NO);
    receivePeople.placeholder = @"选填";
    [datas addObject:receivePeople];
    
    SelwynFormItem *receiveDepartment = SelwynItemMake(@"接收部门:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, NO, NO);
    receiveDepartment.placeholder = @"选填";
    [datas addObject:receiveDepartment];
    
    SelwynFormItem *staus = SelwynItemMake(@"状态:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, NO, NO);
    staus.placeholder = @"选填";
    [datas addObject:staus];
    
    
    SelwynFormItem *downTime = SelwynItemMake(@"下发时间:", @"", SelwynFormCellTypeInput, UIKeyboardTypeDefault, NO, NO);
    downTime.placeholder = @"选填";
    [datas addObject:downTime];
    

    SelwynFormItem *content = SelwynDetailItemMake(@"任务内容", @"", SelwynFormCellTypeTextViewInput);
    content.editable = NO;
    content.placeholder = @"请填写内容";
    [datas addObject:content];
    
    SelwynFormItem *attachment = SelwynItemMake(@"附件", @"", SelwynFormCellTypeAttachment, UIKeyboardTypeDefault, NO, NO);
    //    attachment.defaultCellHeight = 200;
    [datas addObject:attachment];
    
    
    SelwynFormSectionItem *sectionItem = [[SelwynFormSectionItem alloc]init];
    sectionItem.cellItems = datas;

    [self.mutableArray addObject:sectionItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
    
}


@end
