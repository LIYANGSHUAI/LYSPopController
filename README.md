# LYSPopController

当前支持最高版本:0.0.3

LYSPopController is mainly a user page pops up a pop-up window in response to an event, prompting user information

![iOS技术群群二维码](https://github.com/LIYANGSHUAI/LYSPopController/blob/master/resource/iOS技术群群二维码.JPG)

```objc
-> LYSPopController (版本号)
LYSPopController,I hope everyone will give me some advice during the process of use. I want to go further."
s.description.
pod 'LYSDatePicker', '~> 版本号'
- Homepage: https://github.com/LIYANGSHUAI/LYSPopController
- Source:   https://github.com/LIYANGSHUAI/LYSPopController.git
- Versions: 版本列表 [master repo]
(END)
```

![弹窗](https://github.com/LIYANGSHUAI/LYSPopController/blob/master/resource/弹窗.gif)

具体效果图:

![上](https://github.com/LIYANGSHUAI/LYSPopController/blob/master/resource/上.png)
![下](https://github.com/LIYANGSHUAI/LYSPopController/blob/master/resource/下.png)
![左](https://github.com/LIYANGSHUAI/LYSPopController/blob/master/resource/左.png)
![右](https://github.com/LIYANGSHUAI/LYSPopController/blob/master/resource/右.png)


```objc
UIView *view = [[UIView alloc] init];
view.backgroundColor = [UIColor redColor];
view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame)-20, 120);
LYSPopController *popVC = [[LYSPopController alloc] initWithStyle:(LYSPopStyleTop) popSpacing:120 customView:view];;
[self alertPopController:popVC];
```

```objc
UIView *view = [[UIView alloc] init];
view.backgroundColor = [UIColor redColor];
view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame)-20, 120);
LYSPopController *popVC = [[LYSPopController alloc] initWithStyle:(LYSPopStyleBottom) popSpacing:120 customView:view];;
[self alertPopController:popVC];
```

```objc
UIView *view = [[UIView alloc] init];
view.backgroundColor = [UIColor redColor];
view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame)-20, 120);
LYSPopController *popVC = [[LYSPopController alloc] initWithStyle:(LYSPopStyleLeft) popSpacing:120 customView:view];;
[self alertPopController:popVC];
```

```objc
UIView *view = [[UIView alloc] init];
view.backgroundColor = [UIColor redColor];
view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame)-20, 120);
LYSPopController *popVC = [[LYSPopController alloc] initWithStyle:(LYSPopStyleRight) popSpacing:120 customView:view];;
[self alertPopController:popVC];
```

```objc
UIView *view = [[UIView alloc] init];
view.backgroundColor = [UIColor redColor];
view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame)-20, 120);
LYSPopController *popVC = [[LYSPopController alloc] initWithStyle:(LYSPopStyleCenter) popSpacing:120 customView:view];;
[self alertPopController:popVC];
```
