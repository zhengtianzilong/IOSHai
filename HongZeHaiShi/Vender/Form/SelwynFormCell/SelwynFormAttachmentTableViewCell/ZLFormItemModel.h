//
//  ZLFormItemModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/26.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZLFormItemModel : NSObject
/** 媒体名字 */
@property (nonatomic, copy) NSString *name;
/** 媒体上传格式 图片是NSData，视频主要是路径名，也有NSData */
@property (nonatomic, strong) id uploadType;

//兼容 MWPhotoBrowser 的附加属性

/** 媒体照片 */
@property (nonatomic, strong) UIImage *image;

/** url string image */
@property (nonatomic, copy) NSString *imageUrlString;

/** iOS8 之后的媒体属性 */
@property (nonatomic, strong) PHAsset *asset;

/** 是否属于可播放的视频类型 */
@property (nonatomic, assign) BOOL isVideo;
/** 是否属于可播放的音频类型 */
@property (nonatomic, assign) BOOL isAudio;
/** 视频的URL */
@property (nonatomic, strong) NSURL *mediaURL;


@end
