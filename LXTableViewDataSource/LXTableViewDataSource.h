//
//  LXTableViewDataSource.h
//  LXTableViewDataSourceDemo
//
//  Created by liuxin on 16/5/6.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ LXCellConfigureBlock)(id cell , id item);

@interface LXTableViewDataSource : NSObject<UITableViewDataSource,UICollectionViewDataSource>

/**
 *  tableviewDataSource初始化方法
 *
 *  @param aCellIdentifier cellidentifier
 *  @param cellConfigBlock block（在block中配置cell）
 *
 *  @return 返回dataSource
 */
-(id)initWithCellIdentifier:(NSString *)aCellIdentifier cellConfigBlock:(LXCellConfigureBlock)cellConfigBlock;

/**
 *  添加model方法
 *
 *  @param items model数组
 */
-(void)addItems:(NSArray *)items;

/**
 *  获取model方法
 *
 *  @param indexPath tableview indexPath
 *
 *  @return 返回model
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;





@end
