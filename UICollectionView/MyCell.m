//
//  MyCell.m
//  UICollectionView
//
//  Created by qianfeng on 15/7/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyCell.h"

#import "MyModel.h"

@interface MyCell ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation MyCell
- (void)awakeFromNib {
    _titleLabel.adjustsFontSizeToFitWidth = YES;
}




+ (NSString *)identifier {
    
    
    return @"myCell";
}


- (void)setimage:(UIImage *)image title:(NSString *)title {
    
    _imageView.image = image;
    _titleLabel.text = title;
}

- (void)setModel:(MyModel *)model {
    _model = model;
    
    _imageView.image = [UIImage imageNamed:model.iconName];
    
    _titleLabel.text = model.title;
    
}





@end
