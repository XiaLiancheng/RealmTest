//
//  ViewController.m
//  RealmTest
//
//  Created by apple on 16/11/1.
//  Copyright © 2016年 Liancheng. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import <objc/runtime.h>
#import "Target.h"
#import "UIView+CircleAngle.h"
#import "UIViewController+Tracking.h"

@interface ViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self useRuntimeGetMessage];//runtime获取类信息
    
    [self setButtonCircel];//关联封装圆角控件
    
    [self a];//方法交换
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

//利用runtime解决调用未声明的方法  方法调用在运行时的过程
- (void)performUndefineSelector {
    Target *object = [[Target alloc]init];
    [object performSelector:@selector(resolveAdd:) withObject:@"test"];
}

//使用runtime获取类属性、方法、代理、成员变量
- (void)useRuntimeGetMessage{
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i < count; i ++) {
        const char * propertyName = property_getName(propertyList[i]);
        NSLog(@"property----="">%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i < count; i ++) {
        SEL methodSEL = method_getName(methodList[i]);
        NSLog(@"---%@",NSStringFromSelector(methodSEL));
    }
    
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i < count; i ++) {
        const char *ivar = ivar_getName(ivarList[i]);
        NSLog(@"%@",[NSString stringWithUTF8String:ivar]);
    }
    
    __unsafe_unretained Protocol **protocoList = class_copyProtocolList([self class], &count);
    for (unsigned int i = 0 ; i < count; i ++) {
        const char *protocol = protocol_getName(protocoList[i]);
        NSLog(@"%@=========",[NSString stringWithUTF8String:protocol]);
    }
}
- (void)a {
    NSLog(@"--------a-------");
}

- (void)setButtonCircel {

    self.btn.isCircleAngleButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
