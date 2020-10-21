//
//  WXYSortSameSuperViewController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/20.
//

#import "WXYSortSameSuperViewController.h"
#import "WXYSortTempChiledView.h"
#import "WXYSortTempView.h"
#import "WXYSortSameSuperViewModel.h"

@interface WXYSortSameSuperViewController ()

@property (nonatomic, strong) WXYSortTempChiledView *oneView;
@property (nonatomic, strong) UILabel *twoView;

@end

@implementation WXYSortSameSuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查找相同父视图";
    [self.calculationBtn setTitle:@"开始查找" forState:UIControlStateNormal];
    [self.randomSourceBtn setTitle:@"生成两个视图" forState:UIControlStateNormal];
}

#pragma mark  --  按钮事件  --

- (void)p_RandomBtnClicked {
    [self.view addSubview:self.oneView];
    [self.view addSubview:self.twoView];
    [self.sourceLabel setText:WXYFormatterString(@"两个视图已经添加")];
    self.resultView.text = @"";
}

#pragma mark  --  开始查找  --
- (void)p_CalculationBtnClicked {
    if (!_oneView || !_twoView) {
        [self showErrorSourceAlertController];
        return;
    }
    
    // 起始时间
    NSDate *startDate = [NSDate date];
    
    // 查找共同父视图
    NSArray *sameViews = [WXYSortSameSuperViewModel findCommonSuperView:self.oneView otherView:self.twoView];

    // 结束时间
    NSDate *endDate = [NSDate date];
    
    // 展示信息
    [self.resultView setText:WXYFormatterString(@"耗时:%.4f秒\n结果:\n%@",[endDate timeIntervalSinceDate:startDate], [sameViews componentsJoinedByString:@",\n"])];
}

#pragma mark  --  懒加载  --

- (WXYSortTempChiledView *)oneView
{
    if (!_oneView) {
        _oneView = [[WXYSortTempChiledView alloc] init];
        _oneView.frame = CGRectMake(20, self.resultView.bottom + 20.0f, 100.0f, 100.0f);
        _oneView.backgroundColor = [UIColor yellowColor];
    }
    return _oneView;
}

- (UILabel *)twoView
{
    if (!_twoView) {
        _twoView = [[UILabel alloc] init];
        _twoView.frame = CGRectMake(self.oneView.right + 20, self.oneView.y, 100.0f, 100.0f);
        _twoView.backgroundColor = [UIColor lightGrayColor];
    }
    return _twoView;
}

@end
