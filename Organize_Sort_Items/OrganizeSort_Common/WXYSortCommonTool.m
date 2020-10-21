//
//  OrganizeSortTool.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import "WXYSortCommonTool.h"

@implementation WXYSortCommonTool

+ (NSArray <NSNumber *>*)tool_GetRandomNumSourceItemsWithCount:(NSInteger)count
{
    NSMutableArray <NSNumber *>*items = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        [items addObject:@(random() % 50)];
    }
    return items;
}

+ (NSString *)tool_GetRandomStringWithCount:(NSInteger)count
{
    NSMutableString *resultStr = [NSMutableString string];
    for (int i = 0; i < count; i++) {
        [resultStr appendString:WXYFormatterString(@"%@",[NSString stringWithFormat:@"%c", (int)random() % 128])];
    }
    return resultStr;
}

+ (NSString *)tool_GetRandomNumberStringWithCount:(NSInteger)count
{
    NSMutableString *resultStr = [NSMutableString string];
    for (int i = 0; i < count; i++) {
        [resultStr appendString:WXYFormatterString(@"%@",[NSString stringWithFormat:@"%c", (int)random() % 10 + 48])];
    }
    return resultStr;
}

+ (NSString *)tool_GetSomeSameCharWithCount:(NSInteger)count
{
    NSMutableString *resultStr = [NSMutableString string];
    for (int i = 0; i < count; i++) {
        [resultStr appendString:WXYFormatterString(@"%@",[NSString stringWithFormat:@"%c", (int)random() % 10 + 97])];
    }
    return resultStr;
}


+ (NSArray <NSNumber *>*)tool_GetOrderlyRandomNumSourceItemsWithCount:(NSInteger)count
{
    NSMutableArray <NSNumber *>*items = [NSMutableArray array];
    int baseNum = 1;
    for (int i = 0; i < count; i++) {
        baseNum = random() % 5 + baseNum;
        [items addObject:@(baseNum)];
    }
    return items;
}

int deduplicationList(int a[],int n)
{
    int toPos = 1;
    int fromPos = 1;
    int preNum = a[0];
    for (fromPos = 1; fromPos < n; fromPos++) {
        if(a[fromPos] != preNum)
        {
            a[toPos] = a[fromPos];
            preNum = a[fromPos];
            toPos++;
        }
    }
    return toPos;
}

+ (NSArray *)deduplicationWithList:(NSArray *)list
{
    int toPos = 1;
    int fromPos = 1;
    int preNum = [[list objectAtIndex:0] intValue];
    NSMutableArray *resultArray = list.mutableCopy;
    for (fromPos = 1; fromPos < list.count; fromPos++) {
        if([[list objectAtIndex:fromPos] intValue] != preNum)
        {
            [resultArray exchangeObjectAtIndex:toPos withObjectAtIndex:fromPos];
            preNum = [[list objectAtIndex:fromPos] intValue];
            toPos++;
        }
    }
    return [resultArray subarrayWithRange:NSMakeRange(0, toPos)];
}

char * deduplicationChar(char * _Nullable str){
    char *result = str;
    long len = strlen(str);
    int ascii[128] = {0};
    int p = 0;

    for (int i = 0; i < len; i++) {
        // str[i]就是取字符串中的字符，ascii[str[i]]就是取字符所对应的ascii码下标，如果为0，就说明还没有，那么设置为1，然后复制result
        if (ascii[str[i]] == 0) {
            ascii[str[i]] = 1;
            result[p++] = result[i];
        }
    }
    result[p] = '\0';
    return result;
}
@end
