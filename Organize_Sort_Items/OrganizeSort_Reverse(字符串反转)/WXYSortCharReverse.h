//
//  WXYSortCharReverse.h
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXYSortCharReverse : NSObject

void charReverse(char *info);
+ (void)reverse:(NSString *)info FinishBlock:(void(^)(NSInteger totalWhile, NSString *resultStr))FinishBlock;

@end


NS_ASSUME_NONNULL_END
