//
//  WXYSortQuickSortModel.h
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXYSortQuickSortModel : NSObject

void quicksSort(int *a,int left,int right);
+ (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex;

@end

NS_ASSUME_NONNULL_END
