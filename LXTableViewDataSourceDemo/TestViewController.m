//
//  TestViewController.m
//  LXTableViewDataSourceDemo
//
//  Created by liuxin on 16/5/9.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import "TestViewController.h"
#import "ModelStore.h"
#import "LXTableViewDataSource.h"
#import "GoodsTableViewCell.h"
#import "Goods.h"

#import "UITableView+SDAutoTableViewCellHeight.h"

static NSString *const cellId=@"goodsCell";

@interface TestViewController ()<UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)LXTableViewDataSource *dataSource;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self initTable];
    
}

-(void)initData{
    _dataArray=[[NSMutableArray alloc] init];
    
    _dataArray=[ModelStore getGoodsArray];
}

-(void)initTable{
    self.dataSource=[[LXTableViewDataSource alloc] initWithCellIdentifier:cellId cellConfigBlock:^(GoodsTableViewCell *cell, Goods *item) {
        cell.goods=item;
    }];
    [self.dataSource addItems:_dataArray];
    
    UITableView *table=[[UITableView alloc] initWithFrame:self.view.frame];
    table.delegate=self;
    table.dataSource=self.dataSource;
    [table registerClass:[GoodsTableViewCell class] forCellReuseIdentifier:cellId];
    [self.view addSubview:table];
    
}


#pragma mark --UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [tableView cellHeightForIndexPath:indexPath model:_dataArray[indexPath.row] keyPath:@"Goods" cellClass:[GoodsTableViewCell class] contentViewWidth:[self cellContentViewWith]];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Goods *goods=[self.dataSource itemAtIndexPath:indexPath];
    NSLog(@"------%@",goods.introduction);
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
