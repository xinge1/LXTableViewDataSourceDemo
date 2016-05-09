//
//  ModelStore.h
//  LXTableViewDataSourceDemo
//
//  Created by liuxin on 16/5/9.
//  Copyright © 2016年 liuxin. All rights reserved.
//
//在这一层对数据进行管理
#import <Foundation/Foundation.h>

@interface ModelStore : NSObject

+(NSMutableArray *)getUserArray;

+(NSMutableArray *)refreshData;

+(NSMutableArray *)loadMoreData;


+(NSMutableArray *)getGoodsArray;
@end
