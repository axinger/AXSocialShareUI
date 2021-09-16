//
//  UIViewController+AXTransitioning.h
//  AXiOSKit
//
//  Created by liuweixing on 16/6/15.
//  Copyright © 2016年 liuweixing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXAlertTransitioningObserver.h"

@interface UIViewController (AXTransitioning)

/**
 #import "UIViewController+AXTransitioning.h"
 
 - (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
     if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
         [self ax_alertObserver:^(AXAlertTransitioningObserver *observer) {
             observer.alertControllerStyle = AXAlertControllerStyleCentre;
         }];
     }
     return self;
 }
 /// 调用者自控制是否点击空白页面 消失
 - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     if ([touches.anyObject.view isEqual:self.view]) {
         [self dismissViewControllerAnimated:YES completion:nil];
     }
 }
 */
/// 自定义alert样式, 主要view背景色不能自行添加颜色,必须保持透明
/// @param handler 参数回调
-(void)ax_alertObserver:(void(^)(AXAlertTransitioningObserver *observer))handler;

@end
