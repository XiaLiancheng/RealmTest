//
//  DataModel.h
//  RealmTest
//
//  Created by apple on 16/11/1.
//  Copyright © 2016年 Liancheng. All rights reserved.
//

#import <Realm/Realm.h>

@interface DataModel : RLMObject

@property (nonatomic ,strong) NSData *time;
@property (nonatomic ,copy) NSString *title;

@end
