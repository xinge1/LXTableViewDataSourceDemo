//
//  ViewController.m
//  LXTableViewDataSourceDemo
//
//  Created by liuxin on 16/5/6.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import "ViewController.h"
#import "LXTableViewDataSource.h"
#import "UserTableViewCell.h"

#import "MJRefresh.h"

#import "ModelStore.h"
#import "User.h"

#import "TestViewController.h"

static NSString * const cellIdentifier = @"UserCell";

@interface ViewController ()<UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)LXTableViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initData];
    
    [self initTable];
    
    
}

-(void)initData{
    _dataArray=[[NSMutableArray alloc] init];
    
    _dataArray=[ModelStore getUserArray];
}

-(void)initTable{
    self.dataSource=[[LXTableViewDataSource alloc] initWithCellIdentifier:cellIdentifier cellConfigBlock:^(UserTableViewCell *cell, User *item) {
        cell.user=item;
    }];
    [self.dataSource addItems:_dataArray];
    
    UITableView *table=[[UITableView alloc] initWithFrame:self.view.frame];
    table.delegate=self;
    table.dataSource=self.dataSource;
    [table registerClass:[UserTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:table];
    
    
    table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        if (_dataArray) {
            [_dataArray removeAllObjects];
        }

        _dataArray=[ModelStore refreshData];
        
        [self.dataSource addItems:_dataArray];
        [table reloadData];
        [table.mj_header endRefreshing];
    }];

    
    table.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [_dataArray addObjectsFromArray:[ModelStore loadMoreData]];
        
        [self.dataSource addItems:_dataArray];
        [table reloadData];
        [table.mj_footer endRefreshing];
        
    }];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    User *user=[self.dataSource itemAtIndexPath:indexPath];
    NSLog(@"点击了--%ld,%@",indexPath.row,user.age);
    
    TestViewController *testVc=[[TestViewController alloc] init];
    [self.navigationController pushViewController:testVc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
