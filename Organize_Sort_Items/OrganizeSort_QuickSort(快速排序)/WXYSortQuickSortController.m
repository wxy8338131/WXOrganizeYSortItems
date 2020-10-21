//
//  WXYSortQuickSortController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import "WXYSortQuickSortController.h"
#import "WXYSortQuickSortModel.h"

@interface WXYSortQuickSortController ()

@property (nonatomic, strong) UIButton *deduplicationBtn;

@end

@implementation WXYSortQuickSortController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"快速排序";
    [self.calculationBtn setTitle:@"快速排序" forState:UIControlStateNormal];
    [self.calculationBtn setFrame:CGRectMake(20, self.sourceLabel.bottom + 20.0f, SCREEN_WIDTH / 2 - 40, 40.0f)];
    [self.deduplicationBtn setFrame:CGRectMake(self.calculationBtn.right + 40.0f, self.calculationBtn.y, SCREEN_WIDTH / 2 - 40, 40.0f)];
    [self.sourceLabel setNumberOfLines:0];
    [self.view addSubview:self.deduplicationBtn];
}

- (void)p_RandomBtnClicked {
    self.sourceItems = [WXYSortCommonTool tool_GetRandomNumSourceItemsWithCount:10];
    [self.sourceLabel setText:WXYFormatterString(@"@[ %@ ]",[self.sourceItems componentsJoinedByString:@","])];
    self.resultView.text = @"";
}

- (void)p_StartOCCalculationWithDeduplication:(BOOL)deduplication {
    
    // 1. 简单校验
    if (!self.sourceItems.count) {
        [self showErrorSourceAlertController];
        return;
    }
    
    // 2. 起始时间
    NSDate *startDate = [NSDate date];
    
    // 3. 合并数组
    NSMutableArray *sortArray = self.sourceItems.mutableCopy;
    [WXYSortQuickSortModel quickSortArray:sortArray withLeftIndex:0 andRightIndex:sortArray.count - 1];
    
    // 4. 去重
    if (deduplication) {
        sortArray = [NSMutableArray arrayWithArray:[WXYSortCommonTool deduplicationWithList:sortArray]];
    }
    
    // 5. 获取当前结束时间
    NSDate *endDate = [NSDate date];
    
    // 6. 展示信息
    [self.resultView setText:WXYFormatterString(@"耗时:%.4f秒\n结果:[ %@ ]",[endDate timeIntervalSinceDate:startDate], [sortArray componentsJoinedByString:@","])];
}

- (void)p_StartCalculationWithDeduplication:(BOOL)deduplication {
    
    // 1. 简单校验
    if (!self.sourceItems.count) {
        [self showErrorSourceAlertController];
        return;
    }
    
    // 2. 起始时间
    NSDate *startDate = [NSDate date];
    
    // 3. 将第一个数组转int数组
    int sourceLen = (int)self.sourceItems.count;
    int a[sourceLen];
    for (int i = 0; i < self.sourceItems.count; i++) {
        a[i] = [[self.sourceItems objectAtIndex:i] intValue];
    }
    
    // 6. 合并数组
    quicksSort(a, 0, sourceLen - 1);
    
    // 7. 初始化合并结果数据长度
    int resultLen = sourceLen;
    
    // 8. 数组去重
    if (deduplication) {
        // 数组去重
        resultLen = deduplicationList(a, sourceLen);
    }
    
    // 7. 将返回数据转array
    NSMutableArray *logArray = [NSMutableArray arrayWithCapacity:resultLen];
    for (int i = 0; i < resultLen; i++) {
        [logArray addObject:[NSNumber numberWithInt:a[i]]];
    }
    
    // 8. 获取当前结束时间
    NSDate *endDate = [NSDate date];
    
    // 9. 展示信息
    [self.resultView setText:WXYFormatterString(@"耗时:%.8f秒\n结果:[ %@ ]",[endDate timeIntervalSinceDate:startDate], [logArray componentsJoinedByString:@","])];
}

- (void)p_CalculationBtnClicked {
    [self p_StartCalculationWithDeduplication:NO];
}

- (void)p_DeduplicationBtnClicked {
    [self p_StartCalculationWithDeduplication:YES];
}
#pragma mark  --  懒加载  --

- (UIButton *)deduplicationBtn
{
    if (!_deduplicationBtn) {
        _deduplicationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deduplicationBtn setTitle:@"去重快排" forState:UIControlStateNormal];
        [_deduplicationBtn.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [_deduplicationBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_deduplicationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deduplicationBtn setCornerRadius:10.0f];
        [_deduplicationBtn addTarget:self action:@selector(p_DeduplicationBtnClicked)];
    }
    return _deduplicationBtn;
}

@end
