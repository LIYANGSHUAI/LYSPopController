//
//  LYSPopController.m
//  LYSPopControllerDemo
//
//  Created by HENAN on 2018/7/9.
//  Copyright © 2018年 liyangshuai. All rights reserved.
//

#import "LYSPopController.h"

#define SCREENWIDTH CGRectGetWidth([UIScreen mainScreen].bounds)
#define SCREENHEIGHT CGRectGetHeight([UIScreen mainScreen].bounds)

@interface LYSPopController ()
@property (nonatomic,strong) UIView *marginView;
@property (nonatomic,strong) UIView *popContentView;
@property (nonatomic,assign) CGRect from;
@property (nonatomic,assign) CGRect to;
@end

@implementation LYSPopController
- (UIView *)customView{if (!_customView) {_customView = [[UIView alloc] init];}return _customView;}
- (UIView *)popContentView{if (!_popContentView) {_popContentView = [[UIView alloc] init];_popContentView.clipsToBounds = YES;}return _popContentView;}
- (UIView *)marginView{if (!_marginView) {_marginView = [[UIView alloc] init];_marginView.clipsToBounds = YES;}return _marginView;}
/// 初始化方法
- (instancetype)init{self = [super init];if (self) {[self defaultParams];}return self;}
- (instancetype)initWithStyle:(LYSPopStyle)style popSpacing:(CGFloat)popSpacing
{
    self = [self init];
    if (self) {
        self.style = style;
        self.popSpacing = popSpacing;
    }
    return self;
}
- (instancetype)initWithStyle:(LYSPopStyle)style popSpacing:(CGFloat)popSpacing customView:(UIView *)customView
{
    self = [self init];
    if (self) {
        self.style = style;
        self.customView = customView;
        self.popSpacing = popSpacing;
    }
    return self;
}
/// 设置默认参数
- (void)defaultParams
{
    self.duration = 0.3;
    self.popSpacing = 216;
    self.style = LYSPopStyleBottom;
    self.popMargin = 0;
    self.enableAnimationAlpha = YES;
}
- (void)loadView
{
    [super loadView];
    UITapGestureRecognizer *cancel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelAction:)];
    [self.view addGestureRecognizer:cancel];
}
- (void)cancelAction:(UITapGestureRecognizer *)sender
{
    if (!CGRectContainsPoint(self.marginView.frame, [sender locationInView:sender.view])) {
        [self hiddenAnimated:YES];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect marginFrame = CGRectZero;
    
    switch (self.style) {
        case LYSPopStyleBottom:
        {
            marginFrame = CGRectMake(0, SCREENHEIGHT - self.popMargin - self.popSpacing, SCREENWIDTH, self.popSpacing);
            _from = CGRectMake(0, CGRectGetHeight(marginFrame), CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame));
            _to = CGRectMake(0, 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame));
        }
            break;
        case LYSPopStyleTop:
        {
            marginFrame = CGRectMake(0, self.popMargin, SCREENWIDTH, self.popSpacing);
            _from = CGRectMake(0, -CGRectGetHeight(marginFrame), CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame));
            _to = CGRectMake(0, 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame));
        }
            break;
        case LYSPopStyleLeft:
        {
            marginFrame = CGRectMake(self.popMargin, 0, self.popSpacing, SCREENHEIGHT);
            _from = CGRectMake(-CGRectGetWidth(marginFrame), 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame));
            _to = CGRectMake(0, 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame));
        }
            break;
        case LYSPopStyleRight:
        {
            marginFrame = CGRectMake(SCREENWIDTH - self.popMargin - self.popSpacing, 0, self.popSpacing, SCREENHEIGHT);
            _from = CGRectMake(CGRectGetWidth(marginFrame), 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame));
            _to = CGRectMake(0, 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame));
        }
            break;
        case LYSPopStyleCenter:
        {
            marginFrame = CGRectMake(0, (SCREENHEIGHT-self.popSpacing)/2.0+self.popMargin, SCREENWIDTH, self.popSpacing);
            _from = CGRectMake(CGRectGetWidth(marginFrame)/2.0, CGRectGetHeight(marginFrame)/2.0, 2, 2);
            _to = CGRectMake(0, 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame));
        }
            break;
        default:
            break;
    }
    
    if (self.enableAnimationAlpha){self.popContentView.alpha = 0;}
    
    self.marginView.frame = marginFrame;
    [self.view addSubview:self.marginView];
    
    self.popContentView.frame = _from;
    [self.marginView addSubview:self.popContentView];
    
    self.customView.center = CGPointMake(CGRectGetWidth(self.popContentView.frame)/2.0, CGRectGetHeight(self.popContentView.frame)/2.0);
    [self.popContentView addSubview:self.customView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showAnimation:YES];
}

- (void)showAnimation:(BOOL)animated
{
    if (animated) {
        __weak LYSPopController *weakSelf = self;
        [UIView animateWithDuration:self.duration delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
            self.popContentView.frame = weakSelf.to;
            self.customView.center = CGPointMake(CGRectGetWidth(self.popContentView.frame)/2.0, CGRectGetHeight(self.popContentView.frame)/2.0);
            if (self.enableAnimationAlpha) {
                self.popContentView.alpha = 1;
            }
        } completion:nil];
    } else {
        self.popContentView.frame = _to;
    }
}

- (void)hiddenAnimated:(BOOL)animated
{
    if (animated) {
        __weak LYSPopController *weakSelf = self;
        [UIView animateWithDuration:self.duration delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
            self.popContentView.frame = weakSelf.from;
            if (self.enableAnimationAlpha) {
                self.popContentView.alpha = 0;
            }
        } completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:NO completion:nil];
        }];
    } else {
        self.popContentView.frame = _from;
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}
@end

@implementation UIViewController (LYSPopController)
- (void)alertPopController:(LYSPopController *)controller
{
    controller.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:controller animated:NO completion:nil];
}
@end

