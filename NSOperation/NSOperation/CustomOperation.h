//
//  CustomOperation.h
//  NSOperation
//
//  Created by qianfeng on 15/7/22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^OperationBlock)(NSData *data);
@interface CustomOperation : NSOperation
//图片路径
@property (nonatomic,strong) NSString  *imgUrl ;

//传值的block
@property (nonatomic,strong) OperationBlock block;

@end
