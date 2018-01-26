//
//  ZLRecordAudioVC.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/26.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>

// 音频录制

typedef void(^mp3FileNameBlock)(NSString *mp3FileName);

@interface ZLRecordAudioVC : UIViewController
//录制完成回调属性
@property (nonatomic, copy) mp3FileNameBlock mp3FileNameBlock;

@end
