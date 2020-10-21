
//
//  WXYSortHashController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import "WXYSortHashController.h"
#import "WXYSortHashModel.h"

@interface WXYSortHashController ()

@end

@implementation WXYSortHashController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Hash算法";
    [self.randomSourceBtn setTitle:@"生成基础数据" forState:UIControlStateNormal];
    [self.randomSourceBtn setTitle:@"开始查找" forState:UIControlStateNormal];
}

#pragma mark  --  按钮事件  --

- (void)p_RandomBtnClicked {
    self.sourceString = @"xababffedhikuyi";
    [self.sourceLabel setText:WXYFormatterString(@"查找第一个出现两次的字符【%@】",self.sourceString)];
    self.resultView.text = @"";
}

- (void)p_CalculationBtnClicked {
    if (!self.sourceString.length) {
        [self showErrorSourceAlertController];
        return;
    }
    // 开始时间
    NSDate *startDate = [NSDate date];
    
    NSMutableData *charData = [NSMutableData dataWithData:[self.sourceString dataUsingEncoding:NSUTF8StringEncoding]];
    char result = findFirstChar(charData.mutableBytes, 2);

    // 结束时间
    NSDate *endDate = [NSDate date];
    [self.resultView setText:WXYFormatterString(@"耗时:%.4f秒\n结果:%c",
                                                [endDate timeIntervalSinceDate:startDate],
                                                result)];
}


@end
