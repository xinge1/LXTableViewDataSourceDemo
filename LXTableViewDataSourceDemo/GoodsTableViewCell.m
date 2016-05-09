//
//  GoodsTableViewCell.m
//  LXTableViewDataSourceDemo
//
//  Created by liuxin on 16/5/9.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import "GoodsTableViewCell.h"
#import "Goods.h"

#import "UIView+SDAutoLayout.h"

#import "UILabel+LXAdd.h"

@interface GoodsTableViewCell ()
@end


@implementation GoodsTableViewCell

-(void)setGoods:(Goods *)goods{
    self.nameLab.text=goods.name;
    self.introductionLab.text=goods.introduction;
    
    CGSize size=[self.introductionLab getLableSizeWithMaxWidth:self.contentView.bounds.size.width-40];

    self.nameLab.sd_layout.leftSpaceToView(self.contentView,20).topSpaceToView(self.contentView,10).widthIs(200).heightIs(20);
    self.introductionLab.sd_layout.leftEqualToView(self.nameLab).topSpaceToView(self.nameLab,5).rightSpaceToView(self.contentView,20).heightIs(size.height);
    [self setupAutoHeightWithBottomView:self.introductionLab bottomMargin:10];
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.introductionLab];

    }
    
    return self;
}

-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab=[[UILabel alloc] init];
        _nameLab.textColor=[UIColor brownColor];
    }
    return _nameLab;
}

-(UILabel *)introductionLab{
    if (!_introductionLab) {
        _introductionLab=[[UILabel alloc] init];
        _introductionLab.textColor=[UIColor lightGrayColor];
        _introductionLab.font=[UIFont systemFontOfSize:15];
        _introductionLab.numberOfLines=0;
        _introductionLab.lineSpace=10.0f;
        _introductionLab.characterSpace=3.0f;
    }
    return _introductionLab;
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
