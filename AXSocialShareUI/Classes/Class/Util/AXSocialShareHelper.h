//
//  UIImage+AXSocialShareUI.h
//  AXSocialShareUI
//
//  Created by 小星星吃KFC on 2021/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface AXSocialShareHelper : NSObject

/// 获取 图片资源
/// @param name 图片名
+ (nullable UIImage *)imageWithName:(NSString *)name;

+(UIFont *)boldFont:(CGFloat)size;

+(UIFont *)systemFont:(CGFloat)size;

+(UIFont *)weightBoldFont:(CGFloat)size;

+(CGFloat )getValue:(CGFloat)value;


@end

NS_ASSUME_NONNULL_END
