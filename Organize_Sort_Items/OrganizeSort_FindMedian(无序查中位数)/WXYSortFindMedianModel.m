//
//  WXYSortFindMedianModel.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/21.
//

#import "WXYSortFindMedianModel.h"

@implementation WXYSortFindMedianModel

int findMedian(int a[], int aLen)
{
    int low = 0;
    int high = aLen - 1;
    
    int mid = (aLen - 1) / 2;
    int div = PartSort(a, low, high);
    
    while (div != mid) {
        if (mid < div) {
            // 左半区间栈
            div = PartSort(a, low, high);
        }
        else{
            // 右半区间栈
            div = PartSort(a, div + 1, high);
        }
    }
    
    // 找到了
    return a[mid];
}

int PartSort(int a[], int start, int end)
{
    int low = start;
    int high = end;
    
    // 选取关键字
    int key = a[end];
    while (low < high) {
        // 左边找比Key答的值
        while (low < high && a[low] <= key) {
            ++low;
        }
        while (low < high && a[high] >= key) {
            --high;
        }
        if (low < high) {
            // 找到之后交换左右的值
            int temp = a[low];
            a[low] = a[high];
            a[high] = temp;
        }
    }
    int temp = a[high];
    a[high] = a[end];
    a[end] = temp;
    
    return low;
}


@end
