//
//  ViewController.h
//  RealmTest
//
//  Created by apple on 16/11/1.
//  Copyright © 2016年 Liancheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerDelegate <NSObject>

@optional

- (void)clickBtn;

@end

@interface ViewController : UIViewController
{
    NSString *name;
    NSData *data;
    NSInteger age;
}

@property (nonatomic, strong) NSArray *arr;
@property (nonatomic, copy) NSString *str;
@property (nonatomic, weak) id <ViewControllerDelegate> delegate;

- (void)get;
- (void)loginWithUserName:(NSString *)UserName AndPassword:(NSString *)password;

@end

