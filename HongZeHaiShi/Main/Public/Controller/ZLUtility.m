//
//  ZLUtility.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/26.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLUtility.h"
#import <Photos/Photos.h>
@implementation ZLUtility

+ (instancetype)instance{
    static ZLUtility *utility = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        utility = [[self alloc]init];
    });
    return utility;
    
}

#pragma mark - 时间
//获取当前时间的时间戳(秒)
+ (long long)getNowTimestampSec{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a = [date timeIntervalSince1970];
    
    NSInteger Timestamp = a;
    
    return (int)Timestamp;
    
}
//获取当前时间的时间戳(毫秒)
+ (long long)getNowTimestampMesc{
    NSDate *date = [NSDate date];
    long long timeInterval = [date timeIntervalSince1970] * 1000;
    return timeInterval;
}
//获取当前时间的时间戳字符串(秒)
+ (NSString *)getNowTimestampString{
    
    NSString *timeString = [self getDateByTimestamp:[self getNowTimestampSec] type:17];
     return timeString;
}
// 将秒数转换成时分秒
+ (NSString *)getHMSFormatBySeconds:(int)seconds{
    NSString *hour = [NSString stringWithFormat:@"%02d",seconds/3600];
    NSString *minute = [NSString stringWithFormat:@"%02d",(seconds%3600)/60];
    NSString *second = [NSString stringWithFormat:@"%02d",seconds%60];
    NSString *hmsFormat = [NSString stringWithFormat:@"%@:%@:%@",hour,minute,second];
    return hmsFormat;
}
#pragma mark - 时间戳与日期的相互转换
//时间戳转日期
+ (NSString *)getDateByTimestamp:(long long)timestamp type:(NSInteger)timeType
{
    if (timestamp == 0) {
        return nil;
    }
    NSTimeInterval time = timestamp;
    NSDate *detaildate =[NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    //分类处理
    switch (timeType)
    {
        case 0: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        }
        case 1:{
            [dateFormatter setDateFormat:@"yyyy-MM-dd (EEE)"];
            break;
        }
        case 2: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
        }
        case 3: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm EEE"];
            break;
        }
        case 4: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        }
        case 5: {
            [dateFormatter setDateFormat:@"yyyy/MM/dd"];
            break;
        }
        case 6: {
            [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
            break;
        }
        case 7: {
            [dateFormatter setDateFormat:@"yyyy年MM月"];
            break;
        }
        case 8: {
            [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
            break;
        }
        case 9:{
            [dateFormatter setDateFormat:@"yyyy年MM月dd日 EEE"];
            break;
        }
        case 10: {
            [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
            break;
        }
        case 11: {
            [dateFormatter setDateFormat:@"yyyy/MM/dd"];
            break;
        }
        case 12: {
            [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
            break;
        }
        case 13: {
            [dateFormatter setDateFormat:@"yyyy.MM.dd"];
            break;
        }
        case 14: {
            [dateFormatter setDateFormat:@"MM-dd HH:mm"];
            break;
        }
        case 15: {
            [dateFormatter setDateFormat:@"dd M EEE"];
            break;
        }
        case 16: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss EEE"];
            break;
        }
        case 17: {
            [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
            break;
        }
        default:
            break;
    }
    NSString *timeString = [dateFormatter stringFromDate:detaildate];
    return timeString;
}

// 日期转时间戳
+ (NSInteger)getTimestampByDate:(NSString *)dateString type:(NSInteger)timeType;
{
    if (!dateString) {
        return 0;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    switch (timeType)
    {
        case 0: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        }
        case 1:{
            [dateFormatter setDateFormat:@"yyyy-MM-dd (EEE)"];
            break;
        }
        case 2: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
        }
        case 3: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm EEE"];
            break;
        }
        case 4: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        }
        case 5: {
            [dateFormatter setDateFormat:@"yyyy/MM/dd"];
            break;
        }
        case 6: {
            [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
            break;
        }
        case 7: {
            [dateFormatter setDateFormat:@"yyyy年MM月"];
            break;
        }
        case 8: {
            [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
            break;
        }
        case 9:{
            [dateFormatter setDateFormat:@"yyyy年MM月dd日 EEE"];
            break;
        }
        case 10: {
            [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
            break;
        }
        case 11: {
            [dateFormatter setDateFormat:@"yyyy/MM/dd"];
            break;
        }
        case 12: {
            [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
            break;
        }
        case 13: {
            [dateFormatter setDateFormat:@"yyyy.MM.dd"];
            break;
        }
        case 14: {
            [dateFormatter setDateFormat:@"MM-dd HH:mm"];
            break;
        }
        case 15: {
            [dateFormatter setDateFormat:@"dd M EEE"];
            break;
        }
        case 16: {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss EEE"];
            break;
        }
        case 17: {
            [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
            break;
        }
        default:
            break;
    }
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setTimeZone:timeZone];
    NSDate *date = [dateFormatter dateFromString:dateString];
    NSTimeInterval a = [date timeIntervalSince1970];
    NSInteger Timestamp = a;
    return Timestamp;
}

#pragma mark - 文件路径

// 获得文档路径
+ (NSString *)getDocDir{
    
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentPath = [searchPaths objectAtIndex:0];
    
    return documentPath;
    
    
}

// 获取视频文件夹路径
+ (NSString *)getVideoDir{
    NSString *docDir = [self getDocDir];
    
    NSString *videoDir = [docDir stringByAppendingPathComponent:@"Video"];
    
    if (![[NSFileManager defaultManager]fileExistsAtPath:videoDir]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:videoDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return videoDir;
}
// 获取音频文件夹路径
+ (NSString *)getAudioDir{
    NSString *docDir = [self getDocDir];
    NSString *audioDir = [docDir stringByAppendingPathComponent:@"Audio"];
    if (![[NSFileManager defaultManager]fileExistsAtPath:audioDir]) {
        
        [[NSFileManager defaultManager]createDirectoryAtPath:audioDir withIntermediateDirectories:YES attributes:nil error:nil];
        
    }
    return audioDir;
}
// 获取音频文件路径
+ (NSString *)getAudioFilePath{
    
    NSString *audioDir = [self getAudioDir];
    
    NSString *filePath = [audioDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.caf",[self getNowTimestampString]]];
    
    return filePath;
    
    
}

// 图片临时路径(用于图像处理)
+ (NSString *)getTempPicDir{
    NSString *docDir = [self getDocDir];
    NSString *picDir = [docDir stringByAppendingPathComponent:@"TempPic"];
    
    if (![[NSFileManager defaultManager]fileExistsAtPath:picDir]) {
        [[NSFileManager defaultManager]createDirectoryAtPath:picDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return picDir;
}

#pragma mark - 权限
+ (BOOL)isAudioRecordPermit{
    __block BOOL isOK = YES;
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    
    if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
        
        [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted){
            if (granted) {
                isOK = YES;
            }else{
                isOK = NO;
            }
        }];
        
    }
    return isOK;
    
    
}
+ (BOOL)isPhotoLibraryPermit{
    __block BOOL isOK = YES;
    
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied) {
        isOK = NO;
    }
    return isOK;
}
+ (BOOL)isCameraPermit{
    __block BOOL isOK = YES;
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:(AVMediaTypeVideo)];

    if (status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted) {
        isOK = NO;
    }
    return isOK;
}

@end
