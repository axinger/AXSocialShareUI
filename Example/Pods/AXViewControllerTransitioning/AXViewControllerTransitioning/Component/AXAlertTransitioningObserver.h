//
//  AXAlertTransitioningObserver.h
//  AXiOSKit
//
//  Created by 小星星吃KFC on 2020/11/27.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AXAlertControllerStyle){
    AXAlertControllerStyleUpward = UIAlertControllerStyleActionSheet,// 从下往上
    AXAlertControllerStyleCentre = UIAlertControllerStyleAlert   // 从中间放大弹出
};

NS_ASSUME_NONNULL_BEGIN

@interface AXAlertTransitioningObserver : NSObject<UIViewControllerTransitioningDelegate>

/// 转场动画样式
@property (nonatomic, assign)AXAlertControllerStyle alertControllerStyle;

@end

NS_ASSUME_NONNULL_END
