//
//  WXYSortHashModel.h
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXYSortHashModel : NSObject

/// 查找第一个出现Count此的字符
/// @param cha 要查找的字符串 
/// @param count 出现次数，要查找出现几次的字符
char findFirstChar(char* cha, int count);

@end

NS_ASSUME_NONNULL_END
