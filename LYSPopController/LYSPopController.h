//
//  LYSPopController.h
//  LYSPopControllerDemo
//
//  Created by HENAN on 2018/7/9.
//  Copyright © 2018年 liyangshuai. All rights reserved.
//

#import <UIKit/UIKit.h>

/// Pop-up windows support the following ways by default

typedef NS_ENUM(NSUInteger, LYSPopStyle) {
    LYSPopStyleBottom,                     /// from the screen bottom animation
    LYSPopStyleLeft,                       /// from the screen left animation
    LYSPopStyleRight,                      /// from the screen right animation
    LYSPopStyleTop,                        /// from the screen top animation
    LYSPopStyleCenter                      /// from the screen center animation
};

@interface LYSPopController : UIViewController
/// the LYSPopStyle style
@property (nonatomic,assign) LYSPopStyle style;
/// Whether to change the transparency during the pop-up process, the default is YES
@property (nonatomic,assign) BOOL enableAnimationAlpha;

/// The content view that pops up is generally the specific display view popped up by the user.
@property (nonatomic,strong) UIView *customView;

/// Background view color
@property (nonatomic, strong) UIColor *bgColor;

/// The starting position of the pop-up content view animation. The default is 0, which is close to the screen.
@property (nonatomic,assign) CGFloat popMargin;

/// The effective distance of the pop-up content view animation
@property (nonatomic, assign) CGFloat popSpacing;
/// The duration of the pop-up content view animation
@property (nonatomic, assign) NSTimeInterval duration;

// 点击背景是否隐藏弹窗,默认是YES
@property (nonatomic, assign) BOOL enableTapBackHidden;

/// 是否开启动画效果,默认是开启
@property (nonatomic, assign) BOOL animationEnable;

/// Initialization method
- (instancetype)initWithStyle:(LYSPopStyle)style popSpacing:(CGFloat)popSpacing;
- (instancetype)initWithStyle:(LYSPopStyle)style popSpacing:(CGFloat)popSpacing customView:(UIView *)customView;

/// Exit page
- (void)hiddenAnimated:(BOOL)animated;
@end

@interface UIViewController (LYSPopController)
/// Pop up the LYSPopController controller
- (void)alertPopController:(LYSPopController *)controller;
@end

@interface LYSPopContentView : UIView
@property (nonatomic, assign) NSInteger randomTag;
@end
