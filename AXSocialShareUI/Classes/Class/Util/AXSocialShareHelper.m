//
//  UIImage+AXSocialShareUI.m
//  AXSocialShareUI
//
//  Created by 小星星吃KFC on 2021/7/16.
//

#import "AXSocialShareHelper.h"

#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define adapterNum (SCREEN_WIDTH/375.0)
#define GET_VALUE(x) (adapterNum*(x))
#define Get_FontSize(value)    value*(SCREEN_WIDTH==414 ? 1.1 : 1)

@implementation AXSocialShareHelper

+ (UIImage *)imageWithName:(NSString *)name {
    static NSBundle *resourceBundle = nil;
    if (!resourceBundle) {
        NSBundle *currentBundle = [NSBundle bundleForClass:self.class];
        NSString *resourcePath = [currentBundle pathForResource:@"AXSocialShareUI" ofType:@"bundle"];
        resourceBundle = [NSBundle bundleWithPath:resourcePath] ?: currentBundle;
    }
    UIImage *image = [UIImage imageNamed:name inBundle:resourceBundle compatibleWithTraitCollection:nil];
    return image;
}

+(UIFont *)boldFont:(CGFloat)size {
    return [UIFont boldSystemFontOfSize:Get_FontSize(size)];
}

+(UIFont *)systemFont:(CGFloat)size {
    return [UIFont systemFontOfSize:Get_FontSize(size)];
}

+(UIFont *)weightBoldFont:(CGFloat)size {
    return [UIFont systemFontOfSize:Get_FontSize(size) weight:UIFontWeightBold];
}

+(CGFloat )getValue:(CGFloat)value {
    return GET_VALUE((value));
}

@end
