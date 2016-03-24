//
//  Person.h
//  MemoryControl
//
//  Created by qsyMac on 16/3/11.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"
@interface Person : NSObject <CatDelegate>
@property (nonatomic, strong)Cat *cat;
@end
