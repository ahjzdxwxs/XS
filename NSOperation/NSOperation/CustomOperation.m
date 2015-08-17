//
//  CustomOperation.m
//  NSOperation
//
//  Created by qianfeng on 15/7/22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CustomOperation.h"

@interface CustomOperation ()<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSMutableData     *_imgData; // 图片的data类型
    BOOL               _isFineshed ; // 判断下载是否完成
}

@end

@implementation CustomOperation

//自定义operation的时候，一般重写main
- (void)main{
    _imgData = [NSMutableData data];
    
    NSURLRequest * req = [NSURLRequest requestWithURL:[NSURL URLWithString:_imgUrl]];
//    NSLog(@"req%@",req);
//    发送网络请求
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:req delegate:self];
//    NSLog(@"conn%@",conn);
    [conn start];
//    如果线程停止，如果下载未完成
//    [NSDate distantFuture]遥远未来的一个时间
    while (!_isFineshed) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    
}
#pragma mark - NSURLConnection Delegate
#pragma mark 接收到响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [_imgData setLength:0];
    
}
#pragma mark 接收到数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_imgData appendData:data];
}
#pragma mark 请求失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    NSLog(@"请求失败:%@",error.localizedDescription);
}
#pragma mark 请求成功
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    _isFineshed = YES;
//    请求成功，传出图片数据
    if (_block) {
        _block(_imgData);
    }
}






@end
