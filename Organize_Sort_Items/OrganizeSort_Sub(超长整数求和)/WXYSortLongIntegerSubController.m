
//
//  WXYSortLongIntegerSubController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/21.
//

#import "WXYSortLongIntegerSubController.h"
#import "WXYSortLongIntegerSubModel.h"

@interface WXYSortLongIntegerSubController ()

@property (nonatomic, copy) NSString *sourceStrOne;
@property (nonatomic, copy) NSString *sourceStrOther;

@end

@implementation WXYSortLongIntegerSubController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"超长整数求和";
    [self.sourceLabel setNumberOfLines:0];
    [self.calculationBtn setTitle:@"开始求和" forState:UIControlStateNormal];
}

#pragma mark  --  按钮事件  --

- (void)p_RandomBtnClicked {
    self.sourceStrOne = [WXYSortCommonTool tool_GetRandomNumberStringWithCount:10];
    self.sourceStrOther = [WXYSortCommonTool tool_GetRandomNumberStringWithCount:10];
    [self.sourceLabel setText:WXYFormatterString(@"%@\n%@",self.sourceStrOne,self.sourceStrOther)];
    self.resultView.text = @"";
}

- (void)p_CalculationBtnClicked {
    if (!self.sourceStrOne.length || !self.sourceStrOther.length) {
        [self showErrorSourceAlertController];
        return;
    }
    
    // 开始时间
    NSDate *startDate = [NSDate date];
    char *result = longInterSub([self.sourceStrOne UTF8String],[self.sourceStrOther UTF8String]);
    
    // 结束时间
    NSDate *endDate = [NSDate date];
    
    [self.resultView setText:WXYFormatterString(@"耗时:%.8f秒\n结果:%s",
                                                [endDate timeIntervalSinceDate:startDate],
                                                result)];
}


@end
