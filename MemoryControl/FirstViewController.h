//
//  FirstViewController.h
//  MemoryControl
//
//  Created by qsyMac on 16/3/11.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
//文／汉斯哈哈哈（简书作者）

// weak:指明该对象并不负责保持delegate这个对象，delegate这个对象的销毁由外部控制。

// strong：该对象强引用delegate，外界不能销毁delegate对象，会导致循环引用(Retain Cycles)
@end
