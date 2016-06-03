//
//  TestDelegateViewController.m
//  MemoryControl
//
//  Created by qsyMac on 16/3/11.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "TestDelegateViewController.h"
#import "Person.h"
@interface TestDelegateViewController ()
@property (nonatomic, strong)Person *person1;
#warning 少  指针和对象的区别
// 1、内存的使用状态：门牌号至少有一个，房间内有东西。2、内存的泄露状态：门牌号还在，但房间内放的已不是原来的东西或者说房子里放的都是垃圾。 3、引用计数为0：门牌号都没了。

// 指针：是一栋大楼的门牌号码（地址），它指向的对象：是这房间的东西（内存）。
// 空指针（也叫空对象）：一个被赋值为0的指针，在没有被具体初始化init之前，其值为0（nil或NSNull）。空指针发送消息不会报错。 如：char *a; 该指针就是空指针。
// 野指针：指向僵尸对象的指针。给野指针发送消息可能会报错。房子已非，门牌号还在。
// 僵尸对象：已被释放掉的内存。房子内放的很可能不是原来的东西

@end

@implementation TestDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    下面这行代码的作用域是viewDidLoad这个大括号。
//    门牌号                房间内东西
    Person *person = [[Person alloc]init];
    person.cat.delegate = nil;//若delegate为strong，手动把delegate变为空指针（空对象）。不再指向才会被释放Person。若delegate为weak，不需要手动释放，系统自动释放。
//   又多了一个门牌号，切这个门牌号是和该控制器生命周期一样。
    
#warning 少 33行是控制器的强引用属性指向该Person的内存。，该控制的属性变量_person，也指向该person的堆区内存。若无此行，该person在viewdidload方法结束时，}前被释放掉。
//    self.person1 = person;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
