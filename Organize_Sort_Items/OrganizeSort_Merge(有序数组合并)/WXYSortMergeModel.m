//
//  WXYSortMergeModel.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import "WXYSortMergeModel.h"

@implementation WXYSortMergeModel

+ (NSArray *)mergeWithList:(NSArray *)list otherList:(NSArray *)otherList
{
    // 1. 定义两个变量为两个List的首个下标
    int p = 0,q =0;
    
    // 2. 定义合并后数组的元素下标索引
    int i = 0;
    
    NSMutableArray *resultList = [NSMutableArray array];
    // 3. 循环根据下标索引 取出对应的值来判断大小并插入
    while (p < list.count && q < otherList.count) {
        if ([list[p] intValue] > [otherList[q] intValue]) {
            [resultList addObject:[NSNumber numberWithInt:[otherList[q] intValue]]];
            q++;
        }else{
            [resultList addObject:[NSNumber numberWithInt:[list[p] intValue]]];
            p++;
        }
        i++;
    }
    
    while (p < list.count) {
        [resultList addObject:[NSNumber numberWithInt:[list[p] intValue]]];
        p++;
        i++;
    }
    while (q < otherList.count) {
        [resultList addObject:[NSNumber numberWithInt:[otherList[q] intValue]]];
        q++;
        i++;
    }
    return resultList;
}

void mergeList(int a[], int alen, int b[], int blen, int result[])
{
    // 1. 定义两个变量为两个List的首个下标
    int p = 0,q =0;
    
    // 2. 定义合并后数组的元素下标索引
    int i = 0;
    
    // 3. 循环根据下标索引 取出对应的值来判断大小并插入
    while (p < alen && q < blen) {
        if (a[p] > b[q]) {
            result[i] = b[q];
            q++;
        }else{
            result[i] = a[p];
            p++;
        }
        i++;
    }
    
    while (p < alen) {
        result[i] = a[p];
        p++;
        i++;
    }
    while (q < blen) {
        result[i] = b[q];
        q++;
        i++;
    }
}


@end
