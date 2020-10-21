//
//  WXYSortBubbleSort.h
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXYSortBubbleSort : NSObject

/// 冒泡排序
/// @param source 需要排序的数据源
/// @param FinishBlock 排序完成后的回调
+ (void)sort_BubbleSort:(NSArray *)source FinishBlock:(void(^)(NSInteger totalCount, NSInteger forCount, NSArray *resultItems))FinishBlock;

@end

NS_ASSUME_NONNULL_END
