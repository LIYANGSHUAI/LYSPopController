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
    
    
    NSArray *titleAry = @[@"上",@"下",@"左",@"右",@"中间"];
    
    for (int i = 0; i < [titleAry count]; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-120)/2.0, 150+50*i, 120, 40)];
        [btn setTitle:titleAry[i] forState:(UIControlStateNormal)];
        btn.backgroundColor = [UIColor redColor];
        [btn addTarget:self action:@selector(btnAlert:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:btn];
        btn.tag = 200+i;
    }

}

- (void)btnAlert:(UIButton *)sender
{
    UIImageView *view = [[UIImageView alloc] init];
    view.image = [UIImage imageNamed:@"33411601.jpeg"];
    
    LYSPopController *popVC = nil;
    
    switch (sender.tag-200) {
        case 0:
        {
            view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame)-20, 200);
            popVC = [[LYSPopController alloc] initWithStyle:(LYSPopStyleTop) popSpacing:200 customView:view];
        }
            break;
        case 1:
        {
            view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200);
            popVC = [[LYSPopController alloc] initWithStyle:(LYSPopStyleBottom) popSpacing:200 customView:view];
        }
            break;
        case 2:
        {
            view.frame = CGRectMake(0, 0, 200, CGRectGetHeight(self.view.frame));
            popVC = [[LYSPopController alloc] initWithStyle:(LYSPopStyleLeft) popSpacing:200 customView:view];
        }
            break;
        case 3:
        {
            view.frame = CGRectMake(0, 0, 200, CGRectGetHeight(self.view.frame));
            popVC = [[LYSPopController alloc] initWithStyle:(LYSPopStyleRight) popSpacing:200 customView:view];
        }
            break;
        case 4:
        {
            view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200);
            popVC = [[LYSPopController alloc] initWithStyle:(LYSPopStyleCenter) popSpacing:200 customView:view];
        }
            break;
        default:
            break;
    }
    [self alertPopController:popVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
