//
//  UserTableViewCell.h
//  LXTableViewDataSourceDemo
//
//  Created by liuxin on 16/5/6.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;
@interface UserTableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *ageLabel;

@property (nonatomic,strong)User *user;
@end
