//
//  WXYSortSameSuperViewModel.h
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXYSortSameSuperViewModel : NSObject

/// 查找共同的父视图
/// @param viewOne 第一个视图
/// @param otherView 另一个视图
+ (NSArray <UIView *>*)findCommonSuperView:(UIView *)viewOne otherView:(UIView *)otherView;

@end

NS_ASSUME_NONNULL_END
