//
//  ModelStore.m
//  LXTableViewDataSourceDemo
//
//  Created by liuxin on 16/5/9.
//  Copyright © 2016年 liuxin. All rights reserved.
////在这一层对数据进行管理(网络请求，数据存储等)

#import "ModelStore.h"
#import "User.h"
#import "Goods.h"
@implementation ModelStore

#pragma mark ---User----
+(NSMutableArray *)getUserArray{
    
    NSMutableArray *array=[[NSMutableArray alloc] init];
    for (int i = 0; i<10; i++) {
        User *user=[[User alloc] init];
        user.name=@"a";
        user.age=@(10+i);
        
        [array addObject:user];
    }
    
    return array;
}

+(NSMutableArray *)refreshData{
    NSMutableArray *array=[[NSMutableArray alloc] init];
    for (int i = 0; i<10; i++) {
        User *user=[[User alloc] init];
        user.name=@"b";
        user.age=@(100+i);
        
        [array addObject:user];
    }
    
    return array;
}

+(NSMutableArray *)loadMoreData{
    NSMutableArray *array=[[NSMutableArray alloc] init];
    for (int i = 0; i<1; i++) {
        User *user=[[User alloc] init];
        user.name=@"c";
        user.age=@(1000+i);
        
        [array addObject:user];
    }
    
    return array;
}

#pragma mark -----Goods------
+(NSMutableArray *)getGoodsArray{
    NSMutableArray *array=[[NSMutableArray alloc] init];
    NSString *str=@"3D Touch、1200 万像素照片、4K 视频，强大功能集于一身。";
    NSString *str1=@"";
    for (int i = 0; i<10; i++) {
        str1=[str1 stringByAppendingString:str];

        Goods *goods=[[Goods alloc] init];
        goods.name=[NSString stringWithFormat:@"iPhone 6s , %d",i];
        goods.introduction=str1;
        [array addObject:goods];
    }
    
    return array;
}







@end
