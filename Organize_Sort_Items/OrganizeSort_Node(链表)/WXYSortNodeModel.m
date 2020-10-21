
//
//  WXYSortNodeModel.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import "WXYSortNodeModel.h"

@implementation WXYSortNodeModel

// 创建一个链表
struct Node* constructList(void)
{
    // 头结点定义
    struct Node *head = NULL;
    // 记录当前尾结点
    struct Node *cur = NULL;
    char *names[5] = {"Tom","Jack","Rose","Lily","Tony"};
    // 创建链表节点
    for (int i = 1; i < 6; i++) {
        struct Node *node = malloc(sizeof(struct Node));
        node->age = i;
        node->name = names[i - 1];
        node->next = NULL;

        // 头结点为空，新节点即为头结点
        if (head == NULL) {
            head = node;
        }
        else{
            // 记录当前节点的下一个节点
            cur->next = node;
        }
        // 记录尾结点
        cur = node;
    }
    return head;
}

// 反转链表
struct Node* reverseList(struct Node *head)
{
    // 定义遍历指针，初始化为头部指针
    struct Node *p = head;
    // 反转后的链表头部为NULL
    struct Node *NewHead = NULL;
    
    // 遍历链表
    while (p != NULL) {
        
        // 记录下一个节点
        struct Node *temp = p->next;
        // 当前节点的next指向新链表的头部
        p->next = NewHead;
        // 更改新链表头部为当前节点
        NewHead = p;
        // 移动p指针
        p = temp;
    }
    
    return NewHead;
}

void logNodeList(struct Node *head)
{
    struct Node *temp = head;
    while (temp != NULL) {
        printf("node name:%s ,age :%d\n",temp->name,temp->age);
        temp = temp->next;
    }
}

char * nodeInfo(struct Node *head)
{
    char *nodeInfo = (char *) malloc(300);
    struct Node *temp = head;
    while (temp != NULL) {
        sprintf(nodeInfo, "%s 第%d个节点：name：%s ，age：%d\n", nodeInfo,temp->age, temp->name, temp->age);
        temp = temp->next;
    }
    return nodeInfo;
}


@end
