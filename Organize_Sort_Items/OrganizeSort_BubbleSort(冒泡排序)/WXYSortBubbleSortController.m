//
//  WXYSortBubbleSortController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import "WXYSortBubbleSortController.h"
#import "WXYSortBubbleSort.h"

@interface WXYSortBubbleSortController ()

@end

@implementation WXYSortBubbleSortController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"冒泡排序";
}

#pragma mark  --  按钮事件  --

- (void)p_RandomBtnClicked {
    self.sourceItems = [WXYSortCommonTool tool_GetRandomNumSourceItemsWithCount:10];
    [self.sourceLabel setText:WXYFormatterString(@"@[ %@ ]",[self.sourceItems componentsJoinedByString:@","])];
    self.resultView.text = @"";
}

- (void)p_CalculationBtnClicked {
    if (!self.sourceItems.count) {
        [self showErrorSourceAlertController];
        return;
    }
    self.randomSourceBtn.userInteractionEnabled = NO;
    self.calculationBtn.userInteractionEnabled = NO;
    __weak typeof(self) weakSelf = self;
    NSDate *startDate = [NSDate date];
    [WXYSortBubbleSort sort_BubbleSort:self.sourceItems FinishBlock:^(NSInteger totalCount, NSInteger forCount, NSArray * _Nonnull resultItems) {
        weakSelf.randomSourceBtn.userInteractionEnabled = YES;
        weakSelf.calculationBtn.userInteractionEnabled = YES;

        NSDate *endDate = [NSDate date];
        [weakSelf.resultView setText:WXYFormatterString(@"内部循环:%zd次\n共循环:%zd次\n耗时:%.8f秒\n结果:@[ %@ ]",
                                                        forCount,
                                                        totalCount,
                                                        [endDate timeIntervalSinceDate:startDate],
                                                        [resultItems componentsJoinedByString:@","])];
    }];
}

@end
