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
#import <TZImagePickerController/TZImageCropManager.h>
#define Cellid @"Evalua"
@interface EvaluationListTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>{
    CGRect oldframe;
    UILabel *numberlab;
}
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
    EvaluaTionCollectionViewCell *cell = (EvaluaTionCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    [self TXJscanBigImageWithImageViewArray:self.imgarry indexImage:indexPath.row alpha:0.9];
    UIImage *img =  [TZImageCropManager cropImageView:cell.imgView toRect:CGRectMake(0, 0, 100, 100) zoomScale:2 containerView:cell.contentView];
    cell.imgView.image = img;
}
-(void)TXJscanBigImageWithImageViewArray:(NSArray *)imageArray indexImage:(NSInteger)indx alpha:(CGFloat)alpha{
    //  当前视图
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *bgView = [UIView new];
    bgView.frame = window.bounds;
    [window addSubview:bgView];
    //  将原始视图添加到背景视图中
    UIScrollView* scrolView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,__kWidth, __kHeight)];
    scrolView.contentSize = CGSizeMake(imageArray.count*__kWidth, __kHeight);
    scrolView.showsVerticalScrollIndicator = NO;
    scrolView.showsHorizontalScrollIndicator = NO;
    scrolView.pagingEnabled = YES;
    scrolView.bounces = NO;
    scrolView.delegate = self;
    [scrolView setBackgroundColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:alpha]];
    [scrolView setAlpha:0];
    [bgView addSubview:scrolView];
    
        numberlab = [[UILabel alloc]init];
        numberlab.text = @"1/5";
        numberlab.font = [UIFont systemFontOfSize:14.0];
        numberlab.textColor = [UIColor whiteColor];
        numberlab.textAlignment = NSTextAlignmentCenter;
    
    
        numberlab.frame = CGRectMake(0, 0, __kWidth, 40);
        [bgView addSubview:numberlab];
    
    for (int i = 0; i< imageArray.count; i++) {
        
        NSString *str = [NSString stringWithFormat:@"%@",imageArray[i]];
        
        UIImageView * currentImageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:str]];
        //  当前imageview的图片
        UIImage *image = currentImageview.image;
       oldframe = [currentImageview convertRect:currentImageview.bounds toView:window];
        
        //  将所展示的imageView重新绘制在backgroundView中
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(i*__kWidth, oldframe.origin.y, oldframe.size.width, oldframe.size.height);
        imageView.contentMode =UIViewContentModeScaleAspectFit;
        [imageView setTag:1024];
        [scrolView addSubview:imageView];
        
        //  添加点击事件同样是类方法 -> 作用是再次点击回到初始大小
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideImageView:)];
        [bgView addGestureRecognizer:tapGestureRecognizer];
        
        //  动画放大所展示的ImageView
        [UIView animateWithDuration:0.4 animations:^{
            
            CGFloat y,width,height;
            y = (__kHeight - image.size.height * __kWidth / image.size.width) * 0.5;
            //宽度为屏幕宽度
            width = __kWidth;
            //高度 根据图片宽高比设置
            height = image.size.height * __kWidth / image.size.width;
            [imageView setFrame:CGRectMake(i*width, y, width, height)];
            //重要！ 将视图显示出来
            [scrolView setAlpha:1];
            
        } completion:^(BOOL finished) {
            
        }];
    }
    scrolView.contentOffset = CGPointMake(indx*__kHeight, 0);
    
}

// 完成拖拽(滚动停止时调用此方法，手指离开屏幕前)



-(void)scrollViewDidScroll:(UIScrollView*)scrollView{
    //    XJLog(@"%f",scrollView.contentOffset.x);
    
    numberlab.text = [NSString stringWithFormat:@"%.0f/%li",(scrollView.contentOffset.x/__kWidth)+1,self.imgarry.count];

}
-(void)hideImageView:(UITapGestureRecognizer *)tap{
    
    UIView *backgroundView = tap.view;
    //  原始imageview
    UIImageView *imageView = [tap.view viewWithTag:1024];
    //  恢复
    [UIView animateWithDuration:0.4 animations:^{
        [imageView setFrame:oldframe];
        [backgroundView setAlpha:0];
    } completion:^(BOOL finished) {
        //完成后操作->将背景视图删掉
        [backgroundView removeFromSuperview];
    }];
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

