//
//  TXJPromptView.m
//  UUIDTest
//
//  Created by 谭显敬 on 2018/6/29.
//  Copyright © 2018年 谭显敬. All rights reserved.
//

#import "TXJPromptView.h"
@implementation TXJPromptView
+(void)ShowPromptView:(NSString *)title cancelBtnTitle:(NSString *)cancel sureBtnTitle:(NSString *)sureBtn leftBtnAction:(void (^)(void))left rightBtnAction:(void (^)(void))right{
    UIView *superview = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    superview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    TXJPromptView * view = [[[NSBundle mainBundle] loadNibNamed:@"TXJPromptView" owner:self options:nil] lastObject];
    view.TitleLab.attributedText = [TXJPromptView backattContentStr:title];
    [view.TitleLab sizeToFit];
    [view.cancelBtn  setTitle:cancel forState:UIControlStateNormal];
    [view.sureBtn  setTitle:sureBtn forState:UIControlStateNormal];
    [superview addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(superview.mas_centerX);
        make.centerY.equalTo(superview.mas_centerY);
        make.width.offset(__kWidth *0.8);
    }];
    view.leftBlock = left;
    view.rightBlock = right;
    UIWindow *keyWindow      = [UIApplication sharedApplication].keyWindow;
    [UIView animateWithDuration:0.1 animations:^{
        [keyWindow addSubview:superview];
    } completion:^(BOOL finished) {
        
    }];
}
+(void)ShowPromptView:(NSString *)title leftBtnAction:(void (^)(void))left rightBtnAction:(void (^)(void))right{
    UIView *superview = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    superview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    TXJPromptView * view = [[[NSBundle mainBundle] loadNibNamed:@"TXJPromptView" owner:self options:nil] lastObject];
    view.TitleLab.attributedText = [TXJPromptView backattContentStr:title];
    [view.TitleLab sizeToFit];
    [superview addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(superview.mas_centerX);
        make.centerY.equalTo(superview.mas_centerY);
        make.width.offset(__kWidth *0.8);
    }];
    view.leftBlock = left;
    view.rightBlock = right;
    UIWindow *keyWindow      = [UIApplication sharedApplication].keyWindow;
    [UIView animateWithDuration:0.1 animations:^{
        [keyWindow addSubview:superview];
    } completion:^(BOOL finished) {
        
    }];
}
+(NSMutableAttributedString *)backattContentStr:(NSString *)title{
    NSMutableAttributedString *attContentStr = [[NSMutableAttributedString alloc] initWithString:title];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [paragraphStyle setLineSpacing:3];
    [attContentStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [title length])];
    return attContentStr;
}
- (IBAction)cancelBtnAction:(id)sender {
    [self remove];
    if (self.leftBlock) {
        self.leftBlock();
    }
}
- (IBAction)sureBtnAction:(id)sender {
    [self remove];
    if (self.rightBlock) {
        self.rightBlock();
    }
}
- (void) remove {
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self.superview removeFromSuperview];
    }];
}
@end
