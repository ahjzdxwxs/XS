//
//  ViewController.m
//  UICollectionView
//
//  Created by qianfeng on 15/7/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "MyView.h"
#import "MyModel.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray     *_dataArr;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 30; i ++) {
        NSString * iconName = @"iconMe.jpg";
        NSString *title = [NSString stringWithFormat:@"%i号美女",i];
        MyModel * model = [MyModel modelWithIconName:iconName title:title];
        [_dataArr addObject:model];
    }

    /*UICollectionView
     iOS之后的新控件，最大的特点是能够实现cell的灵活布局
     UICollectionViewLayout 布局类是一个抽象类，如果要使用它，只能用它的子类实例对象 .它用来管理UICollectionView的布局
     */
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    设置UICollectionView的滑动方向
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
    
//    水平，此属性是左右列之间的间距
//    垂直，此属性是上下列之间的间距
    
//    滑动方向cell的间距，直接生效
    flowLayout.minimumLineSpacing = 20;
    
//    水平，此属性是上下列之间的间距
//    垂直，此属性是左右列之间的间距
//    此间距有时会根据ItemSize大小和edgesInsets来自动调节
    
//    垂直滑动方向cell的间距，会根据ItemSize大小和edgesInsets来自动调节
    flowLayout.minimumInteritemSpacing = 20;
    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) collectionViewLayout:flowLayout];
    
//    注册一个复用的xib文件
    [collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:[MyCell identifier]];
    
//    注册一个复用的头部视图
    [collectionView registerClass:[MyView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[MyView identifier]];
//    注册一个复用的尾部视图
    [collectionView registerClass:[MyView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[MyView identifier]];
    
    
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];

}

#pragma mark collectionView Delegate&DataSource
#pragma mark 组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

#pragma mark 每组多少格
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArr.count;
}


#pragma mark 填充cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:[MyCell identifier] forIndexPath:indexPath];
 /*xib
//    如果cell为空，那么collection会自动根据注册的xib获取cell;
//    int random = arc4random() % 14;
    [cell setimage:[UIImage imageNamed:[NSString stringWithFormat:@"iconMe.jpg"]] title:[NSString stringWithFormat:@"第%li组，第%li行",indexPath.section,indexPath.row]];
  */
    cell.model = _dataArr[indexPath.row];
    
    return cell;
    
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 120);
}
#pragma mark 设置每一项距离它项上下左右的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark 设置头尾部视图的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    如果水平，高度为频高
//    如果垂直，宽度为频宽
    return CGSizeMake(50, 50);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(50, 50);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    MyView *myView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[MyView identifier] forIndexPath:indexPath];
    if (kind == UICollectionElementKindSectionHeader) {
        myView.backgroundColor = [UIColor redColor];
    }else{
        myView.backgroundColor = [UIColor blackColor];
    }
    
    
    return myView;
}









@end
