//
//  ZLLoginRequest.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/5.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLLoginRequest.h"

@interface ZLLoginRequest()

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userPassword;

@end

@implementation ZLLoginRequest

- (instancetype)initWithName:(NSString *)name password:(NSString *)password{
    
    if (self = [super init]) {
        
        self.userName = name;
        self.userPassword = password;
        
    }
    return self;
    
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}

- (id)requestArgument{
   return  @{
        @"cmd": @"signin",
        @"params": @{
            @"password": self.userPassword,
            @"userName": self.userName
            }
        };
}




@end
