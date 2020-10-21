//
//  WXYSortMergeController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import "WXYSortMergeController.h"
#import "WXYSortMergeModel.h"

@interface WXYSortMergeController ()

@property (nonatomic, strong) NSArray <NSNumber *>*sourceItemA;
@property (nonatomic, strong) NSArray <NSNumber *>*sourceItemB;
@property (nonatomic, strong) UIButton *deduplicationBtn;

@end

@implementation WXYSortMergeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"有序数组合并";
    [self.calculationBtn setTitle:@"普通合并" forState:UIControlStateNormal];
    [self.calculationBtn setFrame:CGRectMake(20, self.sourceLabel.bottom + 20.0f, SCREEN_WIDTH / 2 - 40, 40.0f)];
    [self.deduplicationBtn setFrame:CGRectMake(self.calculationBtn.right + 40.0f, self.calculationBtn.y, SCREEN_WIDTH / 2 - 40, 40.0f)];
    [self.sourceLabel setNumberOfLines:0];
    [self.view addSubview:self.deduplicationBtn];
}


- (void)p_RandomBtnClicked {
    self.sourceItemA = [WXYSortCommonTool tool_GetOrderlyRandomNumSourceItemsWithCount:5];
    self.sourceItemB = [WXYSortCommonTool tool_GetOrderlyRandomNumSourceItemsWithCount:8];
    [self.sourceLabel setText:WXYFormatterString(@"待合并A ：[ %@ ]\n待合并B ：[ %@ ]",[self.sourceItemA componentsJoinedByString:@","], [self.sourceItemB componentsJoinedByString:@","])];
    self.resultView.text = @"";
}

- (void)p_StartOCCalculationWithDeduplication:(BOOL)deduplication {
    
    // 1. 简单校验
    if (!self.sourceItemA.count || !self.sourceItemB.count) {
        [self showErrorSourceAlertController];
        return;
    }
    
    // 2. 起始时间
    NSDate *startDate = [NSDate date];
    
    // 3. 合并数组
    NSArray *mergeArray = [WXYSortMergeModel mergeWithList:self.sourceItemA otherList:self.sourceItemB];
    
    // 4. 去重
    if (deduplication) {
        mergeArray = [WXYSortCommonTool deduplicationWithList:mergeArray];
    }
    
    // 5. 获取当前结束时间
    NSDate *endDate = [NSDate date];
    
    // 6. 展示信息
    [self.resultView setText:WXYFormatterString(@"耗时:%.4f秒\n结果:[ %@ ]",[endDate timeIntervalSinceDate:startDate], [mergeArray componentsJoinedByString:@","])];
}
- (void)p_StartCalculationWithDeduplication:(BOOL)deduplication {
    
    // 1. 简单校验
    if (!self.sourceItemA.count || !self.sourceItemB.count) {
        [self showErrorSourceAlertController];
        return;
    }
    
    // 2. 起始时间
    NSDate *startDate = [NSDate date];
    
    // 3. 将第一个数组转int数组
    int aLen = (int)self.sourceItemA.count;
    int a[aLen];
    for (int i = 0; i < self.sourceItemA.count; i++) {
        a[i] = [[self.sourceItemA objectAtIndex:i] intValue];
    }
    
    // 4. 将第二个数据源转int数组
    int bLen = (int)self.sourceItemB.count;
    int b[bLen];
    for (int i = 0; i < self.sourceItemB.count; i++) {
        b[i] = [[self.sourceItemB objectAtIndex:i] intValue];
    }
    
    // 5. 初始化一个返回数据数组
    int result[aLen + bLen];
    
    // 6. 合并数组
    mergeList(a, 5, b, 10, result);
    
    // 7. 初始化合并结果数据长度
    int resultLen = aLen + bLen;
    
    // 8. 数组去重
    if (deduplication) {
        // 数组去重
        resultLen = deduplicationList(result, aLen + bLen);
    }
    
    // 7. 将返回数据转array
    NSMutableArray *logArray = [NSMutableArray arrayWithCapacity:resultLen];
    for (int i = 0; i < resultLen; i++) {
        [logArray addObject:[NSNumber numberWithInt:result[i]]];
    }
    
    // 8. 获取当前结束时间
    NSDate *endDate = [NSDate date];
    
    // 9. 展示信息
    [self.resultView setText:WXYFormatterString(@"耗时:%.4f秒\n结果:[ %@ ]",[endDate timeIntervalSinceDate:startDate], [logArray componentsJoinedByString:@","])];
}

- (void)p_CalculationBtnClicked {
    [self p_StartOCCalculationWithDeduplication:NO];
}

- (void)p_DeduplicationBtnClicked {
    [self p_StartOCCalculationWithDeduplication:YES];
}
#pragma mark  --  懒加载  --

- (UIButton *)deduplicationBtn
{
    if (!_deduplicationBtn) {
        _deduplicationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deduplicationBtn setTitle:@"去重合并" forState:UIControlStateNormal];
        [_deduplicationBtn.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [_deduplicationBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_deduplicationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deduplicationBtn setCornerRadius:10.0f];
        [_deduplicationBtn addTarget:self action:@selector(p_DeduplicationBtnClicked)];
    }
    return _deduplicationBtn;
}

@end
