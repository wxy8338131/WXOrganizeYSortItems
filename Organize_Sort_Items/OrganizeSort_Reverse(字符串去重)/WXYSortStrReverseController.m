
//
//  WXYSortStrReverseController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import "WXYSortStrReverseController.h"

@interface WXYSortStrReverseController ()

@end

@implementation WXYSortStrReverseController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"字符串去重";
}


- (void)p_RandomBtnClicked {
    self.sourceString = [WXYSortCommonTool tool_GetSomeSameCharWithCount:10];
    [self.sourceLabel setText:WXYFormatterString(@"%@",self.sourceString)];
    self.resultView.text = @"";
}

- (void)p_CalculationBtnClicked {
    if (!self.sourceString.length) {
        [self showErrorSourceAlertController];
        return;
    }
    // 开始时间
    NSDate *startDate = [NSDate date];
    
    const char *cString = [self.sourceString UTF8String];
    char *result = deduplicationChar(cString);

    // 结束时间
    NSDate *endDate = [NSDate date];
    [self.resultView setText:WXYFormatterString(@"耗时:%.8f秒\n结果:%s",
                                                [endDate timeIntervalSinceDate:startDate],
                                                result)];
}

@end
