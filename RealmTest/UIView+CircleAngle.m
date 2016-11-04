//
//  UIButton+CircleAngle.m
//  RealmTest
//
//  Created by apple on 16/11/3.
//  Copyright © 2016年 Liancheng. All rights reserved.
//

#import "UIView+CircleAngle.h"
#import <objc/runtime.h>
const CGFloat cornerRadius = 10.0;

@implementation UIView (CircleAngle)

-(void)setIsCircleAngleButton:(BOOL)isCircleAngleButton {
    
    if (isCircleAngleButton) {
        
        UIBezierPath *maskPath;
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
        
        objc_setAssociatedObject(self, @"circle", [NSNumber numberWithBool:isCircleAngleButton], OBJC_ASSOCIATION_ASSIGN);
        
        return;
    }
}

-(BOOL)isCircleAngleButton {
    return objc_getAssociatedObject(self, @"circle");
}

@end
