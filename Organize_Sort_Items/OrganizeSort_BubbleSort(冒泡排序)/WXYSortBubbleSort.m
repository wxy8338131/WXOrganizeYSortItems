//
//  WXYSortBubbleSort.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import "WXYSortBubbleSort.h"

@implementation WXYSortBubbleSort

#pragma mark  --  冒泡排序  --

+ (void)sort_BubbleSort:(NSArray *)source FinishBlock:(void(^)(NSInteger totalCount, NSInteger forCount, NSArray *resultItems))FinishBlock
{
    int count  = 0;
    int forcount  = 0;
    NSMutableArray * arr = source.mutableCopy;
    
    for (int i = 0; i < arr.count; i++) {
        forcount++;
        // 依次定位左边的
        for (int j = (int)arr.count-1; j > i; j--) {
            count++;
            if ([arr[j - 1] intValue] > [arr[j] intValue]) {
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            }
        }
    }
    if (FinishBlock) {
        FinishBlock(count, forcount, arr);
    }
}

@end
