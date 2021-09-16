//
//  AXPresentationController.m
//  AXiOSKit
//
//  Created by axing on 2019/6/26.
//  Copyright © 2019 liu.weixing. All rights reserved.
//

#import "AXPresentationController.h"
@implementation AXPresentationController

/// 是在呈现过渡即将开始的时候被调用的。
- (void)presentationTransitionWillBegin {
    /// containerView 父视图,设置颜色,没有动画差异
    /// presentedView 子视图,设置颜色,有动画差异
    __weak typeof(self) weakSelf = self;
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.containerView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.5];
//        strongSelf.presentedView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.5];
    } completion:nil];
}


- (void)dismissalTransitionWillBegin {
    __weak typeof(self) weakSelf = self;
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.containerView.alpha = 0;
//        strongSelf.presentedView.alpha = 0;
    } completion:nil];
}
/// 是在呈现过渡结束时被调用的，并且该方法提供一个布尔变量来判断过渡效果是否完成
-(void)presentationTransitionDidEnd:(BOOL)completed {
    // 如果呈现没有完成，那就移除背景 View
    if (!completed) {
        
    }
}
- (void)dismissalTransitionDidEnd:(BOOL)completed {
    if (completed) {
        
    }
}

- (BOOL)shouldRemovePresentersView {
    return NO;
}

/// 还有最后一个方法需要重载。在我们的自定义呈现中，被呈现的 view 并没有完全完全填充整个屏幕，而是很小的一个矩形。被呈现的 view 的过渡动画之后的最终位置，是由 UIPresentationViewController 来负责定义的。我们重载 frameOfPresentedViewInContainerView 方法来定义这个最终位置
//- (CGRect)frameOfPresentedViewInContainerView{
//
//    CGFloat windowH = [UIScreen mainScreen].bounds.size.height;
//    CGFloat windowW = [UIScreen mainScreen].bounds.size.width;
//    self.presentedView.frame = CGRectMake(0, windowH - 298, windowW, 298);
//    return CGRectMake(0, windowH - 298, windowW, 298);
//}
@end
