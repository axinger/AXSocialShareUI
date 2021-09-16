//
//  AXSocialSharePopViewController.h
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/4/30.
//  Copyright © 2021 axinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXSocialSharePlatform.h"
#import "AXSocialShareOption.h"
#import "AXSocialShareOption.h"
NS_ASSUME_NONNULL_BEGIN
@class AXSocialShareViewController;

@protocol AXSocialShareDeleate <NSObject>

-(void)socialShareViewController:(AXSocialShareViewController *)vc
                  didShareOption:(AXSocialShareOption *)option;


@end

@interface AXSocialShareViewController : UIViewController


/// 自定义 分享类型
/// @param array array
-(instancetype )initWithShareType:(NSArray<AXSocialShareOption *>*)array;

@property(nonatomic, copy) void(^didActionBloc)(AXSocialShareOption *option);

@property(nonatomic, weak) id<AXSocialShareDeleate> deleate;

@end

NS_ASSUME_NONNULL_END
