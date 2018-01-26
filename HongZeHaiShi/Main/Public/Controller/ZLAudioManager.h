//
//  ZLAudioManager.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/26.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 音频的录制及播放[支持本地和网络]
 */
@interface ZLAudioManager : NSObject


//音频是否正在播放
@property(nonatomic, assign) BOOL isPlaying;

//音频播放完成
@property(nonatomic, copy) void (^audioPlayFinish)(void);

+ (instancetype)shareManager;

#pragma mark - 录制相关
//开始录制
- (void)beginRecord;
//取消录制
- (void)cancelRecord;
//完成录制>>返回音频路径
- (NSString *)finishRecord;

#pragma mark - 播放相关
//播放
- (void)play;
//暂停
- (void)pause;
//播放某路径下的文件
- (void)playAudioByFileURL:(NSURL *)url;


@end
