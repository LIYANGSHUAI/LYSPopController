//
//  ViewController.m
//  LYSPopControllerDemo
//
//  Created by HENAN on 2018/7/9.
//  Copyright © 2018年 liyangshuai. All rights reserved.
//

#import "ViewController.h"
#import "LYSPopController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *bottomAlert = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-120)/2.0, 200, 120, 40)];
    [bottomAlert setTitle:@"底部弹出" forState:(UIControlStateNormal)];
    bottomAlert.backgroundColor = [UIColor redColor];
    [bottomAlert addTarget:self action:@selector(bottomAlert:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:bottomAlert];
    
}

- (void)bottomAlert:(UIButton *)sender
{
    UIDatePicker *date = [[UIDatePicker alloc] init];
    
    LYSPopController *popVC = [[LYSPopController alloc] initWithCustomView:date];
    popVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:popVC animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
