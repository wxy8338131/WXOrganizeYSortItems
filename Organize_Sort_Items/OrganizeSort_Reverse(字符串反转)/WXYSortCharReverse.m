//
//  WXYSortCharReverse.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import "WXYSortCharReverse.h"

@implementation WXYSortCharReverse

void charReverse(char *info) {
    // 1. 实例化指针指向第一个字符和最后一个字符
    char *first = info;
    char *last = info + strlen(info) - 1;
    
    // 2. 循环调换位置
    while (first < last) {
        char temp = *first;
        *(first++) = *last;
        *(last--) = temp;
    }
}

+ (void)reverse:(NSString *)info FinishBlock:(void(^)(NSInteger totalWhile, NSString *resultStr))FinishBlock{
    NSMutableString *resultStr = info.mutableCopy;
    int first = 0;
    int last = (int)resultStr.length - 1;
    int totalWhile = 0;
    while (first < last) {
        NSString *temp = [resultStr substringWithRange:NSMakeRange(last, 1)];
        [resultStr replaceCharactersInRange:NSMakeRange(last, 1) withString:[resultStr substringWithRange:NSMakeRange(first, 1)]];
        [resultStr replaceCharactersInRange:NSMakeRange(first, 1) withString:temp];
        totalWhile ++;
        first++;
        last--;
    }
    if (FinishBlock) {
        FinishBlock(totalWhile,resultStr);
    }
}


@end
