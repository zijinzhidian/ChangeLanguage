//
//  NSBundle+Common.m
//  ChangeLanguage
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 hzbojin. All rights reserved.
//

#import "NSBundle+Common.h"
#import "YWConfig.h"
#import <objc/runtime.h>

@implementation NSBundle (Common)

/**
 当前用户语言
 */
+ (NSString *)currentLanguage {
    //若NSUserDefaults有保存的语言则使用本地保存的;若没有保存的则使用iOS系统的语言
    return [YWConfig userLanguage] ? : [[NSLocale preferredLanguages] firstObject];
}


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //动态继承、交换，方法类似KVO，通过修改[NSBundle mainBundle]对象的isa指针，使其指向它的子类DABundle，这样便可以调用子类的方法；其实这里也可以使用method_swizzling来交换mainBundle的实现，来动态判断，可以同样实现。
        object_setClass([NSBundle mainBundle], [YWBundle class]);
    });
}

@end


@implementation YWBundle

//重写获取本地化文字方法
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    if ([YWBundle mainBundle_language]) {
        return [[YWBundle mainBundle_language] localizedStringForKey:key value:value table:tableName];
    } else {
        return [super localizedStringForKey:key value:value table:tableName];
    }
}

//获取新的语言路径Bundle
+ (NSBundle *)mainBundle_language {
    if ([NSBundle currentLanguage].length) {
        //获取当前语言对应的lproj文件夹的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSBundle currentLanguage] ofType:@"lproj"];
        //若路径存在则返回一个新的语言路径bundle;若不存在则返回nil,比如iOS系统切换到"韩语",但是app并没有添加"韩语",此时path就不存在,返回nil
        if (path.length) {
            return [NSBundle bundleWithPath:path];
        }
    }
    return nil;
}

@end
