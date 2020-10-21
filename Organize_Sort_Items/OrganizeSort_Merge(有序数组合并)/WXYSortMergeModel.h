//
//  WXYSortMergeModel.h
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXYSortMergeModel : NSObject

/// 数组合并
/// @param alen 第一个数组长度
/// @param blen 另一个数组长度
void mergeList(int a[_Nullable], int alen, int b[_Nullable], int blen, int result[_Nullable]);

/// 形参为对象的数组合并
/// @param list 第一个数组
/// @param otherList 另一个数组
+ (NSArray *)mergeWithList:(NSArray *)list otherList:(NSArray *)otherList;

@end

NS_ASSUME_NONNULL_END
