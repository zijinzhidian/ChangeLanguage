//
//  YWConfig.h
//  ChangeLanguage
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 hzbojin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YWConfig : NSObject


/**
 用户自定义使用的语言,当传nil时,等同于随系统语言切换
 */
@property(class, nonatomic, strong, nullable)NSString *userLanguage;


/**
 重置系统语言
 */
+ (void)resetSystemLanguage;

@end

NS_ASSUME_NONNULL_END
