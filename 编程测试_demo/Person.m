//
//  Person.m
//  编程测试_demo
//
//  Created by 程磊 on 17/5/9.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "Person.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


@interface Person ()<nameProtocol,ageProtocol,setProtocol>
@property(nonatomic,strong)NSString *message;// 记录人物信息

@end
@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.message = @"";
    }
    return self;
}

//+ (NSString *)creatPerson:(void (^)(Person<nameProtocol> *))block
//{
//    if (block) {
//        Person<nameProtocol> *person = [[Person<nameProtocol> alloc]init];
//        block(person);
//        return person.message;
//        
//    }
//    return nil;
//
//}

+ (NSString *)creatPerson:(PersonBlock)block
{
    if (block) {
        Person<nameProtocol> *person = [[Person<nameProtocol> alloc]init];
        block(person);
        return person.message;
        
    }
    return nil;
}

- (SetBlock)set
{
    WS(weakSelf)
    return ^id(NSString *str){
        [weakSelf addOtherString:str];
        
        return self;
    };
}

- (Person *)name
{
    [self addOtherString:@"姓名"];
    
    return self;

}
- (Person *)age
{
    [self addOtherString:@"年龄"];
    
    return self;
}

- (Person *)talking
{
    [self addOtherString:@"在说话"];
    
    return self;
}

// 信息加入message中
- (void)addOtherString:(NSString *)otherStr
{
    self.message = [NSString stringWithFormat:@"%@ %@",self.message,otherStr];
    NSLog(@"%@", self.message);
}

@end
