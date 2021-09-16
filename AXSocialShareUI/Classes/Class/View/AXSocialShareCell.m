//
//  AXSocialSharePopCell.m
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/4/30.
//  Copyright © 2021 axinger. All rights reserved.
//

#import "AXSocialShareCell.h"
#import "Masonry.h"

#import "AXSocialShareDefine.h"
#import "AXSocialShareHelper.h"

@implementation AXSocialShareCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self _initUI];
    }
    return self;
}

-(void)_initUI {
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(0);
        make.height.width.equalTo(self.contentView.mas_height).multipliedBy(0.6);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.equalTo(self.imageView.mas_bottom).mas_equalTo(10);
    }];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel.alloc init];
        _titleLabel.font =[AXSocialShareHelper systemFont:(13)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView.alloc init];
        _imageView.backgroundColor = UIColor.clearColor;
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.cornerRadius = 10;
    }
    return _imageView;
}


- (void)setAction:(AXSocialShareOption *)action {
    _action = action;
    self.titleLabel.text = action.title;
    self.imageView.image = action.iconName;
}

@end
