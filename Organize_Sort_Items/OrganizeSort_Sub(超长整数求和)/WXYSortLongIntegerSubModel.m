//
//  WXYSortLongIntegerSubModel.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/21.
//

#import "WXYSortLongIntegerSubModel.h"

@implementation WXYSortLongIntegerSubModel


char * longInterSub(const char *subOne, const char *subOther) {
    
    // 1. 获取字符串长度
    int subFirLen = (int)strlen(subOne);
    int subSecLen = (int)strlen(subOther);
    int maxLen = subFirLen > subSecLen ? subFirLen : subSecLen;
    
    // 3. 初始化指针，指向第个位
    int f = subFirLen - 1;
    int s = subSecLen - 1;
    int i = 0;  // 作为循环索引
    
    // 4. 循环计算
    bool isNeedCarry = false;
    int result[maxLen];
    while (f >= 0 && s >= 0) {
        // 取出两个字符串的个位的数值
        int one = subOne[f--] - 48;
        int other = subOther[s--] - 48;
        int sub = one + other;
        if (isNeedCarry) {
            sub = sub + 1;
        }
        if (sub >= 10) {
            isNeedCarry = true;
            result[i++] = sub % 10;
        }else{
            isNeedCarry = false;
            result[i++] = sub;
        }
    }
    while (f >= 0) {
        int num = subOne[f--] - 48;
        if (isNeedCarry) {
            num += 1;
        }
        if (num >= 10) {
            result[i++] = num % 10;
            isNeedCarry = true;
        }else{
            result[i++] = num;
            isNeedCarry = false;
        }
    }
    while (s >= 0) {
        int num = subOther[s--] - 48;
        if (isNeedCarry) {
            num += 1;
        }
        if (num >= 10) {
            result[i++] = num % 10;
            isNeedCarry = true;
        }else{
            result[i++] = num;
            isNeedCarry = false;
        }
    }
    
    // 如果最后一次计算是需要进位的，那么最后再补一个1，如果不需要就i--，i就是最终的长度
    if (isNeedCarry) {
        result[i] = 1;
    }else{
        i--;
    }
    
    // 实例化返回字符串
    char *str = (char *)malloc(i);
    
    for (i = i; i >= 0; i--) {
        sprintf(str, "%s%x", str,result[i]);
    }
    return str;
}


@end
