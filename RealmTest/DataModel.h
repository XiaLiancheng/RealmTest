//
//  DataModel.h
//  RealmTest
//
//  Created by apple on 16/11/1.
//  Copyright © 2016年 Liancheng. All rights reserved.
//

#import <Realm/Realm.h>

typedef NS_ENUM(NSInteger, CYLSex) {
    CYLSexMan,
    CYLSexWoman
};

typedef NS_OPTIONS(NSInteger, Language) {
    Chinese,
    English
};

@interface DataModel : RLMObject

@property (nonatomic, readonly, assign) NSTimeInterval *time;
@property (nonatomic, readwrite, copy) NSString *title;

- (instancetype)initWithTime:(NSTimeInterval *)time title:(NSString *)title;

- (instancetype)initWithTime:(NSTimeInterval *)time;

@end
