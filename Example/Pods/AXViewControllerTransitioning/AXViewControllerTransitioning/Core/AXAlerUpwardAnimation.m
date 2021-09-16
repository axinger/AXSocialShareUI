//
//  AXAlerUpwardAnimation.m
//  AXiOSKitDemo
//
//  Created by liuweixing 2018/6/4.
//  Copyright © 2018年 AX. All rights reserved.
//

#import "AXAlerUpwardAnimation.h"
#import "AXCoreDefine.h"

static  NSTimeInterval const presentTime = 0.3;
static  NSTimeInterval const dismissTime = 0.1;

@implementation AXAlerUpwardAnimation

- (NSTimeInterval)transitionDuration:
    (id<UIViewControllerContextTransitioning>)transitionContext
{

    UIViewController* toVC = [transitionContext
        viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromVC = [transitionContext
        viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (toVC.isBeingPresented) {
        return presentTime;
    } else if (fromVC.isBeingDismissed) {
        return dismissTime;
    }else{
        return presentTime;
    }

   
}

- (void)animateTransition:
    (id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toVC = [transitionContext
        viewControllerForKey:UITransitionContextToViewControllerKey];

    UIViewController* fromVC = [transitionContext
        viewControllerForKey:UITransitionContextFromViewControllerKey];

    if (!toVC || !fromVC) {
        return;
    }
    UIView* containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    if (toVC.isBeingPresented) {
        // 控制器对应的view
        UIView* toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        toView.frame = containerView.bounds;
        toView.center = CGPointMake(containerView.center.x, containerView.bounds.size.height);
//        toView.backgroundColor = [UIColor clearColor];
        [containerView addSubview:toView];

        [UIView animateWithDuration:duration
            animations:^{
                toView.center = containerView.center;
            }
            completion:^(BOOL finished) {
                [transitionContext
                    completeTransition:![transitionContext transitionWasCancelled]];
            }];

    } else if (fromVC.isBeingDismissed) {

        [UIView animateWithDuration:duration
            animations:^{
                fromVC.view.alpha = 0.0;
            }
            completion:^(BOOL finished) {
                [transitionContext
                    completeTransition:![transitionContext transitionWasCancelled]];
            }];

    } else {
    }
}


@end
