//
//  Person.m
//  RealmTest
//
//  Created by apple on 16/11/1.
//  Copyright © 2016年 Liancheng. All rights reserved.
//

#import "Person.h"

@implementation Person

//+ (NSString *)primaryKey{
//    return @"id";
//}

+ (NSArray *)ignoredProperties{
    return @[@"tmpID"];
}

- (NSString *)name{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}
@end
