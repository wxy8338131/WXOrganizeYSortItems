//
//  WXYOrganizeSortRootController.m
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import "WXYSortRootController.h"

@interface WXYSortRootController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <NSDictionary *>*sourceItems;

@end

@implementation WXYSortRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"算法列表";
    [self p_OrganizeSortSourceItems];
    [self.view addSubview:self.tableView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)p_OrganizeSortSourceItems{
    
    self.sourceItems = @[
        @{@"冒泡排序":NSClassFromString(@"WXYSortBubbleSortController")},
        @{@"快速排序":NSClassFromString(@"WXYSortQuickSortController")},
        @{@"Hash算法":NSClassFromString(@"WXYSortHashController")},
        @{@"链表":NSClassFromString(@"WXYSortNodeController")},
        @{@"有序数组合并":NSClassFromString(@"WXYSortMergeController")},
        @{@"查找共同父视图":NSClassFromString(@"WXYSortSameSuperViewController")},
        @{@"字符串去重":NSClassFromString(@"WXYSortStrReverseController")},
        @{@"字符串反转":NSClassFromString(@"WXYSortCharReverseController")},
        @{@"超长整数求和":NSClassFromString(@"WXYSortLongIntegerSubController")},
        @{@"无序数组求中位数":NSClassFromString(@"WXYSortFindMedianController")},
        @{@"求数组中第K大的数":NSClassFromString(@"WXYSortSearchKBigController")}
    ];
    
}

#pragma mark  --  UITableViewDataSource  --

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sourceItems.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SortCellIdentifier = @"SortCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SortCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SortCellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSDictionary *sourceDict = [self.sourceItems objectAtIndex:indexPath.row];
    [cell.textLabel setText:sourceDict.allKeys.firstObject];
    [cell.detailTextLabel setText:NSStringFromClass(sourceDict.allValues.firstObject)];
    [cell.detailTextLabel setFont:[UIFont systemFontOfSize:12.0f]];
    return cell;
}

#pragma mark -
#pragma mark - UITableViewClickAction
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *sourceDict = [self.sourceItems objectAtIndex:indexPath.row];
    Class pushClass = sourceDict.allValues.firstObject;
    [self.navigationController pushViewController:[[pushClass alloc] init] animated:YES];
}


#pragma mark  --  懒加载  --

- (UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, StatusBarHeight + 44, SCREEN_WIDTH, SCREEN_HEIGHT - StatusBarHeight)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        if (@available(iOS 11.0, *)) {
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
    return _tableView;
}

@end
