//
//  Person.h
//  编程测试_demo
//
//  Created by 程磊 on 17/5/9.
//  Copyright © 2017年 zw. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@protocol nameProtocol;
@protocol ageProtocol;
@protocol setProtocol;

// 定义block，遵循协议

@protocol nameProtocol <NSObject>
@property (nonatomic, strong, readonly)Person<setProtocol> *name;// 姓名
@end

@protocol ageProtocol <NSObject>
@property (nonatomic, strong, readonly)Person<setProtocol> *age;// 年龄
@end

typedef Person<ageProtocol> *(^SetBlock)(NSString *);
@protocol setProtocol <NSObject>
@property (nonatomic, copy, readonly)SetBlock set;// 设置值
@end


@interface Person : NSObject

typedef void(^PersonBlock)(Person<nameProtocol> *person);
+ (NSString *)creatPerson:(PersonBlock)block;

@property (nonatomic, strong)Person *talking;// 说话

@end
