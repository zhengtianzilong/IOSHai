//
//  Macros.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/11.
//  Copyright © 2018年 xgzl. All rights reserved.
//


//中文字体iOS8
#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]
#define Font(x) [UIFont systemFontOfSize:x]
//中文字体粗体
#define CHINESE_FONT_NAMEBold  @"Helvetica-Bold"
#define CHINESE_SYSTEMBold(x) [UIFont fontWithName:CHINESE_FONT_NAMEBold size:x]

#define kScreenWidthRatio  (Main_Screen_Width / 375.0)
#define kScreenHeightRatio (Main_Screen_Height/667.0)

// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width
// MainScreen bounds
#define Main_Screen_Bounds [[UIScreen mainScreen] bounds]
//导航栏高度
#define TopBarHeight (Main_Screen_Height==812.0? 88:64)
// 底部TabBar高度
#define BottomBarHeight (Main_Screen_Height==812.0? 83:48)

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

#define HEXCOLORAndAlpha(hex,alphaVelue) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:alphaVelue]


#define kURL_Reachability__Address @"www.baidu.com"

#ifdef DEBUG
#define ZLLog(...) NSLog(__VA_ARGS__)
#else
#define ZLLog(...)
#endif
