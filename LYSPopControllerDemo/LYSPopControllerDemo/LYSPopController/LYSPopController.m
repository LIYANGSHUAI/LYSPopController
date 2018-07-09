//
//  LYSPopController.m
//  LYSPopControllerDemo
//
//  Created by HENAN on 2018/7/9.
//  Copyright © 2018年 liyangshuai. All rights reserved.
//

#import "LYSPopController.h"

void updateTop(UIView *view, CGFloat top)
{
    CGRect frame = view.frame;
    frame.origin.y = top;
    view.frame = frame;
}

#define SCREENWIDTH CGRectGetWidth([UIScreen mainScreen].bounds)
#define SCREENHEIGHT CGRectGetHeight([UIScreen mainScreen].bounds)

@interface LYSPopContentView ()
@property (nonatomic, weak) UIView *alertView;
@end

@implementation LYSPopContentView
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (CGRectContainsPoint(self.alertView.frame, point)) {
        return nil;
    }
    return [super hitTest:point withEvent:event];
}
@end

@interface LYSPopController ()
@property (nonatomic,strong) UIView *customView;
@end

@implementation LYSPopController

- (instancetype)initWithCustomView:(UIView *)customView
{
    self = [super init];
    if (self) {
        self.customView = customView;
        [self defaultParams];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self defaultParams];
    }
    return self;
}

- (void)defaultParams
{
    self.duration = 0.3;
    self.popSpacing = 216;
}

- (UIView *)customView
{
    if (!_customView) {
        _customView = [[UIView alloc] init];
    }
    return _customView;
}

- (void)loadView
{
    LYSPopContentView *contentView = [[LYSPopContentView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    contentView.alertView = self.customView;
    
    UITapGestureRecognizer *cancel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelAction:)];
    [contentView addGestureRecognizer:cancel];
    self.view = contentView;
}

- (void)cancelAction:(UITapGestureRecognizer *)sender
{
    [self hiddenAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.customView.frame = CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, self.popSpacing);
    self.customView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.customView];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self showAnimation:YES];
}

- (void)showAnimation:(BOOL)animated
{
    if (animated) {
        [UIView animateWithDuration:self.duration delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
            updateTop(self.customView, SCREENHEIGHT - self.popSpacing);
        } completion:nil];
    } else {
        updateTop(self.customView, SCREENHEIGHT - self.popSpacing);
    }
}

- (void)hiddenAnimated:(BOOL)animated
{
    if (animated) {
        [UIView animateWithDuration:self.duration delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
            updateTop(self.customView, SCREENHEIGHT);
        } completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:NO completion:nil];
        }];
    } else {
        updateTop(self.customView, SCREENHEIGHT);
    }
}
@end


