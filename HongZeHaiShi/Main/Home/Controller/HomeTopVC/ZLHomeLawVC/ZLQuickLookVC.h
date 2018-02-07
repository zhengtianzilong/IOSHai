//
//  ZLQuickLookVC.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseCustomNavViewController.h"
#import <QuickLook/QuickLook.h>
@interface ZLQuickLookVC : ZLBaseCustomNavViewController<QLPreviewControllerDataSource,
QLPreviewControllerDelegate>
@property (nonatomic,strong) QLPreviewController *previewController;
@property (nonatomic,retain)NSURL *fileURL;
@end
