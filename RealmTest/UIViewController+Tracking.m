//
//  UIViewController+Tracking.m
//  RealmTest
//
//  Created by apple on 16/11/2.
//  Copyright © 2016年 Liancheng. All rights reserved.
//



#import "UIViewController+Tracking.h"
#import <objc/runtime.h>

@implementation UIViewController (Tracking)

//调用时间比较靠前，适合在这个地方里面做方法交换
+ (void)load {
    
    //保证在程序中只执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //获得viewcontroller的生命周期方法的selector
        SEL originalSelector = @selector(a);
        //自己实现的将要被交换的方法的selector
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        //2个方法的method
        Method originalMethod = class_getInstanceMethod([self class], originalSelector);
        Method swizzledMethod = class_getInstanceMethod([self class], swizzledSelector);
        //首先动态添加方法、实现是被交换的方法，返回值表示添加成功还是失败
        BOOL isAddSuccess = class_addMethod([self class], originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (isAddSuccess) {
            //如果成功说明类中不存在originalMethod这个方法的实现
            //将被交换方法的实现替换到这个并不存在的实现
            class_replaceMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        }else{
            //否则，交换两个方法的实现
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)xxx_viewWillAppear:(BOOL)animated {
    [self xxx_viewWillAppear:animated];
    NSLog(@"swizzle");
}

@end
