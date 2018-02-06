//
//  googsTableViewCell.m
//  第三方相关
//
//  Created by bang on 2018/2/5.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "googsTableViewCell.h"
@interface googsTableViewCell(){
    NSUInteger numberr;
    NSInteger sum;
    
}
@property(nonatomic,strong)NSTimer *timer;
@end
@implementation googsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    numberr =  [self.number.text integerValue];
    sum += [self.number.text integerValue];
    
}
-(void)sumber{
    
    if ([self.delegate respondsToSelector:@selector(jsuannumber:)]) {
        [self.delegate jsuannumber:sum];
    }
    
}

- (IBAction)delete:(id)sender {
   
    if (numberr<=1) {
        
    }else{
        numberr--;
        self.number.text = [NSString stringWithFormat:@"%lu",numberr];
        /* 取消上次点击的延时操作
        
        [[NSRunLoop currentRunLoop] cancelPerformSelector:@selector(deletegoods) target:self argument:nil];
                [self.timer invalidate];
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:3.0]
                                              interval:0 target:self selector:@selector(deletegoods) userInfo:nil repeats:NO];
                [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        */
        [self deletegoods];
    }
    
    
}
-(void)deletegoods{
    
    if ([self.delegate respondsToSelector:@selector(changendeleteumber:Cell:)]) {
        [self.delegate changendeleteumber:self.number.text Cell:self];
    }
}
- (IBAction)add:(id)sender {
    
    if (numberr>=99) {
        
    }else{
        numberr++;
        self.number.text = [NSString stringWithFormat:@"%lu",numberr];
        /* 取消上次点击的延时操作
        
        
        [[NSRunLoop currentRunLoop] cancelPerformSelector:@selector(addgoods) target:self argument:nil];
        [self.timer invalidate];
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:3.0]
                                              interval:0 target:self selector:@selector(addgoods) userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        */
        [self addgoods];
        
    }
    
    
}
-(void)addgoods{
    
    if ([self.delegate respondsToSelector:@selector(changenaddumber:Cell:)]) {
        [self.delegate changenaddumber:self.number.text Cell:self];
    }
    }
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
