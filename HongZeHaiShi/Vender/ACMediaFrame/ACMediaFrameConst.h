//
//  ACMediaFrameConst.h
//  ACMediaFrame
//

#import <UIKit/UIKit.h>
#import "UIView+ACMediaExt.h"
#import "UIViewController+ACMediaExt.h"
#import "UIImage+ACGif.h"
#import "UIImageView+ACMediaExt.h"
#import "NSString+ACMediaExt.h"

#define  ACMedia_ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define  ACMedia_ScreenHeight [UIScreen mainScreen].bounds.size.height
#define  ACMedia_ScreenBounds [UIScreen mainScreen].bounds
#define  ACMediaBackGroundColor [UIColor colorWithRed:0xf2/255.0 green:0xf4/255.0 blue:0xf9/255.0 alpha:1]

#define ACMediaRatio ACMedia_ScreenWidth/375.0

/** cell上删除按钮的宽 */
#define ACMediaDeleteButtonWidth ACMediaRatio * 20

//日志输出
#ifdef DEBUG
#define ACLog(...) NSLog(__VA_ARGS__)
#else
#define ACLog(...)
#endif
