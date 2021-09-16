//
//  AXSocialShareWeChatInfo.h
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/5/8.
//  Copyright © 2021 axinger. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface AXSocialShareInfo : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *desc;
@property(nonatomic, copy) NSString *imgUrl;
@property(nonatomic, copy) NSString *link;
@property(nonatomic, strong) UIImage *thumbImage;


@end

NS_ASSUME_NONNULL_END
