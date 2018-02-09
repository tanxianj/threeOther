//
//  PayView.m
//  第三方相关
//
//  Created by bang on 2018/1/24.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "PayView.h"
#import "UIColor+APPcolor.h"
#import "UILabel+NewLab.h"
#import "payCell.h"
#import "UIButton+button.h"
#import "ButtonTool.h"
@interface PayView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UILabel *money;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong)NSArray *dataSource_2;
@property(nonatomic,strong)UIView *view_super;

@end
@implementation PayView{
    NSInteger _selectedIndex;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self allocView];
        [self ShowPlayView];
    }
    return self;
}
-(void)allocView{
    self.backgroundColor = [UIColor AppGrayColor];
    _view_super = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-400, __kWidth,400)];
    _view_super.backgroundColor  =[UIColor whiteColor];
    
    [self addSubview:_view_super];
    UILabel *title_lab = [UILabel LableInitWith:@"支付" LabFontSize:16.0 textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter];
    
    [_view_super addSubview:title_lab];
    [title_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(_view_super);
        make.height.offset(50);
    }];
    UIView *line_view = [UIView new];
    line_view.backgroundColor = [UIColor appLineColor];
    [_view_super addSubview:line_view];
    [line_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(title_lab.mas_bottom);
        make.left.right.equalTo(self);
        make.height.offset(1/[UIScreen mainScreen].scale);
        
    }];
    NSString *string;
    
    string = [NSString stringWithFormat:@"共 1000.0 元"];
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor appBlackSubColor], NSFontAttributeName:[UIFont systemFontOfSize:14]};
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:string attributes:attributes];
    
    [attributedText addAttributes:@{NSForegroundColorAttributeName:[UIColor appBlackColor], NSFontAttributeName:[UIFont systemFontOfSize:26]} range:NSMakeRange(2, string.length - 4)];
    _money = [UILabel LableInitWith:nil LabFontSize:14 textColor:[UIColor appBlackColor] textAlignment:NSTextAlignmentCenter];
    _money.attributedText = attributedText;
    [_view_super addSubview:_money];
    [_money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(60);
        make.left.right.equalTo(self);
        make.top.equalTo(line_view.mas_bottom);
    }];
    //
    [_view_super addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_money.mas_bottom);
        make.left.equalTo(_money.mas_left).offset(12);
        make.right.equalTo(_money.mas_right).offset(-12);
//        make.bottom.equalTo(self.tableView.superview.mas_bottom);
        make.height.offset(34*6);
    }];
    
    
    _selectedIndex = 0;
    UIButton *gotoPay = [UIButton buttonWithTitle:@"确认支付" buttonTitleFontSize:14.0 buttonTitleColor:[UIColor blackColor] buttonBgColor:[UIColor clearColor] buttonTextAlignment:NSTextAlignmentCenter];
    
    [_view_super addSubview:gotoPay];
    [gotoPay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view_super.mas_left).offset(12);
        make.right.equalTo(_view_super.mas_right).offset(-12);
        make.top.equalTo(_tableView.mas_bottom).offset(20);
        make.bottom.equalTo(_view_super.mas_bottom).offset(-20);
    }];
    [_view_super layoutIfNeeded];
    
//    [gotoPay.layer insertSublayer :[ButtonTool colorArray:@[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor blueColor].CGColor] directionType:TXJDirectionTypeLeft2Right locations:@[@0,@1] buttonSize:gotoPay.bounds.size] atIndex:0];
    [gotoPay buttonGradient:@[[UIColor redColor],[UIColor greenColor]] buttonCGSize:gotoPay.bounds.size ByGradientType:TXJDirectionTypeLeft2Right cornerRadius:YES];
    
}
-(void)AddTableView{
    
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.allowsMultipleSelection = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
//        _tableView.separatorInset = UIEdgeInsetsZero;
        
    }
    return _tableView;
}
-(NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[
                        @{@"imageName":@"pay_icon_money"    , @"title":@"零钱支付"  , @"payType":@"balance"},
                        @{@"imageName":@"pay_icon_alipay"   , @"title":@"支付宝"    , @"payType":@"alipay"},
                        @{@"imageName":@"pay_icon_wechat"   , @"title":@"微信支付"  , @"payType":@"wxpay"},
                        @{@"imageName":@"pay_icon_lvbao"    , @"title":@"绿　　包"  , @"payType":@"lvbao"}];
    }
    return _dataSource;
}
-(NSArray *)dataSource_2{
    if (!_dataSource_2) {
        _dataSource_2 = @[
                         @{@"imageName":@"pay_icon_money"    , @"title":@"零钱支付"  , @"payType":@"balance"},
                         @{@"imageName":@"pay_icon_lvbao"    , @"title":@"绿　　包"  , @"payType":@"lvbao"}];
    }
    return _dataSource_2;
}
#define mark UITableViewDatasoure
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger number;
    return number = section == 0 ?self.dataSource.count : 2;
