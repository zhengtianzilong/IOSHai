//
//  NSString+ZLSizeOfString.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/26.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "NSString+ZLSizeOfString.h"

@implementation NSString (ZLSizeOfString)
#pragma mark - 获取文本size
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize textSize = [self boundingRectWithSize:maxSize
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:dict
                                         context:nil].size;
    return textSize;
}
@end
