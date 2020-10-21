//
//  WXYSortBaseViewController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import "WXYSortBaseViewController.h"

@interface WXYSortBaseViewController ()

@end

@implementation WXYSortBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.randomSourceBtn];
    [self.view addSubview:self.sourceLabel];
    [self.view addSubview:self.calculationBtn];
    [self.view addSubview:self.resultView];
}

#pragma mark  --  子类可以从写事件  --
- (void)p_RandomBtnClicked {
    self.sourceItems = [WXYSortCommonTool tool_GetRandomNumSourceItemsWithCount:10];
    [self.sourceLabel setText:WXYFormatterString(@"@[ %@ ]",[self.sourceItems componentsJoinedByString:@","])];
    self.resultView.text = @"";
}

- (void)p_CalculationBtnClicked {
}

- (void)showErrorSourceAlertController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请先获取数据源" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:resetAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark  --  懒加载  --

- (UIButton *)randomSourceBtn
{
    if (!_randomSourceBtn) {
        _randomSourceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_randomSourceBtn setFrame:CGRectMake(100.0f, 100.0f, SCREEN_WIDTH - 200.0f, 40.0f)];
        [_randomSourceBtn setTitle:@"随机一个数据源" forState:UIControlStateNormal];
        [_randomSourceBtn.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [_randomSourceBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_randomSourceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_randomSourceBtn setCornerRadius:10.0f];
        [_randomSourceBtn addTarget:self action:@selector(p_RandomBtnClicked)];
    }
    return _randomSourceBtn;
}

- (UILabel *)sourceLabel
{
    if (!_sourceLabel) {
        _sourceLabel = [[UILabel alloc] init];
        [_sourceLabel setFrame:CGRectMake(0, self.randomSourceBtn.bottom + 20.0f, SCREEN_WIDTH, 40)];
        [_sourceLabel setFont:[UIFont systemFontOfSize:16.0f]];
        [_sourceLabel setTextAlignment:NSTextAlignmentCenter];
        [_sourceLabel setText:@"先获取准备进行排序的数据源"];
    }
    return _sourceLabel;;
}

- (UIButton *)calculationBtn
{
    if (!_calculationBtn) {
        _calculationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_calculationBtn setFrame:CGRectMake(100.0f, self.sourceLabel.bottom + 20.0f, SCREEN_WIDTH - 200.0f, 40.0f)];
        [_calculationBtn setTitle:@"开始排序" forState:UIControlStateNormal];
        [_calculationBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [_calculationBtn setBackgroundColor:[UIColor lightGrayColor]];
        [_calculationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_calculationBtn setCornerRadius:10.0f];
        [_calculationBtn addTarget:self action:@selector(p_CalculationBtnClicked)];
    }
    return _calculationBtn;
}

- (UITextView *)resultView
{
    if (!_resultView) {
        _resultView = [[UITextView alloc] init];
        [_resultView setFrame:CGRectMake(20, self.calculationBtn.bottom + 20.0f, SCREEN_WIDTH - 40, 100)];
        [_resultView setFont:[UIFont systemFontOfSize:15.0f]];
        [_resultView setTextAlignment:NSTextAlignmentLeft];
        [_resultView setBorderColor:[UIColor blackColor]];
        [_resultView setBorderWidth:0.5];
    }
    return _resultView;;
}
@end
