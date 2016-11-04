//
//  UIViewController+Tracking.m
//  RealmTest
//
//  Created by apple on 16/11/2.
//  Copyright © 2016年 Liancheng. All rights reserved.
//



#import "UIViewController+Tracking.h"

typedef struct objc_method *Method;
typedef struct objc_ivar *Ivar;
typedef struct objc_category *Category;
typedef struct objc_property *objc_property_t;
@implementation UIViewController (Tracking)

- (void)viewDidLoad {
    
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        
//        Method originalSelector = class_getInstanceMethod(class, originalSelector);
    });
}
@end
