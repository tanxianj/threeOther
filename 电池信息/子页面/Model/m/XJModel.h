//
//  XJModel.h
//  电池信息
//
//  Created by MAc on 2017/12/1.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJModel : NSObject<MJKeyValue>
/**
 "gd_id": "29",
 "gd_name": "如果的世界首充最高有充值800的额，能不能拿到看你运气了",
 "gd_thumb": "http://www.le173.com/img/gd_img/201611/14/c3b3d109fca995699c43072f62388672.jpg",
 "gd_price": "13",
 "gd_img": "http://www.le173.com/img/gd_img/201611/14/cfef82ac72f671a1d66243cda5f58a7e.jpg",
 "gd_desc": "最高有充值800的额，能不能拿到看你运气了\n\n必须绑定手机号码才可以额，每个账号限领一次\n\n账号格式 区服 前面是账号／后面是密码",
 "gd_purchs": "0",
 "gd_total": "9",
 "gd_remain": 9
 */
@property(nonatomic,strong)NSString *gd_id;
@property(nonatomic,strong)NSString *gd_name;
@property(nonatomic,strong)NSString *gd_thumb;
@property(nonatomic,strong)NSString *gd_price;
@property(nonatomic,strong)NSString *gd_img;
@property(nonatomic,strong)NSString *gd_desc;
@property(nonatomic,strong)NSString *gd_purchs;
@property(nonatomic,strong)NSString *gd_total;
@property(nonatomic,strong)NSString *gd_remain;

@end
