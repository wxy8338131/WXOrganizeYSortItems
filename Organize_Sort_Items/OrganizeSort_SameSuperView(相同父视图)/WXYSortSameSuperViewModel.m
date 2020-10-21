//
//  WXYSortSameSuperViewModel.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import "WXYSortSameSuperViewModel.h"

@implementation WXYSortSameSuperViewModel

+ (NSArray <UIView *>*)findCommonSuperView:(UIView *)viewOne otherView:(UIView *)otherView
{
    NSMutableArray *result = [NSMutableArray array];
    // 查找第一个View的父类
    NSArray *arrayOne = [self findSuperView:viewOne];
    
    // 查找第二个View的父类
    NSArray *arrayTwo = [self findSuperView:otherView];
    
    
    int i = 0;
    
    while ( i < MIN((int)arrayOne.count, arrayTwo.count)) {
        // 倒叙方式获取各个视图的父视图
        UIView *superOne = [arrayOne objectAtIndex:arrayOne.count - 1 - i];
        UIView *superTwo = [arrayTwo objectAtIndex:arrayTwo.count - 1 - i];
        // 对比，如果相等则为共同父视图
        if (superOne == superTwo) {
            [result addObject:superOne];
            i++;
        }else{
            break;
        }
    }
    
    return result;
}


+ (NSArray <UIView *>*)findSuperView:(UIView *)view
{
    // 初始化第一父视图
    UIView *temp = view.superview;
    // 保存结果的数组
    NSMutableArray <UIView *>*result = [NSMutableArray array];
    while (temp) {
        [result addObject:temp];
        temp = temp.superview;
    }
    return result;
}


@end
