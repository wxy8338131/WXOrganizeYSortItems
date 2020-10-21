//
//  WXYSortCharReverseController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import "WXYSortCharReverseController.h"
#import "WXYSortCharReverse.h"

@interface WXYSortCharReverseController ()

@end

@implementation WXYSortCharReverseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"字符串反转";
}


- (void)p_RandomBtnClicked {
    self.sourceString = [WXYSortCommonTool tool_GetRandomStringWithCount:10];
    [self.sourceLabel setText:WXYFormatterString(@"%@",self.sourceString)];
    self.resultView.text = @"";
}

- (void)p_CalculationBtnClicked {
    if (!self.sourceString.length) {
        [self showErrorSourceAlertController];
        return;
    }
    self.randomSourceBtn.userInteractionEnabled = NO;
    self.calculationBtn.userInteractionEnabled = NO;
    __weak typeof(self) weakSelf = self;
    NSDate *startDate = [NSDate date];
    [WXYSortCharReverse reverse:self.sourceString FinishBlock:^(NSInteger totalWhile, NSString * _Nonnull resultStr) {
        
        weakSelf.randomSourceBtn.userInteractionEnabled = YES;
        weakSelf.calculationBtn.userInteractionEnabled = YES;

        NSDate *endDate = [NSDate date];
        [weakSelf.resultView setText:WXYFormatterString(@"共循环:%zd次\n耗时:%.4f秒\n结果: %@ ",
                                                        totalWhile,
                                                        [endDate timeIntervalSinceDate:startDate],
                                                        resultStr)];
    }];
}


@end
