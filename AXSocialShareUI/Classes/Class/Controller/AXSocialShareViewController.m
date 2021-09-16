//
//  AXSocialSharePopViewController.m
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/4/30.
//  Copyright © 2021 axinger. All rights reserved.
//

#import "AXSocialShareViewController.h"
#import "AXSocialShareView.h"
#import "AXSocialShareOption.h"
#import "AXSocialSharePlatform.h"
@import AXViewControllerTransitioning;
#import <ReactiveObjC/ReactiveObjC.h>
#define QQ_ID       @"id444934666"
#define WEIBO_ID    @"id350962117"
#define WEIXIN_ID   @"id414478124"
#import <AXSocialShareUI/AXSocialShareUI-Swift.h>
#import "AXSocialShareHelper.h"
@interface AXSocialShareViewController ()

@property(nonatomic, strong) AXSocialShareView *view;

@property(nonatomic, strong) NSArray<AXSocialShareOption *> *dataArray;

@end

@implementation AXSocialShareViewController

@dynamic view;
- (void)loadView {
    [super loadView];
    self.view = [[AXSocialShareView alloc]init];
}
- (void)setView:(AXSocialShareView *)view {
    [super setView:view];
}
- (AXSocialShareView *)view {
    return (AXSocialShareView *)[super view];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self ax_alertObserver:^(AXAlertTransitioningObserver *observer) {
            observer.alertControllerStyle = AXAlertControllerStyleUpward;
        }];
    }
    return self;
}

/// 自定义 分享类型
/// @param array array
-(instancetype )initWithShareType:(NSArray<AXSocialShareOption *>*)array {
    if (self = [self init]) {
        self.dataArray = array;
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initData];
}


-(void)_initData {
    self.view.dataArray = self.dataArray.copy;
    [self.view.cancelButton addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)cancelAction:(UIButton *)btn {
    [self dismiss];
}

/// 调用者自控制是否点击空白页面 消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([touches.anyObject.view isEqual:self.view]) {
        [self dismiss];
    }
}

-(void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"dealloc-%@",self.class);
}

- (NSArray<AXSocialShareOption *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSArray.alloc init];
        
        NSMutableArray<NSDictionary<NSString*,id> *> *temp = @[].mutableCopy;
#ifndef DEBUG
        if (AXSocialShareSevice.shared.weChat.isInstalled) {
#endif
            [temp addObject:@{@"title" :@"微信",
                              @"appName":@"微信",
                              @"appId":WEIXIN_ID,
                              @"iconName":@"sns_icon_22",
                              @"type":AXSocialSharePlatformWeiChatSession}];
            
            [temp addObject:@{@"title" :@"微信朋友圈",
                              @"appName":@"微信",
                              @"appId":WEIXIN_ID,
                              @"iconName":@"sns_icon_23",
                              @"type":AXSocialSharePlatformWeiChatTimeLine}];
#ifndef DEBUG
        }
#endif
        
#ifndef DEBUG
        if (AXSocialShareSevice.shared.weibo.isInstalled) {
#endif
            [temp addObject: @{@"title" :@"新浪微博",
                               @"appName":@"微博",
                               @"appId":WEIBO_ID,
                               @"iconName":@"sns_icon_1",
                               @"type":AXSocialSharePlatformSinaWeibo}];
#ifndef DEBUG
        }
#endif
        
#ifndef DEBUG
        if (AXSocialShareSevice.shared.qq.isInstalled) {
#endif
            [temp addObject:@{@"title" :@"QQ",
                              @"appName":@"QQ",
                              @"appId":QQ_ID,
                              @"iconName":@"sns_icon_24",
                              @"type":AXSocialSharePlatformQQFriends}];
#ifndef DEBUG
        }
#endif
        
        NSMutableArray<AXSocialShareOption *> *array = NSMutableArray.array;
        
        [temp enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
            
            AXSocialShareOption *option = AXSocialShareOption.alloc.init;
            option.title = dict[@"title"];
            option.appName =  dict[@"appName"];
            option.appLink = [NSString stringWithFormat:@"https://apps.apple.com/cn/app/%@",dict[@"appId"]];
            option.type =  dict[@"type"];;
            option.iconName = [AXSocialShareHelper imageWithName:dict[@"iconName"]];
            @weakify(self)
            @weakify(option)
            option.didBlock = ^(AXSocialSharePlatform type) {
                @strongify(self)
                @strongify(option)
                [self dismissViewControllerAnimated:YES completion:^{
                    if (self.didActionBloc) {
                        self.didActionBloc(option);
                    }
                    if (self.deleate &&
                        [self.deleate respondsToSelector:@selector(socialShareViewController:didShareOption:)]) {
                        [self.deleate socialShareViewController:self didShareOption:option];
                    }
                }];
            };
            [array addObject:option];
        }];
        
        _dataArray = array.copy;
    }
    return _dataArray;
}
@end
