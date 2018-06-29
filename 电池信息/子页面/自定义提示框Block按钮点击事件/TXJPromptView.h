//
//  TXJPromptView.h
//  UUIDTest
//
//  Created by 谭显敬 on 2018/6/29.
//  Copyright © 2018年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^BlockLeftAction)(void);
typedef void (^BlockRightAction)(void);
@interface TXJPromptView : UIView
@property (weak, nonatomic) IBOutlet UILabel *TitleLab;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (copy, nonatomic) BlockLeftAction leftBlock;
@property (copy, nonatomic) BlockRightAction rightBlock;
+(void)ShowPromptView:(NSString *)title cancelBtnTitle:(NSString *)cancel sureBtnTitle:(NSString *)sureBtn leftBtnAction:(void (^)(void))left rightBtnAction:(void (^)(void))right;
+(void)ShowPromptView:(NSString *)title leftBtnAction:(void (^)(void))left rightBtnAction:(void (^)(void))right;
@end
