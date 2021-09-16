# AXViewControllerTransitioning

[![CI Status](https://img.shields.io/travis/axinger/AXViewControllerTransitioning.svg?style=flat)](https://travis-ci.org/axinger/AXViewControllerTransitioning)
[![Version](https://img.shields.io/cocoapods/v/AXViewControllerTransitioning.svg?style=flat)](https://cocoapods.org/pods/AXViewControllerTransitioning)
[![License](https://img.shields.io/cocoapods/l/AXViewControllerTransitioning.svg?style=flat)](https://cocoapods.org/pods/AXViewControllerTransitioning)
[![Platform](https://img.shields.io/cocoapods/p/AXViewControllerTransitioning.svg?style=flat)](https://cocoapods.org/pods/AXViewControllerTransitioning)

![iShot2021-02-27 21 04 37](https://user-images.githubusercontent.com/18339649/109388024-9d117680-793f-11eb-988a-7fced3d3242d.gif)![iShot2021-02-27 21 05 48](https://user-images.githubusercontent.com/18339649/109388029-a0a4fd80-793f-11eb-8386-245690c1461a.gif)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

AXViewControllerTransitioning is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AXViewControllerTransitioning'
```
UIViewController 自定义 转场动画,封装与UIAlertViewController效果一样,遵循MVC模式
```
#import <AXAlertTransitioningObserver/UIViewController+AXTransitioning.h>
```
- 在对应ViewControlle 重写此方法
```
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self ax_alertObserver:^(AXAlertTransitioningObserver *observer) {
            observer.alertControllerStyle = AXAlertControllerStyleCentre;
        }];
    }
    return self;
}
```
```
/// 调用者自控制是否点击空白页面 消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}
```
## Author

axinger, axinger@outlook.com

## License

AXViewControllerTransitioning is available under the MIT license. See the LICENSE file for more info.
