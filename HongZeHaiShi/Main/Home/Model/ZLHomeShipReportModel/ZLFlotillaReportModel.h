//
//  ZLFlotillaReportModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/8.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ZLFlotillaReportModel

@end


@interface ZLFlotillaReportModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *reportHarborCode;
@property (nonatomic, strong) NSString<Optional> *shipHeadName;
@property (nonatomic, strong) NSString<Optional> *shipNationality;
@property (nonatomic, strong) NSString<Optional> *shipTonnage;
@property (nonatomic, strong) NSString<Optional> *shipDragNumber;
@property (nonatomic, strong) NSString<Optional> *shipKilowatt;
@property (nonatomic, strong) NSString<Optional> *shipCaptain;
@property (nonatomic, strong) NSString<Optional> *shipContactNumber;
@property (nonatomic, strong) NSString<Optional> *reportHarborTime;
@property (nonatomic, strong) NSString<Optional> *releaseTime;
@property (nonatomic, strong) NSString<Optional> *remark;
@end
