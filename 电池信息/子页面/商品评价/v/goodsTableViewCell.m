//
//  goodsTableViewCell.m
//  
//
//  Created by bang on 2018/1/25.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "goodsTableViewCell.h"
#import "ZJImageMagnification.h"
@interface goodsTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)NSMutableArray <UIImageView *>*imgmutabArray;
@property(nonatomic,strong) NSArray *imgarry;
@end
@implementation goodsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _imgmutabArray = [[NSMutableArray alloc]initWithCapacity:3];
    
        //        cell.goodsimg.bounds.size.height = (__kWidth-2)/3;
    _goodsimg.userInteractionEnabled = YES;
    
}
-(void)singleTapAction:(UITapGestureRecognizer *)img{
    UIImageView *imgv =(UIImageView *) img.view;
    XJLog(@"点击");
//    [ZJImageMagnification scanBigImageWithImageView:imgv alpha:0.9];
   
//    [ZJImageMagnification scanBigImageWithImageViewArray:self.imgarry indexImage:0 alpha:0.9];
}
-(void)setModel:(NSDictionary *)model{
    _model = model;
    
    _other.text = model[@"title"];
    NSInteger imgcount;
    NSString *str = [NSString stringWithFormat:@"%@",model[@"img"]];
    imgcount = [str integerValue];
    for (int i =0; i<imgcount; i++) {
        NSString *imgname = [NSString stringWithFormat:@"%i.jpeg",i+1];
        UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgname]];
        NSInteger number=0;
        for (int j=0; j<i; j++) {
            number++;
            if (number==3) {
                number = 0;
            }
        }
        img.userInteractionEnabled = YES;
        UITapGestureRecognizer *tp =  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapAction:)];
        [img addGestureRecognizer:tp];
        [self.goodsimg addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.goodsimg.mas_left).offset(number*(__kWidth-100)/3+number*5);
            make.top.equalTo(self.goodsimg.mas_top).offset(floorf(i/3.0)*(__kWidth-100)/3 + (floorf(i/3.0) + 1)*5);
            make.width.height.offset((__kWidth-100)/3);
        }];
    }
   
}
+(goodsTableViewCell *)setCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"goodsTableViewCell" owner:nil options:nil] lastObject];
}
-(void)prepareForReuse{
    for (UIView *view in self.goodsimg.subviews) {
//        [view removeFromSuperview];
//        [view setHidden:YES];
    }
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
