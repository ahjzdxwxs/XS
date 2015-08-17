//
//  MyModel.m
//  UICollectionView
//
//  Created by qianfeng on 15/7/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel


+ (instancetype)modelWithIconName:(NSString *)iconName title:(NSString *)title {
    MyModel * model = [[MyModel alloc] init];
    model.iconName = iconName;
    model.title = title;
    return model;
}


@end
