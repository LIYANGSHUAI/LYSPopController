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
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIView *marginView;
@property (nonatomic,strong) UIView *popContentView;
@property (nonatomic,strong) NSValue *from;
@property (nonatomic,strong) NSValue *to;
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
    self.enableAnimationAlpha = NO;
    self.bgColor = nil;
    self.animationEnable = YES;
}
- (void)loadView
{
    [super loadView];
    self.bgView = [[UIView alloc] init];
//    UITapGestureRecognizer *cancel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelAction:)];
//    [self.view addGestureRecognizer:cancel];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self hiddenAnimated:self.animationEnable];
}
//- (void)cancelAction:(UITapGestureRecognizer *)sender
//{
//    if (CGRectContainsPoint(self.bgView.frame, [sender locationInView:sender.view])) {
//        if (!CGRectContainsPoint(self.marginView.frame, [sender locationInView:sender.view])) {
//
//        }
//    }
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect marginFrame = CGRectZero;
    
    switch (self.style) {
        case LYSPopStyleBottom:
        {
            marginFrame = CGRectMake(0, SCREENHEIGHT - self.popMargin - self.popSpacing, SCREENWIDTH, self.popSpacing);
            _from = [NSValue valueWithCGRect:CGRectMake(0, CGRectGetHeight(marginFrame), CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame))];
            _to = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame))];
            self.bgView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-self.popMargin);
        }
            break;
        case LYSPopStyleTop:
        {
            marginFrame = CGRectMake(0, self.popMargin, SCREENWIDTH, self.popSpacing);
            _from = [NSValue valueWithCGRect:CGRectMake(0, -CGRectGetHeight(marginFrame), CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame))];
            _to = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame))];
            self.bgView.frame = CGRectMake(0, self.popMargin, SCREENWIDTH, SCREENHEIGHT-self.popMargin);
        }
            break;
        case LYSPopStyleLeft:
        {
            marginFrame = CGRectMake(self.popMargin, 0, self.popSpacing, SCREENHEIGHT);
            _from = [NSValue valueWithCGRect:CGRectMake(-CGRectGetWidth(marginFrame), 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame))];
            _to = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame))];
            self.bgView.frame = CGRectMake(self.popMargin, 0, SCREENWIDTH-self.popMargin, SCREENHEIGHT);
        }
            break;
        case LYSPopStyleRight:
        {
            marginFrame = CGRectMake(SCREENWIDTH - self.popMargin - self.popSpacing, 0, self.popSpacing, SCREENHEIGHT);
            _from = [NSValue valueWithCGRect:CGRectMake(CGRectGetWidth(marginFrame), 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame))];
            _to = [NSValue valueWithCGRect:CGRectMake(0, 0, CGRectGetWidth(marginFrame), CGRectGetHeight(marginFrame))];
            self.bgView.frame = CGRectMake(0, 0, SCREENWIDTH-self.popMargin, SCREENHEIGHT);
        }
            break;
        case LYSPopStyleCenter:
        {
            marginFrame = CGRectMake(0, (SCREENHEIGHT-self.popSpacing)/2.0+self.popMargin, SCREENWIDTH, self.popSpacing);
            _from = [NSValue valueWithCGAffineTransform:(CGAffineTransformMakeScale(0, 0))];
            _to = [NSValue valueWithCGAffineTransform:(CGAffineTransformMakeScale(1, 1))];
            self.bgView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        }
            break;
        default:
            break;
    }
    
    if (self.enableAnimationAlpha){self.popContentView.alpha = 0;}
    [self.view addSubview:self.bgView];
    self.bgView.backgroundColor = self.bgColor;
    
    self.marginView.frame = marginFrame;
    [self.view addSubview:self.marginView];
    
    if (self.style == LYSPopStyleCenter) {
        self.popContentView.frame = self.marginView.bounds;
        self.popContentView.transform = [_from CGAffineTransformValue];
        self.popContentView.center = CGPointMake(CGRectGetWidth(self.marginView.frame)/2.0, CGRectGetHeight(self.marginView.frame)/2.0);
        self.customView.center = CGPointMake(CGRectGetWidth(self.marginView.frame)/2.0, CGRectGetHeight(self.marginView.frame)/2.0);
    } else {
        self.popContentView.frame = [_from CGRectValue];
        self.customView.center = CGPointMake(CGRectGetWidth(self.popContentView.frame)/2.0, CGRectGetHeight(self.popContentView.frame)/2.0);
    }
    [self.marginView addSubview:self.popContentView];
    [self.popContentView addSubview:self.customView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showAnimation:self.animationEnable];
}

