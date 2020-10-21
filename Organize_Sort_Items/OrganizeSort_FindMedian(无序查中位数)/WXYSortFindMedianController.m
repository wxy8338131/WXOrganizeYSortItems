//
//  WXYSortFindMedianController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/21.
//

#import "WXYSortFindMedianController.h"
#import "WXYSortFindMedianModel.h"

@interface WXYSortFindMedianController ()

@end

@implementation WXYSortFindMedianController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"无序数组查找中位数";
}

#pragma mark  --  按钮事件  --

- (void)p_RandomBtnClicked {
    self.sourceItems = [WXYSortCommonTool tool_GetRandomNumSourceItemsWithCount:10];
    [self.sourceLabel setText:WXYFormatterString(@"无序数组@[ %@ ]",[self.sourceItems componentsJoinedByString:@","])];
    self.resultView.text = @"";
}

- (void)p_CalculationBtnClicked {
    if (!self.sourceItems.count) {
        [self showErrorSourceAlertController];
        return;
    }
    
    // 开始时间
    NSDate *startDate = [NSDate date];
    
    // 3. 将第一个数组转int数组
    int sourceLen = (int)self.sourceItems.count;
    int a[sourceLen];
    for (int i = 0; i < self.sourceItems.count; i++) {
        a[i] = [[self.sourceItems objectAtIndex:i] intValue];
    }
    
    int median = findMedian(a, sourceLen);
    
    // 结束时间
    NSDate *endDate = [NSDate date];
    
    [self.resultView setText:WXYFormatterString(@"耗时：%.8f\n结果：%d",
                                                [endDate timeIntervalSinceDate:startDate],
                                                median)];
}


@end
