//
//  UserTableViewCell.m
//  LXTableViewDataSourceDemo
//
//  Created by liuxin on 16/5/6.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import "UserTableViewCell.h"
#import "User.h"

@implementation UserTableViewCell


-(void)setUser:(User *)user{
    self.nameLabel.text=user.name;
    self.ageLabel.text=[NSString stringWithFormat:@"%@",user.age];

}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.ageLabel];
    }
    return self;
}


-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel=[[UILabel alloc] init];
        _nameLabel.frame=CGRectMake(10, 5, 100, 30);
        _nameLabel.textColor=[UIColor redColor];
    }
    return _nameLabel;
}

-(UILabel *)ageLabel{
    if (!_ageLabel) {
        _ageLabel=[[UILabel alloc] init];
        _ageLabel.frame=CGRectMake(120, 5, 100, 30);
        _ageLabel.textColor=[UIColor redColor];
    }
    return _ageLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
