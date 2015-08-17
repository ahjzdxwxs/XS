//
//  ViewController.m
//  NSOperation
//
//  Created by qianfeng on 15/7/22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "CustomOperation.h"

@interface ViewController ()
{
    NSOperationQueue     *_queuue; // 操作队列（操作池） 装操作的
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _queuue = [[NSOperationQueue alloc] init];
    
//    NSOperation创建方式1
    NSInvocationOperation * op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(thread1) object:nil];
//    每一个NSOperation对象必须加到操作队列才能执行
    
    
//    NSOperation创建方式2
    NSBlockOperation *op2 = [[NSBlockOperation alloc] init];
    [op2 addExecutionBlock:^{
        NSLog(@"op2是否在主线程:%i",[NSThread isMainThread]);
    }];
//    操作队列原本是无序执行的，添加依赖可以让队列中的操作有序执行，添加依赖关系要再队列添加操作之前，因为一但操作被添加进队列，就马上执行。
//    添加依赖关系
    [op2 addDependency:op1];
    
    [_queuue addOperation:op1];
    [_queuue addOperation:op2];
    
    for (int i = 0; i < 3; i ++) {
        UIImageView * iv = [[UIImageView alloc] initWithFrame:CGRectMake(120, 20+ i *(80 +10), 120, 80)];
        iv.backgroundColor = [UIColor lightGrayColor];
        iv.tag = i +100;
        [self.view addSubview:iv];
    }
    /**
     http://s8.mogucdn.com/pic/141109/49ssv_ieydmolegjsdqyzwmqytambqgiyde_173x80.jpg
     
     http://s8.mogucdn.com/pic/141118/7jax4_ieydkntggvrwknzzmqytambqmmyde_173x80.jpg
     
     http://s7.mogucdn.com/pic/141111/anxuan_ieygkyjzgnsdanrxmqytambqmmyde_173x80.jpg
     */
    NSArray *imgUrlArr = @[@"http://s8.mogucdn.com/pic/141109/49ssv_ieydmolegjsdqyzwmqytambqgiyde_173x80.jpg",@"http://s8.mogucdn.com/pic/141118/7jax4_ieydkntggvrwknzzmqytambqmmyde_173x80.jpg",@"http://s7.mogucdn.com/pic/141111/anxuan_ieygkyjzgnsdanrxmqytambqmmyde_173x80.jpg"];
    for (int i = 0; i <3;i ++) {
        CustomOperation *op = [[CustomOperation alloc] init];
        op.imgUrl = imgUrlArr[i];
        op.block = ^(NSData *data){
//            NSLog(@"data：%@",data);
            NSDictionary  * dict = @{@"tag":@(i),
                                     @"data":data
                                     };
            
//        要去主线程刷新UI
            [self performSelectorOnMainThread:@selector(showImg:) withObject:dict waitUntilDone:YES];
        };
        
        [_queuue addOperation:op];
    }
}




- (void)thread1 {
//    
    NSLog(@"op1是否在主线程：%i",[NSThread isMainThread]); // 值为0
}
#pragma  mark 主线程刷新UI的方法
- (void)showImg:(NSDictionary *)dict {
//    取出图片视图
    UIImageView *iv = (UIImageView *)[self.view viewWithTag:[dict[@"tag"] intValue] + 100];
    iv.image = [UIImage imageWithData:dict[@"data"]];
}








@end
