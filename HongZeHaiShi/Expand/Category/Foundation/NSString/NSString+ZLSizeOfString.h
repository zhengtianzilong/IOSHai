//
//  NSString+ZLSizeOfString.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/26.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZLSizeOfString)
/**
 *  计算文本占用的宽高
 *
 *  @param font    显示的字体
 *  @param maxSize 最大的显示范围
 *
 *  @return 占用的宽高
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
@end
