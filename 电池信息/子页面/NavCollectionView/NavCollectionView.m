//
//  UICollectionViewController.m
//  第三方相关
//
//  Created by bang on 2018/1/24.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "NavCollectionView.h"
#import "PayView.h"
#define Cellid @"cellid"
@interface NavCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *titleArry;
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)pubuliuLayout *layout;
@property(nonatomic,assign)BOOL Show;
@property(nonatomic,assign)NSUInteger indepath_number;
@property(nonatomic,strong)UIView * collectionSuperView;
@end

@implementation NavCollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self LodView];
    _indepath_number = 0;
    [self.view addSubview: self.tableView];
}
-(void)LodView{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(0, 0, 150, 44);
    [_button setTitle:self.titleArry[0] forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 自适应大小
    [_button sizeToFit];
//    [_button setImage:[UIImage imageNamed:@"order_icon_xiala"] forState:UIControlStateNormal];
    /**
     *
     * UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
     *    top: 为正数：表示向下偏移  为负数：表示向上偏移
     *   left: 为整数：表示向右偏移  为负数：表示向左偏移
     * bottom: 为整数：表示向上偏移  为负数：表示向下偏移
     *  right: 为整数：表示向左偏移  为负数：表示向右偏移
     *
     **/
    _button.imageEdgeInsets = UIEdgeInsetsMake(0, _button.bounds.size.width, 0, 0);//
    
//    _button.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    [_button addTarget:self action:@selector(ShowCollecTion) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = _button;
    
}
-(void)SetNavOther{
    self.title = @"默认";
    
    [self AddBackBtn];
}
#pragma mark - <UITableViewDataSoure>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@%d",self.titleArry[_indepath_number],indexPath.row];
    cell.textLabel.frame = CGRectMake(0, 0, __kWidth, 44);
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PayView *pay = [[PayView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, __kHeight)];
    
    [self.view.window addSubview:pay];
    /*
    UIViewController *tmp;
    
    [self.view addSubview:tmp.view];
    [self addChildViewController:tmp];
    
    */
    [self.view layoutIfNeeded];
}
#pragma mark - <UICollectionView>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    VoucherCenterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Cellid forIndexPath:indexPath];
    cell.textLabel.text = self.titleArry[indexPath.row];
    return cell;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titleArry.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _indepath_number = indexPath.row;
    [_button setTitle:self.titleArry[indexPath.row] forState:UIControlStateNormal];
    [_button sizeToFit];
    [self hiddenView];
    _Show = NO;
    
}
-(void)hiddenView{
    [UIView animateWithDuration:.22 animations:^{
        self.collectionView.transform = CGAffineTransformMakeTranslation(0, -(ceilf(self.titleArry.count/3.0)*52+20));
        self.collectionSuperView.alpha = 0;
        
    } completion:^(BOOL finished) {
        self.collectionSuperView.hidden = YES;
        _Show = NO;
        [self.tableView reloadData];
    }];
}
-(void)showView{
    
    self.collectionSuperView.hidden = NO;
    self.collectionSuperView.alpha = 0;
    [UIView animateWithDuration:.22 animations:^{
        self.collectionView.transform = CGAffineTransformIdentity;
        self.collectionSuperView.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        _Show = YES;
    }];
}
-(void)ShowCollecTion{
    XJLog(@"点击title");

    [self.view addSubview:self.collectionSuperView];
    [_collectionSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    _Show = !_Show;
    if (_Show) {
        [self showView];
        
    }else{
        [self hiddenView];
    }
   
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (![touches.anyObject.view isDescendantOfView:self.collectionView]) {
        [self hiddenView];
        _Show = NO;
    }
    
}
-(NSArray *)titleArry{
    if (!_titleArry) {
        _titleArry = @[@"所有订单", @"待发货", @"待收货", @"待评价", @"交易完成", @"交易关闭", @"退款售后", @"退款售后哈哈哈", @"退款售后哈哈哈", @"退款售后哈哈哈", @"退款售后哈哈哈", @"退款售后哈哈哈", @"退款售后哈哈哈"];
    }
    return _titleArry;
}
-(UICollectionViewLayout *)layout{
    if(!_layout){
        _layout = [[pubuliuLayout alloc]initWithItemsHeightBlock:^CGFloat(NSIndexPath *index) {
            _layout.colMargin = 20;
            return 32.0;
        }];
        
    }
    return _layout;
}
-(UIView *)collectionSuperView{
    if (!_collectionSuperView) {
        _collectionSuperView = [[UIView alloc]init];
        _collectionSuperView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
        [_collectionSuperView addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(_collectionSuperView);
            make.height.offset(ceilf(self.titleArry.count/3.0)*52+20);
        }];
        self.collectionView.transform = CGAffineTransformMakeTranslation(0, -ceilf(self.titleArry.count/3.0)*52+20);
    }
    return  _collectionSuperView;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
       
        
        //
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.itemSize = CGSizeMake((__kWidth - 80)/3.f, 32);
        layout.minimumLineSpacing = 12;
        layout.minimumInteritemSpacing = 12;
        layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, __kWidth, MAXFLOAT) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.allowsMultipleSelection = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[VoucherCenterCell class] forCellWithReuseIdentifier:Cellid];
        
        
       
        
    }
    return _collectionView;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, __kHeight-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
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
@implementation VoucherCenterCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.textLabel = [UILabel new];
        [self.textLabel setFont:[UIFont systemFontOfSize:13.0]];
        self.textLabel.textColor = [UIColor blackColor];
        self.textLabel.backgroundColor = [UIColor colorWithRed:0.957 green:0.961 blue:0.969 alpha:1.0];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        
        self.textLabel.layer.masksToBounds = YES;
        self.textLabel.layer.cornerRadius = 16;
        self.textLabel.layer.borderWidth = 1;
        self.textLabel.layer.borderColor = [UIColor whiteColor].CGColor;
        [self.contentView addSubview:self.textLabel];
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected{
    if (selected) {
        self.textLabel.layer.borderColor = [UIColor whiteColor].CGColor;
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.backgroundColor = [UIColor colorWithRed:0.969 green:0.365 blue:0.259 alpha:1.0];
    }else{
        self.textLabel.layer.borderColor = [UIColor whiteColor].CGColor;
        self.textLabel.textColor = [UIColor blackColor];
        self.textLabel.backgroundColor = [UIColor colorWithRed:0.957 green:0.961 blue:0.969 alpha:1.0];
    }
}

@end

