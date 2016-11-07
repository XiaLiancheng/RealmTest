//
//  Target.m
//  RealmTest
//
//  Created by apple on 16/11/3.
//  Copyright © 2016年 Liancheng. All rights reserved.
//

#import "Target.h"
#import <objc/runtime.h>

@implementation Target

//- (void)revolveAdd {
//
//}
void runAddMethod(id self, SEL _cmd, NSString *string){
    NSLog(@"add C IMP--------%@ ", string);
}

- (void)login:(NSString *)name {
    
}

//在target对象内部重写拦截调用的方法，动态添加OC语言方法
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    //给本类动态添加一个方法
    NSString * str = NSStringFromSelector(sel);
    if ([NSStringFromSelector(sel) isEqualToString:@"resolveAdd:"]) {
    
        unsigned int count;
        //获取方法列表
        SEL sel_ = nil;
        Method *methodList = class_copyMethodList([self class], &count);
        for (unsigned int i = 0; i<count; i++) {
            Method method = methodList[i];
             sel_ = method_getName(method);
            NSLog(@"method----="">%@", NSStringFromSelector(method_getName(method)));
        }
        class_addMethod(self, sel, [self instanceMethodForSelector:sel_], "v@:*");
    }
    return YES;
}

//在target对象内部重写拦截调用的方法，动态添加C语言方法
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    //给本类动态添加一个方法
//    if ([NSStringFromSelector(sel) isEqualToString:@"resolveAdd:"]) {
//        class_addMethod(self, sel, (IMP)runAddMethod, "v@:*");
//    }
//    return YES;
//}

@end
