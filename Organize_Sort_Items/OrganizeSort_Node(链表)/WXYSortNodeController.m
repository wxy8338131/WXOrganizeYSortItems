
//
//  WXYSortNodeController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import "WXYSortNodeController.h"
#import "WXYSortNodeModel.h"

@interface WXYSortNodeController () {
    struct Node* head;
}

@end

@implementation WXYSortNodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"链表操作";
    [self.sourceLabel setHeight:120];
    [self.sourceLabel setNumberOfLines:0];
    [self.sourceLabel setTextAlignment:NSTextAlignmentLeft];
    [self.calculationBtn setY:self.sourceLabel.bottom + 20.0f];
    [self.resultView setY:self.calculationBtn.bottom + 20.0f];
    [self.calculationBtn setTitle:@"链表反转" forState:UIControlStateNormal];
    [self.randomSourceBtn setTitle:@"生成5个节点的链表" forState:UIControlStateNormal];
}


#pragma mark  --  按钮事件  --

- (void)p_RandomBtnClicked {
    head = constructList();
    [self.sourceLabel setText:[NSString stringWithUTF8String:nodeInfo(head)]];
    self.resultView.text = @"";
}

- (void)p_CalculationBtnClicked {
    if (!head) {
        [self showErrorSourceAlertController];
        return;
    }
    
    // 起始时间
    NSDate *startDate = [NSDate date];
    
    // 反转链表
    head = reverseList(head);

    // 结束时间
    NSDate *endDate = [NSDate date];
    
    // 展示信息
    [self.resultView setText:WXYFormatterString(@"耗时:%.4f秒\n结果:\n%@",[endDate timeIntervalSinceDate:startDate], [NSString stringWithUTF8String:nodeInfo(head)])];
}

@end
