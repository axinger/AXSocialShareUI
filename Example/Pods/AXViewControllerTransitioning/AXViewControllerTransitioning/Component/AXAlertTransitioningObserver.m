//
//  AXAlertTransitioningObserver.m
//  AXiOSKit
//
//  Created by 小星星吃KFC on 2020/11/27.
//

#import "AXAlertTransitioningObserver.h"
#import "AXAlertCentreAnimation.h"
#import "AXAlerUpwardAnimation.h"
#import "AXPresentationController.h"

@implementation AXAlertTransitioningObserver

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.alertControllerStyle = AXAlertControllerStyleUpward;
    }
    return self;
}

#pragma mark - 转场动画 UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    switch (self.alertControllerStyle) {
        case AXAlertControllerStyleCentre:
            return [[AXAlertCentreAnimation alloc] init];
            break;

        default:
            return [[AXAlerUpwardAnimation alloc] init];
            break;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    switch (self.alertControllerStyle) {
        case AXAlertControllerStyleCentre:
            return [[AXAlertCentreAnimation alloc] init];
            break;

        default:
            return [[AXAlerUpwardAnimation alloc] init];
            break;
    }
}

/**
 * 这个不知道具体能干嘛
 */
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                               presentingViewController:(nullable UIViewController *)presenting
                                                                   sourceViewController:(UIViewController *)source {
    AXPresentationController *vc = [[AXPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return vc;
}

@end
