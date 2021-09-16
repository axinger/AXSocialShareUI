//
//  UIViewController+AXTransitioning.m
//  AXiOSKit
//
//  Created by liuweixing on 16/6/15.
//  Copyright © 2016年 liuweixing All rights reserved.
//

#import "UIViewController+AXTransitioning.h"
#import <objc/runtime.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface UIViewController ()

@property (nonatomic, strong) AXAlertTransitioningObserver *alertObserver;

@end

@implementation UIViewController (AXTransitioning)


- (AXAlertTransitioningObserver *)alertObserver {
    return objc_getAssociatedObject(self,@selector(alertObserver));
}
- (void)setAlertObserver:(AXAlertTransitioningObserver *)alertObserver {
    objc_setAssociatedObject(self, @selector(alertObserver),alertObserver, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)ax_alertObserver:(void(^)(AXAlertTransitioningObserver *observer))handler {
    
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.alertObserver = [[AXAlertTransitioningObserver alloc] init];
    if(handler){
        handler(self.alertObserver);
    }
    self.transitioningDelegate = self.alertObserver;
    @weakify(self)
    if ([self respondsToSelector:@selector(viewDidLoad)]) {
        [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id  _Nullable x) {
            @strongify(self)
            self.view.backgroundColor = UIColor.clearColor;
        }];
    }
    
}
@end
