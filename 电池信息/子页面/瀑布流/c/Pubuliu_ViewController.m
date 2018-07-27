//
//  Pubuliu_ViewController.m
//  
//
//  Created by MAc on 2017/12/6.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "Pubuliu_ViewController.h"
#define cellid @"colcelid"
#define HTTP @"http://www.le173.com/v2/goods/list"
#define color(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
@interface Pubuliu_ViewController ()
@property(nonatomic,strong)UICollectionView* collectionView;
@property(nonatomic,strong)UICollectionViewLayout* layout;
@property (nonatomic,strong)NSMutableArray *arry;
@property(nonatomic,strong)NSArray* str_Arr;
@property(nonatomic,strong)NSArray* heightArr;
@end

@implementation Pubuliu_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"瀑布流";
    _collectionview.backgroundColor = color(214, 214, 214);
    // Do any additional setup after loading the view.
    [_collectionview setCollectionViewLayout:self.layout];

    [_collectionview registerNib:[UINib nibWithNibName:@"Pubuliu_CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellid];
    _collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        
        if ([_collectionView.mj_header isRefreshing]) {
            [_collectionView.mj_header endRefreshing];
        }
    }];
    _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        if ([_collectionView.mj_footer isRefreshing]) {
            [_collectionView.mj_footer endRefreshing];
        }
    }];
    [self Get_Data];
    
}
-(void)Get_Data{
    //菊花加载
    [ MBProgressHUD showActivityMessageInWindow:@"加载中..."];
    [[AFNetwork shareManager] GET:HTTP parameters:@{@"mem_id":@"2"}  progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject is %@",responseObject);
        _arry = [XJModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        _str_Arr =responseObject[@"data"][@"list"];
        [self.collectionview reloadData];
        [MBProgressHUD hideHUD ];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arry.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Pubuliu_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
/*
    cell.img_view.image =[UIImage imageNamed:@"tp.png"];
    cell.lab_lab.text = [NSString stringWithFormat:@"第%li个item",indexPath.row];
 */
    cell.model = _arry[indexPath.row];
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击第%li个",(long)indexPath.row);
}

-(UICollectionViewLayout *)layout{
    if(!_layout){
        _layout = [[pubuliuLayout alloc]initWithItemsHeightBlock:^CGFloat(NSIndexPath *index) {
            return [self.heightArr[index.item] floatValue];
        }];
        
    }
    return _layout;
}
-(NSArray *)heightArr{
    if(!_heightArr){
        //随机生成高度
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0; i<_arry.count; i++) {
            NSInteger h1 = [self Get_NSstring:_str_Arr[i][@"gd_name"] FoneSize:13.0] *20;
            NSInteger h2 = [self Get_NSstring:_str_Arr[i][@"gd_price"] FoneSize:13.0] *20;
            /*
            NSString *img_str = [NSString stringWithFormat:@"%@",_str_Arr[i][@"gd_img"]];
            NSData *data =[NSData dataWithContentsOfURL:[NSURL URLWithString:img_str]];
            UIImage *imgg =[UIImage imageWithData:data];
            CGFloat h4 = imgg.size.height/(self.view.bounds.size.width/2);
            NSLog(@"h4 is %lf",h4);
             */
            NSInteger h3 = h1 + h2 +100;
            [arr addObject:@(h3)];
        }
        _heightArr = [arr copy];
    }
    return _heightArr;
}

-(NSInteger)Get_NSstring:(NSString *)str FoneSize:(CGFloat)size{
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width/2-15, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil];
    CGSize textSize = [str sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:size]}];
    NSUInteger textRow = (NSUInteger)(rect.size.height / textSize.height);
    NSLog(@"行数- %@->%li",str,textRow);//行数
    return textRow;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