- (void)showAnimation:(BOOL)animated
{
    if (animated) {
        __weak LYSPopController *weakSelf = self;
        [UIView animateWithDuration:self.duration delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
            if (self.style == LYSPopStyleCenter) {
                self.popContentView.transform = [weakSelf.to CGAffineTransformValue];
                self.popContentView.center = CGPointMake(CGRectGetWidth(self.marginView.frame)/2.0, CGRectGetHeight(self.marginView.frame)/2.0);
                self.customView.center = CGPointMake(CGRectGetWidth(self.marginView.frame)/2.0, CGRectGetHeight(self.marginView.frame)/2.0);
            } else {
                self.popContentView.frame = [weakSelf.to CGRectValue];
                self.customView.center = CGPointMake(CGRectGetWidth(self.popContentView.frame)/2.0, CGRectGetHeight(self.popContentView.frame)/2.0);
            }

            if (self.enableAnimationAlpha) {
                self.popContentView.alpha = 1;
            }
        } completion:nil];
    } else {
        if (self.style == LYSPopStyleCenter) {
            self.popContentView.transform = [_to CGAffineTransformValue];
            self.popContentView.center = CGPointMake(CGRectGetWidth(self.marginView.frame)/2.0, CGRectGetHeight(self.marginView.frame)/2.0);
            self.customView.center = CGPointMake(CGRectGetWidth(self.marginView.frame)/2.0, CGRectGetHeight(self.marginView.frame)/2.0);
        } else {
            self.popContentView.frame = [_to CGRectValue];
            self.customView.center = CGPointMake(CGRectGetWidth(self.popContentView.frame)/2.0, CGRectGetHeight(self.popContentView.frame)/2.0);
        }
    }
}

- (void)hiddenAnimated:(BOOL)animated
{
    if (animated) {
        __weak LYSPopController *weakSelf = self;
        [UIView animateWithDuration:self.duration delay:0 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
            if (self.style == LYSPopStyleCenter) {
                self.popContentView.transform = [weakSelf.from CGAffineTransformValue];
                self.popContentView.center = CGPointMake(CGRectGetWidth(self.marginView.frame)/2.0, CGRectGetHeight(self.marginView.frame)/2.0);
                self.customView.center = CGPointMake(CGRectGetWidth(self.marginView.frame)/2.0, CGRectGetHeight(self.marginView.frame)/2.0);
            } else {
                self.popContentView.frame = [weakSelf.from CGRectValue];
                self.customView.center = CGPointMake(CGRectGetWidth(self.popContentView.frame)/2.0, CGRectGetHeight(self.popContentView.frame)/2.0);
            }
            if (self.enableAnimationAlpha) {
                self.popContentView.alpha = 0;
            }
        } completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:NO completion:nil];
        }];
    } else {
        if (self.style == LYSPopStyleCenter) {
            self.popContentView.transform = [_from CGAffineTransformValue];
            self.popContentView.center = CGPointMake(CGRectGetWidth(self.marginView.frame)/2.0, CGRectGetHeight(self.marginView.frame)/2.0);
            self.customView.center = CGPointMake(CGRectGetWidth(self.marginView.frame)/2.0, CGRectGetHeight(self.marginView.frame)/2.0);
        } else {
            self.popContentView.frame = [_from CGRectValue];
            self.customView.center = CGPointMake(CGRectGetWidth(self.popContentView.frame)/2.0, CGRectGetHeight(self.popContentView.frame)/2.0);
        }
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

