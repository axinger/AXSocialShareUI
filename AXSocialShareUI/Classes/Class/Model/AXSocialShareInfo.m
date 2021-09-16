//
//  AXSocialShareWeChatInfo.m
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/5/8.
//  Copyright © 2021 axinger. All rights reserved.
//

#import "AXSocialShareInfo.h"

@implementation AXSocialShareInfo

- (NSString *)title {
    if (!_title) {
        _title = @"i国网";
    }
    return _title;
}

- (NSString *)desc {
    if (!_desc) {
        _desc = [NSString stringWithFormat:@"%@分享地址:%@",@"i国网",@""];
    }
    return _desc;
}

- (UIImage *)thumbImage {
    if (!_thumbImage) {
        _thumbImage = [UIImage imageNamed:@""];
    }
    return _thumbImage;
}
- (NSString *)link {
    if (!_link) {
        _link = @"";
    }
    return _link;
}
@end
