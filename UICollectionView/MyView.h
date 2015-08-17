//
//  MyView.h
//  UICollectionView
//
//  Created by qianfeng on 15/7/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

//在UICollectionView里面，所有可复用的视图必须继承于 UICollectionReusableView
@interface MyView : UICollectionReusableView

+ (NSString *)identifier;


@end
