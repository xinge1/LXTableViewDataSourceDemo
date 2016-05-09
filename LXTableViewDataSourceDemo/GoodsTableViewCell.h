//
//  GoodsTableViewCell.h
//  LXTableViewDataSourceDemo
//
//  Created by liuxin on 16/5/9.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Goods;
@interface GoodsTableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel *nameLab;
@property (nonatomic,strong)UILabel *introductionLab;

@property (nonatomic,strong)Goods *goods;
@end
