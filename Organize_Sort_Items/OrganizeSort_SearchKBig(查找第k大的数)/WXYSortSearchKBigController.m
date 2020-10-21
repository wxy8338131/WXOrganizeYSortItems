//
//  WXYSortSearchKBigController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/21.
//

#import "WXYSortSearchKBigController.h"
#import "WXYSortQuickSortModel.h"

@interface WXYSortSearchKBigController ()

@end

@implementation WXYSortSearchKBigController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"求数组中第k大的数";
    [self.sourceLabel setFont:[UIFont systemFontOfSize:14]];
    [self.calculationBtn setTitle:@"排序、去重、取第K大的数" forState:UIControlStateNormal];
}

#pragma mark  --  按钮事件  --

- (void)p_RandomBtnClicked {
    self.sourceItems = [WXYSortCommonTool tool_GetRandomNumSourceItemsWithCount:10];
    [self.sourceLabel setText:WXYFormatterString(@"从[ %@ ]中找出第3大的数",[self.sourceItems componentsJoinedByString:@","])];
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
    
    // 快排排序
    quicksSort(a, 0, sourceLen - 1);
    
    // 排序结果转array
    NSMutableArray *quicksSortArray = [NSMutableArray arrayWithCapacity:sourceLen];
    for (int i = 0; i < sourceLen; i++) {
        [quicksSortArray addObject:[NSNumber numberWithInt:a[i]]];
    }
    
    // 去重
    int deduplicLen = deduplicationList(a, sourceLen);
    
    // 去重后结果
    NSMutableArray *deduplicArray = [NSMutableArray arrayWithCapacity:deduplicLen];
    for (int i = 0; i < deduplicLen; i++) {
        [deduplicArray addObject:[NSNumber numberWithInt:a[i]]];
    }
    
    // 取出第三大的数
    int kMax = [[deduplicArray objectAtIndex:2] intValue];
    
    // 结束时间
    NSDate *endDate = [NSDate date];
    
    [self.resultView setText:WXYFormatterString(@"耗时：%.8f\n排序后:[ %@ ]\n去重后:[ %@ ]\n结果：%d",
                                                [endDate timeIntervalSinceDate:startDate],
                                                [quicksSortArray componentsJoinedByString:@","],
                                                [deduplicArray componentsJoinedByString:@","],
                                                kMax)];
}

@end
