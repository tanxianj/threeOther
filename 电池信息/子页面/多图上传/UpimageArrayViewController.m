//
//  UpimageArrayViewController.m
//  第三方相关
//
//  Created by bang on 2018/2/6.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "UpimageArrayViewController.h"
#import <TZImagePickerController/TZImagePickerController.h>
#define  Cellid @"cellid"
@interface UpimageArrayViewController ()<TZImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UIButton *upBtn;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray <UIImage *>  *imgArray;
@end

@implementation UpimageArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _imgArray = [NSMutableArray arrayWithCapacity:9];
    [self changeNetWoking];
}
-(void)SetNavOther{
    self.title = @"多图上传";
    [self AddBackBtn];
    
}
-(void)changeNetWoking{
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                XJLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                XJLog(@"WIFI网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                XJLog(@"4G网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                XJLog(@"没有网络");
                break;
            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
-(void)upImage{
    TZImagePickerController *imgview = [[TZImagePickerController alloc]initWithMaxImagesCount:999999 delegate:self];
    [imgview setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        XJLog(@"photos is %@ --",photos);

//        _imgArray = [photos mutableCopy];
        [_imgArray addObjectsFromArray:photos];
        [_collectionView reloadData];
    }];
    [self.navigationController presentViewController:imgview animated:YES completion:nil];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imgArray.count+1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    upImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Cellid forIndexPath:indexPath];
    
    if (indexPath.row == _imgArray.count) {
//        evaluation_icon_picture
        cell.imgview.image = [UIImage imageNamed:@"evaluation_icon_picture"];
    }else{
            cell.imgview.image = _imgArray[indexPath.row];
    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == _imgArray.count) {
        [self upImage];
    }else{
        [_imgArray removeObjectAtIndex:indexPath.row];
        [_collectionView reloadData];
    }
    
}
/*
-(void)tz_imagePickerControllerDidCancel:(TZImagePickerController *)picker{
    XJLog(@"取消");
}
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos{
    XJLog(@"photos is %@",photos);
}
 */
-(void)addView{
    _upBtn = [UIButton buttonWithTitle:@"点击选择图片" buttonTitleFontSize:14.0 buttonTitleColor:[UIColor whiteColor] buttonBgColor:[UIColor redColor] buttonTextAlignment:NSTextAlignmentCenter];
    [_upBtn buttonGradient:@[[UIColor redColor],[UIColor blueColor]] buttonCGSize:CGSizeMake(__kWidth-20, 44) ByGradientType:TXJDirectionTypeLeft2Right cornerRadius:YES];
    [_upBtn addTarget:self action:@selector(upImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_upBtn];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumLineSpacing = 2;
    
    layout.minimumInteritemSpacing = 2;
    layout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, __kWidth, MAXFLOAT) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.allowsMultipleSelection = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [_collectionView registerClass:[upImgCollectionViewCell class] forCellWithReuseIdentifier:Cellid];
    [self.view addSubview:_collectionView];
   
}
-(void)initconstraint{
    
    
    [_upBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(self.view.mas_top).offset(70);
        make.height.offset(44);
    }];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_upBtn.mas_bottom).offset(10);
        make.height.offset(100);
    }];
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
@interface upImgCollectionViewCell(){
    
}

@end
@implementation upImgCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        [self addview];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
-(void)addview{
    self.imgview = [[UIImageView alloc]init];
    self.imgview.contentMode = UIViewContentModeScaleAspectFill;
    self.imgview.layer.masksToBounds = YES;
    self.imgview.layer.cornerRadius = 4.0;
    [self.contentView addSubview:self.imgview];
    [self.imgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
@end




