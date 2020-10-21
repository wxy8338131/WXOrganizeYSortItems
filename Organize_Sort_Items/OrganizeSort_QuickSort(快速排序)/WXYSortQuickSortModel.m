

//
//  WXYSortQuickSortModel.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import "WXYSortQuickSortModel.h"

@implementation WXYSortQuickSortModel

void quicksSort(int *a,int left,int right) {

    if(left >= right){
        return;
    }
    int i = left;
    int j = right;
    int key = a[left];
    while (i < j) {
        while (i < j && key >= a[j]) {
            j--;
        }
        a[i] = a[j];

        while (i < j && key <= a[i]) {
            i++;
        }
        a[j] = a[i];
    }

    a[i] = key;
    quicksSort(a, left, i-1);
    quicksSort(a, i+1, right);
}

//给快速排序方法连个参数,开始位置(左),和结束位置(右)
+ (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex
{
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return ;
    }
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];
    
    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        if (i != j) {
            array[i] = array[j];
        }
        
        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        if (i != j) {
            array[j] = array[i];
        }
        
    }
    
    //将基准数放到正确位置
    array[i] = @(key);
    
    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
}


@end
