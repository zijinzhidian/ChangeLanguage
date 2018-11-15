//
//  YWConfig.m
//  ChangeLanguage
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 hzbojin. All rights reserved.
//

#import "YWConfig.h"

static NSString *const kUserLanguage = @"userLanguage";

@implementation YWConfig

/**
 设置当前用户语言
 */
+ (void)setUserLanguage:(NSString *)userLanguage {
    //跟随手机系用
    if (!userLanguage.length) {
        [self resetSystemLanguage];
        return;
    }
    //用户自定义
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:userLanguage forKey:kUserLanguage];
    [defaults setValue:@[userLanguage] forKey:@"AppleLanguages"];
    [defaults synchronize];
}

/**
 获取当前用户语言
 */
+ (NSString *)userLanguage {
    return [[NSUserDefaults standardUserDefaults] valueForKey:kUserLanguage];
}

/**
 重置语言为随系统切换
 */
+ (void)resetSystemLanguage {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:kUserLanguage];
    [defaults setValue:nil forKey:@"AppleLanguages"];
    [defaults synchronize];
}

@end


