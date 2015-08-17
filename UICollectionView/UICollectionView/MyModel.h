//
//  MyModel.h
//  UICollectionView
//
//  Created by qianfeng on 15/7/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject


@property (nonatomic,copy)NSString * iconName;

@property (nonatomic,strong)NSString *title;

+ (instancetype)modelWithIconName:(NSString *)iconName title:(NSString *)title;


@end
