//
//  AXSocialSharePopCell.h
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/4/30.
//  Copyright © 2021 axinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXSocialShareOption.h"

NS_ASSUME_NONNULL_BEGIN

@interface AXSocialShareCell : UICollectionViewCell

@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UIImageView *imageView;

@property(nonatomic, strong) AXSocialShareOption *action;

@end

NS_ASSUME_NONNULL_END
