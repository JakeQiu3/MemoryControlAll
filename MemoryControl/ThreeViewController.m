//
//  ThreeViewController.m
//  MemoryControl
//
//  Created by 邱少依 on 16/3/24.
//  Copyright © 2016年 QSY. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//  创建了一个 Core Graphics 图像引用，然后在完成后很快释放
    UIImage *cropImage = [UIImage imageNamed:@"1"];
    CGRect imageRect = CGRectMake(100, 70, 100, 100);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([cropImage CGImage], imageRect);
    cropImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    UIImageView *imageView = [[UIImageView alloc] initWithImage:cropImage];
    imageView.frame =imageRect;
    [self.view addSubview:imageView];
    
//    手动管理autoreleasepool：随时随地管理没必要的内存
    UILabel *sumLabel = [[UILabel alloc]init];
    sumLabel.frame = CGRectMake( 100, 100, 133, 132);
    sumLabel.textColor = [UIColor blackColor];
    sumLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:sumLabel];
    for (int i=0; i<5000; i++)
    {
        @autoreleasepool {
            i++;
            NSNumber *num = [NSNumber numberWithInt:i];
            NSLog(@"%@",num);
        }
    }
}
//检测控制器的生命周期
- (void)dealloc {
    NSLog(@"%@ is being deallocated",self);
}

//instrument工具来管理
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
