//
//  ZLHomeShipQueryTableViewCell.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/25.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLHomeShipQueryTableViewCell : UITableViewCell
// 标题
@property (nonatomic, strong) UILabel *titleLabel;
// 红色感叹号
@property (nonatomic, strong) UIImageView *tipImageV;

@property (nonatomic, strong) UILabel *shipLable;
// 船舶识别号
@property (nonatomic, strong) UILabel *ship;
// 船员姓名
@property (nonatomic, strong) UILabel *peopleNameLabel;
@property (nonatomic, strong) UILabel *peopleName;
// 电话
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *phone;

@end
