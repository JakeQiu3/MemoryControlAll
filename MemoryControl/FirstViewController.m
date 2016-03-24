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
# warning 少  内存是王道,声明变量
//  1.内存的最小单元：字节byte。每个字节有自己唯一的地址，而且是系统固定分配好的，像酒店的最小单间号一样。2.定义某个类型，譬如int（4个最小单间）或char（1个最小单间）型变量时，是给定了一个房间是家庭版（包含3个以上的最小单间号）还是商务版（int型）房间。3.每个最小单间号都有自己的地址，同时变量也有地址。变量存储单元的第一个字节的地址就是该变量的地址。4.内存寻址是从大到小的，因此先定义的变量地址大。5.查看变量的内存地址：printf("变量a的地址是：%p", &a) 6.任何数值在内存中都是以补码的形式存储的：正数的补码与原码相同。比如9的原码和补码都是1001，负数的补码等于它正数的原码取反后再+1。（取反的意思就是将正数原码中所有的0变1、1变0）7.变量仅仅声明，但没有进行初始化之前，不要拿来使用，因为它里面存储的是一些垃圾数据. 8.普通定义的变量，其作用域只在{}之间。

//基本原则：谁开辟谁释放。机制：引用计数retainCount机制（针对堆区内存来说的，引用计数就是看看有多少个指针指向一块内存实体）。

//OC中所有对象都是指针（间接引用）：无论栈区（=的左侧）堆区（=的右侧）都是内存，都得释放。=的左侧是栈区，右侧是堆区。左侧指向右侧。
//属性的默认是：atomic 和 readwrite ；（mrc）assign 和retain，copy等是根据数据类型选择的；（arc）strong 和weak 也是
@implementation FirstViewController

#pragma mark 少1
- (void)viewDidLoad {
    [super viewDidLoad];

#warning 少 创建对象的过程：栈区和堆区的引用
    Student *stuA = [[Student alloc]init];//创建了一个学生对象stuA（指针），指向开辟的一块内存如M。alloc后，内存M的引用计数为1
    Student *stuB = stuA;//创建了一个学生对象stuB（指针），也指向内存如M； 内存M的引用计数为2
    
#warning 少 空对象和值为空的对象:33行代码执行完毕后，堆区学生的内存被释放；若注释掉33行代码，在viewdidload结束时，堆区学生的内存被释放。
    
    stuA=nil;stuB=nil;
    //空对象，回收指针的操作
//空对象(空指针)：上述操作对象stuA和stuB为空对象，即：不再指向任何堆区内存。即对象为空对象，被释放回收。相当于将指向对象的指针直接和原对象一刀两断。直接让stuA或stuB指向nil，至于内存实体是否会消失，得看该内存的引用计数是否为0.
    
//stuA=[NSNull null];stuB=[NSNull null];
//值为空的对象：该指针扔指向某堆区的内存，该内存中为空，什么都没有。
    
#warning 少 空指针和野指针
// 野指针： 指向"垃圾"内存（不可用内存）的指针
    // 空指针（空对象）：没有存储任何内存地址的指针就称为空指针(NULL指针)： Student *s1 = NULL;或者Student *s2 = nil;
   
#warning 少 arc和mrc下的release比较
    //    [stuA release];
    //    [stuB release];
// arc下对象禁止发送release消息，系统自动加入到自动释放池，进行release。执行完本消息后，会自动autorelease，释放掉不用的内存。
//mrc下对象发送release消息，该对象所指的堆区内存引用计数-1，当retaincount为0，自动调用delloc方法，释放内存

    
# warning 少 直接引用和间接引用的比较
    int a;
    a = 10;
//    解释：声明一个变量名为a的整型，系统自动会将变量名a转换为变量的存储地址，根据地址找到变量a的存储空间，然后再将数据10以2进制的形式放入变量a的存储空间中，见图1
    NSString *b = [[NSString alloc]init];
    NSString *c = b;
//    首先将变量a的地址存放在另一个变量中，比如存放在变量b中，然后通过变量b来间接引用变量a，间接读写变量a的值。这就是"间接引用"，也就是指针变量。
//    指针的作用：1.单个的*b代表根据b指针的所指的地址，来获取该地址对应的存储空间内容，可间接修改某个数据。详见见图3  2.
}

#pragma mark 少2
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"刚执行完viewDidLoad，该执行viewWillAppear啦");
}


@end
