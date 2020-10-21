
//
//  WXYSortHashModel.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import "WXYSortHashModel.h"

@implementation WXYSortHashModel

char findFirstChar(char* cha, int count)
{
    char result = '\0';
    // 定义一个数组 用来存储各个字母出现次数
    int array[256];
    for (int i = 0; i < 256; i++) {
        array[i] = 0;
    }
    
    // 定义一个指针。指向当前字符串头部
    char* p = cha;
    
    // 遍历每个字符
    while (*p != '\0') {
        // 在字母对应存储位置 进行出现次数+1操作
        array[*(p++)]++;
    }
    
    // 将p指针重新指向字符串头部
    p = cha;
    
    // 遍历每个字母的出现次数
    while (*p != '\0') {
        // 遇到第一个出现次数为1的字符，打印结果
        if (array[*p] == count) {
            result = *p;
            break;
        }
        // 反之继续向后遍历
        p++;
    }
    return result;
}

@end
