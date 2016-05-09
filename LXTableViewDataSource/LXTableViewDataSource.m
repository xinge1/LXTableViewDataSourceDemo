//
//  LXTableViewDataSource.m
//  LXTableViewDataSourceDemo
//
//  Created by liuxin on 16/5/6.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import "LXTableViewDataSource.h"

@interface LXTableViewDataSource ()
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) LXCellConfigureBlock configureCellBlock;
@end

@implementation LXTableViewDataSource

-(id)initWithCellIdentifier:(NSString *)aCellIdentifier cellConfigBlock:(LXCellConfigureBlock)cellConfigBlock
{
    
    
    self = [super init];
    if (self) {
        self.cellIdentifier=aCellIdentifier;
        self.configureCellBlock=[cellConfigBlock copy];
    }
  
    return self;
}

-(void)addItems:(NSArray *)items{
    if (self.items) {
        [self.items removeAllObjects];
    }
    [self.items addObjectsFromArray:items];
}

-(NSMutableArray *)items{
    if (!_items) {
        _items=[[NSMutableArray alloc] init];
    }
    return _items;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    return [self.items objectAtIndex:indexPath.row];
}

#pragma mark ---UITableViewDataSource----
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    
    
    id item = [self itemAtIndexPath:indexPath];
    if (self.configureCellBlock) {
        self.configureCellBlock(cell,item);
    }
    
    
    return cell;
}


#pragma mark ---UICollectionViewDataSource----
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];

    if (self.configureCellBlock) {
        self.configureCellBlock(cell,item);
    }

    return cell;
}

@end
