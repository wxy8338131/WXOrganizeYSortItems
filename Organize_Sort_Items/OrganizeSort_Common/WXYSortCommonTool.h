//
//  OrganizeSortTool.h
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXYSortCommonTool : NSObject

/// 获取随机数据源
/// @param count 数据源元素个数
+ (NSArray <NSNumber *>*)tool_GetRandomNumSourceItemsWithCount:(NSInteger)count;

/// 获取随机的数字字符串
/// @param count 随机长度
+ (NSString *)tool_GetRandomNumberStringWithCount:(NSInteger)count;

/// 获取有一些相同字符的随机字符串
/// @param count 字符串长度
+ (NSString *)tool_GetSomeSameCharWithCount:(NSInteger)count;

/// 获取一个指定长度的随机字符串
/// @param count 长度
+ (NSString *)tool_GetRandomStringWithCount:(NSInteger)count;

/// 获取有序的随机数据源
/// @param count 数据源元素个数
+ (NSArray <NSNumber *>*)tool_GetOrderlyRandomNumSourceItemsWithCount:(NSInteger)count;

/// 有序数组去重
/// @param n 数组的长度
int deduplicationList(int a[_Nullable],int n);

/// 形参为对象的有序数组去重
/// @param list 要去重的数组
+ (NSArray *)deduplicationWithList:(NSArray *)list;

/// 删除字符串中重复字符
/// @param str 要过滤的字符串
char * deduplicationChar(char * _Nullable str);

@end

NS_ASSUME_NONNULL_END