//    return self.dataSource.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    payCell *cell = [payCell SetCell];
    switch (indexPath.section) {
        case 0:{
            cell.model =self.dataSource[indexPath.row];
            cell.click_btn.selected = indexPath.row == _selectedIndex;
            if (indexPath.row ==3) {
                cell.click_btn.hidden = YES;
                cell.sy.hidden = NO;
                
            }
        }
            break;
        case 1:{
            cell.model =self.dataSource_2[indexPath.row];
            cell.click_btn.hidden = YES;
            cell.sy.hidden = YES;
            NSArray *arry = @[@"合计 100.00 元",@"合计 0.00 绿包"];
            UILabel *maoey_lab = [UILabel LableInitWith:nil LabFontSize:14.0 textColor:[UIColor blackColor] textAlignment:NSTextAlignmentRight];
            NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor appBlackSubColor], NSFontAttributeName:[UIFont systemFontOfSize:14]};
            
            NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:arry[indexPath.row] attributes:attributes];
            NSString *srt = [NSString stringWithFormat:@"%@",arry[indexPath.row]];
            [attributedText addAttributes:@{NSForegroundColorAttributeName:[UIColor appBlackColor], NSFontAttributeName:[UIFont systemFontOfSize:14]} range:NSMakeRange(2, srt.length - 2)];
            maoey_lab.attributedText = attributedText;
            [cell.contentView addSubview:maoey_lab];
            [maoey_lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(cell.contentView.mas_centerY);
                make.right.equalTo(cell.contentView.mas_right).offset(-12);
            }];
        }
            break;
        default:
            break;
    }
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            if (indexPath.row ==3) {
                return;
            }
            if (indexPath.row == _selectedIndex) {
                
            }else{
                NSInteger tempIndex = _selectedIndex;
                _selectedIndex = indexPath.row;
                
                [tableView reloadData];
        }
            break;
        case 1:{
            
        }
            break;
        default:
            break;
    }
    
    
        
//        [tableView pre]
        
//        [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:tempIndex inSection:0],[NSIndexPath indexPathForRow:_selectedIndex inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 34;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([touches.anyObject.view isDescendantOfView:self]) {
        [self HiddenPlayView];
    }
}
-(void)ShowPlayView{
    self.alpha = 0;
    _view_super.transform = CGAffineTransformMakeTranslation(0, _view_super.bounds.size.height);

    

 
    
//    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.3 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
//
//    } completion:^(BOOL finished) {
//
//    }]
    [UIView animateWithDuration:.22 animations:^{
        _view_super.transform = CGAffineTransformIdentity;
        self.alpha = 1;
        
    } completion:^(BOOL finished) {
        self.hidden = NO;
        /*
        [UIView animateWithDuration:1.0 animations:^{
            _view_super.transform = CGAffineTransformMakeScale(0.5, 0.5);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.0 animations:^{
                _view_super.transform = CGAffineTransformRotate(_view_super.transform, -M_PI/2);
            } completion:^(BOOL finished) {
                
            }];
        }];
         */
    }];
    
    
    /*
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, __kHeight-300)];
    view1.backgroundColor = [UIColor redColor];
    [self addSubview:view1];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, __kHeight-300)];
    view2.backgroundColor = [UIColor blueColor];
    [self addSubview:view2 ];
    view2.hidden = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView transitionFromView:view1 toView:view2 duration:1.0f options:UIViewAnimationOptionShowHideTransitionViews|UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            
     
             //UIViewAnimationOptionShowHideTransitionViews|UIViewAnimationOptionTransitionFlipFromLeft
            // UIViewAnimationOptionShowHideTransitionViews|UIViewAnimationTransitionFlipFromLeft
             
             
             
             
     
        }];
    });
*/
}
     
-(void)HiddenPlayView{
    self.alpha = 1;
    _view_super.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:.22 animations:^{
        _view_super.transform = CGAffineTransformMakeTranslation(0, _view_super.bounds.size.height);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}
@end
