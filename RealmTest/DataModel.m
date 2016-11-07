//
//  DataModel.m
//  RealmTest
//
//  Created by apple on 16/11/1.
//  Copyright © 2016年 Liancheng. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (instancetype)initWithTime:(NSTimeInterval *)time
                       title:(NSString *)title {
    self = [super init];
    if (self) {
        _time = time;
        _title = [title copy];
    }
    return self;
}

- (instancetype)initWithTime:(NSTimeInterval *)time {
    return [self initWithTime:time title:nil];
}

@end
