//
//  NSBundle+Common.h
//  ChangeLanguage
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 hzbojin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Common)

/**
 当前用户语言
 */
+ (NSString *)currentLanguage;

@end

@interface YWBundle : NSBundle

@end

NS_ASSUME_NONNULL_END

