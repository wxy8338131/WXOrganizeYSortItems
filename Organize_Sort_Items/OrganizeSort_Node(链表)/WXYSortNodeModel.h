//
//  WXYSortNodeModel.h
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

struct Node {
    int age;
    char *name;
    struct Node *next;
};

@interface WXYSortNodeModel : NSObject

/// 随机创建一个链表
struct Node *constructList(void);

/// 反转链表
struct Node *reverseList(struct Node *head);

/// 打印链表中的数据
void logNodeList(struct Node *head);

/// 获取当前链表中的数据信息
char * nodeInfo(struct Node *head);

@end

NS_ASSUME_NONNULL_END
