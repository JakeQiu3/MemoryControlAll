//
//  FirstViewController.m
//  MemoryControl
//
//  Created by qsyMac on 16/3/11.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "FirstViewController.h"
#import "Student.h"
@interface FirstViewController ()

@end
//1.每个变量都有1个地址（该地址对应着一定的存储空间）。门牌号就是地址，是门一定有房间。
//基本原则：谁开辟谁释放。机制：引用计数retainCount机制（针对堆区内存来说的）。
//OC中所有对象都是指针：无论栈区（=的左侧）堆区（=的右侧）都是内存，都得释放。=的左侧是栈区，右侧是堆区。左侧指向右侧。

//* 僵尸对象: 已经被销毁的对象(不能再使用的对象)，又称内存泄露
//* 野指针: 指向僵尸对象(不可用内存)的指针。
//* 空指针: 没有指向存储空间的指针(里面存的是nil, null，也就是0)
@implementation FirstViewController

#pragma mark 少1
- (void)viewDidLoad {
    [super viewDidLoad];
    
    Student *stuA = [[Student alloc]init];//创建了一个学生对象stuA（指针），指向开辟的一块内存如M。alloc后，内存M的引用计数为1
    Student *stuB = stuA;//创建了一个学生对象stuB（指针），也指向内存如M； 内存M的引用计数为2
    
//    stuA=nil;stuB=nil;//对象stuA和stuB在栈区的内容为空，即：不再指向任何堆区内存。即对象为空指针，被释放回收，防止野指针。
//arc下对象禁止发送release消息。执行完本消息后，会自动autorelease，释放掉不用的内存。
    
//    mrc下对象发送release消息，该对象所指的堆区内存引用计数-1，当retaincount为0，自动调用delloc方法，释放内存
//    [stuA release];
//    [stuB release];
    
    
//    直接引用和间接引用
    int a;
    a = 10;
//    解释：声明一个变量名为a的整型，系统自动会将变量名a转换为变量的存储地址，根据地址找到变量a的存储空间，然后再将数据10以2进制的形式放入变量a的存储空间中，见图1
//    首先将变量a的地址存放在另一个变量中，比如存放在变量b中，然后通过变量b来间接引用变量a，间接读写变量a的值。这就是"间接引用"。
}

#pragma mark 少2
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"刚执行完viewDidLoad，该执行viewWillAppear啦");
}
@end
