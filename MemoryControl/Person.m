//
//  Person.m
//  MemoryControl
//
//  Created by qsyMac on 16/3/11.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "Person.h"
#import "Cat.h"

@interface Person()



@end

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 实例化cat
        self.cat = [[Cat alloc] init];
        // cat的delegate引用self,self的retainCount，取决于delegate修饰，weak：retainCount不变，strong：retainCount + 1。
        self.cat.delegate = self;
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"Person----销毁");
}


@end
