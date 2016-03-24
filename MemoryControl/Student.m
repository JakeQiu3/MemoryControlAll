//
//  Student.m
//  MemoryControl
//
//  Created by qsyMac on 16/3/11.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "Student.h"

@implementation Student
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Student被创建了");
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Student已被销毁，请节哀");
}
@end
