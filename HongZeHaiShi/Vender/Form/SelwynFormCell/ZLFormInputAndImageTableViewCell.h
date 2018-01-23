//
//  ZLFormInputAndImageTableViewCell.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/22.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "SelwynFormBaseTableViewCell.h"
@class SelwynFormItem;

typedef void(^FormInputAndImageCompletion)(NSString *text);

@interface ZLFormInputAndImageTableViewCell : SelwynFormBaseTableViewCell

/* cell Item */
@property (nonatomic, strong) SelwynFormItem *formItem;

/* textview content block */
@property (nonatomic, copy) FormInputAndImageCompletion formInputAndImageCompletion;

/* return height of cell */
+ (CGFloat)cellHeightWithItem:(SelwynFormItem *)item;

@end

@interface UITableView (ZLFormInputAndImageTableViewCell)

/* Designated initializer */
- (ZLFormInputAndImageTableViewCell *)formInputAndImageCellWithId:(NSString *)cellId;

@end
