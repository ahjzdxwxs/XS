//
//  MyCell.h
//  UICollectionView
//
//  Created by qianfeng on 15/7/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyModel;
@interface MyCell : UICollectionViewCell


+ (NSString *)identifier;

//给cell填充数据的方法
- (void)setimage:(UIImage*)image title:(NSString *)title;

@property (nonatomic,strong)MyModel * model ;

@end
