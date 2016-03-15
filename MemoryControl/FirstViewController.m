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

//内存的最小单元：字节byte。每个字节有自己的地址，而且是系统固定好的。

//1.每个变量都有1个地址（该地址对应着一定的存储空间）。门牌号就是地址，是门一定有房间。

//基本原则：谁开辟谁释放。机制：引用计数retainCount机制（针对堆区内存来说的，引用计数就是看看有多少个指针指向一块内存实体）。

//OC中所有对象都是指针（间接引用）：无论栈区（=的左侧）堆区（=的右侧）都是内存，都得释放。=的左侧是栈区，右侧是堆区。左侧指向右侧。

@implementation FirstViewController

#pragma mark 少1
- (void)viewDidLoad {
    [super viewDidLoad];
#warning 少 创建对象的过程：栈区和堆区的引用
    Student *stuA = [[Student alloc]init];//创建了一个学生对象stuA（指针），指向开辟的一块内存如M。alloc后，内存M的引用计数为1
    Student *stuB = stuA;//创建了一个学生对象stuB（指针），也指向内存如M； 内存M的引用计数为2
#warning 少 空对象和值为空的对象
    stuA=nil;stuB=nil;//空对象，回收指针的操作
    //空对象：上述操作对象stuA和stuB为空对象，即：不再指向任何堆区内存。即对象为空对象，被释放回收。相当于将指向对象的指针直接和原对象一刀两断。直接让stuA或stuB指向nil，而内存实体不会消失，也不会有系统回收。
//stuA=[NSNull null];stuB=[NSNull null];
    //值为空的对象：该指针扔指向某堆区的内存，该内存中为空，什么都没有。
   
#warning 少 arc和mrc下的release比较
    //    [stuA release];
    //    [stuB release];
// arc下对象禁止发送release消息，系统自动加入到自动释放池，进行release。执行完本消息后，会自动autorelease，释放掉不用的内存。
//mrc下对象发送release消息，该对象所指的堆区内存引用计数-1，当retaincount为0，自动调用delloc方法，释放内存

    
    
#warning 少 直接引用和间接引用的比较
    int a;
    a = 10;
//    解释：声明一个变量名为a的整型，系统自动会将变量名a转换为变量的存储地址，根据地址找到变量a的存储空间，然后再将数据10以2进制的形式放入变量a的存储空间中，见图1
    NSString *b = [[NSString alloc]init];
    NSString *c = b;
//    首先将变量a的地址存放在另一个变量中，比如存放在变量b中，然后通过变量b来间接引用变量a，间接读写变量a的值。这就是"间接引用"。见图2
}

#pragma mark 少2
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"刚执行完viewDidLoad，该执行viewWillAppear啦");
}
@end
