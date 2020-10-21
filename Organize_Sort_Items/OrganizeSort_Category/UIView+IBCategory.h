//
//  UIView+IBCategory.h
//
//
//  Created by sunpengcheng on 16/3/27.
//  Copyright © 2016年 SunPengcheng. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIView (IBCategory)

@property (nonatomic, strong) IBInspectable UIColor *borderColor;  // 边线颜色
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;   // 边线宽度
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;  // 圆角弧度

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;

// UIVIew添加点击事件
- (void)addTarget:(id)target action:(SEL)action;

// UIVIew移除点击事件
- (void)removeTarget:(id)target action:(SEL)action;

// 寻找视图最近一层的ViewController
- (UIViewController *)findViewController;

/**
 定制圆角UIView
 @param cornerRadius 圆角弧度
 @param borderWidth  边线宽度
 @param borderColor  边线颜色
 @param corners      定制的圆角
 */
- (void)setBorderWithCornerRadius:(CGFloat)cornerRadius
                      borderWidth:(CGFloat)borderWidth
                      borderColor:(UIColor *)borderColor
                             type:(UIRectCorner)corners;

/**
 定制圆角UIView，空心带边线
 @param cornerRadius 圆角弧度
 @param borderWidth  边线宽度
 @param borderColor  边线颜色
 @param fillColor    实心填充颜色
 @param corners      定制的圆角
 */
- (void)setBorderWithCornerRadius:(CGFloat)cornerRadius
                      borderWidth:(CGFloat)borderWidth
                      borderColor:(UIColor *)borderColor
                        fillColor:(UIColor*)fillColor
                          corners:(UIRectCorner)corners;

@end
