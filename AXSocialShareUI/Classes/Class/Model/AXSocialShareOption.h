//
//  AXSocialSharePopAction.h
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/4/30.
//  Copyright © 2021 axinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXSocialSharePlatform.h"

NS_ASSUME_NONNULL_BEGIN

@interface AXSocialShareOption : NSObject

@property(nonatomic, copy) NSString *title;

@property(nonatomic, copy) NSString *appName;

/// 下载地址
@property(nonatomic, copy) NSString *appLink;

@property(nonatomic, strong) UIImage *iconName;

@property(nonatomic, copy) AXSocialSharePlatform type;

@property(nonatomic, copy) void(^didBlock)(AXSocialSharePlatform type);


@end

NS_ASSUME_NONNULL_END
