//
//  Person.h
//  RealmTest
//
//  Created by apple on 16/11/1.
//  Copyright © 2016年 Liancheng. All rights reserved.
//

#import <Realm/Realm.h>

@interface Person : RLMObject

@property NSInteger tmpID;
@property (readonly) NSString *name;
@property NSString *firstName;
@property NSString *lastName;

@end
