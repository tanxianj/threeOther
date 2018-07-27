//
//  EvaluationListTableViewCell.m
//  
//
//  Created by bang on 2018/1/29.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "EvaluationListTableViewCell.h"
#import "EvaluaTionCollectionViewCell.h"
#import "ZJImageMagnification.h"
#define Cellid @"Evalua"
@interface EvaluationListTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)NSArray *imgarry;
@end
@implementation EvaluationListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.itemSize = CGSizeMake((__kWidth - 80)/3.f, (__kWidth - 80)/3.f);
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    _collectionView.collectionViewLayout = layout;
    _collectionView.allowsMultipleSelection = NO;
    _collectionView.backgroundColor = [UIColor grayColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
//    [_collectionView registerClass:[EvaluaTionCollectionViewCell class] forCellWithReuseIdentifier:Cellid];
    [_collectionView registerNib:[UINib nibWithNibName:@"EvaluaTionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:Cellid];
    [self inSetlayout];
}
-(void)inSetlayout{
    
    
}
#pragma mark - <UICollectionView>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return arc4random()%self.imgarry.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    EvaluaTionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Cellid forIndexPath:indexPath];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"EvaluaTionCollectionViewCell" owner:nil options:nil] lastObject];
    }
    NSString *str = [NSString stringWithFormat:@"%@",self.imgarry[indexPath.row]];
    cell.imgView.image = [UIImage imageNamed:str];
    
    return cell;
    
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    XJLog(@"点击了第%li个",indexPath.row);
    
    [ZJImageMagnification scanBigImageWithImageViewArray:self.imgarry indexImage:indexPath.row alpha:0.9];
}
-(NSArray *)imgarry{
    if (!_imgarry) {
        _imgarry = @[@"1.jpeg",@"2.jpeg",@"3.jpeg",@"4.jpeg",@"5.jpeg"];
    }
    return _imgarry;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

