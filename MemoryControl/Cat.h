//
//  Cat.h
//  MemoryControl
//
//  Created by qsyMac on 16/3/11.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CatDelegate <NSObject>
@end


@interface Cat : NSObject
@property (nonatomic, strong)id<CatDelegate> delegate;

//@property (nonatomic, weak)id<CatDelegate> delegate;

@end
