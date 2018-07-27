//
//  RacTwoViewController.h
//  
//
//  Created by 谭显敬 on 2018/7/2.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "Super_ViewController.h"

@interface RacTwoViewController : Super_ViewController
@property (weak, nonatomic) IBOutlet UITextField *TextFiled;
@property (weak, nonatomic) IBOutlet UIButton *popBtn;
@property (nonatomic,strong)RACSubject * btnClickSignal;
@end
