//
//  WXYSortBaseViewController.h
//  Organize_Sort_Items
//
//  Created by wxy on 2020/10/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WXYSortBaseViewController : UIViewController

@property (nonatomic, strong) UIButton *randomSourceBtn;
@property (nonatomic, strong) UILabel *sourceLabel;
@property (nonatomic, strong) UIButton *calculationBtn;
@property (nonatomic, strong) UITextView *resultView;
@property (nonatomic, strong) NSArray *sourceItems;
@property (nonatomic, strong) NSString *sourceString;

- (void)showErrorSourceAlertController;

@end

NS_ASSUME_NONNULL_END
