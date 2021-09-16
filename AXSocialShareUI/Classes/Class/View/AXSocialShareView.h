//
//  AXSocialSharePopView.h
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/4/30.
//  Copyright © 2021 axinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXSocialShareOption.h"
NS_ASSUME_NONNULL_BEGIN

@interface AXSocialShareView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

/// 白色背景
@property(nonatomic,strong)UIView *contentView;

@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic, strong) NSArray<AXSocialShareOption*> *dataArray;

@property(nonatomic, strong) UIButton *cancelButton;


@end

NS_ASSUME_NONNULL_END
