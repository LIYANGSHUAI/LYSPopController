//
//  LYSPopController.m
//  LYSPopControllerDemo
//
//  Created by HENAN on 2018/7/9.
//  Copyright © 2018年 liyangshuai. All rights reserved.
//

#import "LYSPopController.h"

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
    self.popHeight = 216;
}

- (UIView *)customView
{
    if (!_customView) {
        _customView = [[LYSPopContentView alloc] init];
    }
    return _customView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.customView.frame = CGRectMake(0, CGRectGetHeight(self.view.frame), CGRectGetWidth(self.view.frame), self.popHeight);
    self.customView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.customView];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.customView.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - self.popHeight, CGRectGetWidth(self.view.frame), self.popHeight);
    } completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.customView.frame = CGRectMake(0, CGRectGetHeight(self.view.frame), CGRectGetWidth(self.view.frame), self.popHeight);
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation LYSPopContentView

@end
