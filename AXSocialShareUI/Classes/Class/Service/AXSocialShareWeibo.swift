//
//  AXSocialShareWeibo.swift
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/5/7.
//  Copyright © 2021 axinger. All rights reserved.
//

import MonkeyKing

@objcMembers public class AXSocialShareWeibo: NSObject, AXShareProtocol {
    var accessToken: String?
    
    override init() {
        super.init()
        registerAccount()
    }
    
    /// 判断是否安装
    public func isInstalled() -> Bool {
        return MonkeyKing.SupportedPlatform.weibo.isAppInstalled
    }
    
    /// 第三方平台注册
    public func registerAccount() {
        let account = MonkeyKing.Account.weibo(appID: AXShareConfigs.Weibo.appID,
                                               appKey: AXShareConfigs.Weibo.appKey,
                                               redirectURL: AXShareConfigs.Weibo.redirectURL,
                                               universalLink: AXShareConfigs.Weibo.universalLink)
        MonkeyKing.registerAccount(account)
    }
    
    /// 微信授权
    public func oauth() {
        if !MonkeyKing.SupportedPlatform.weibo.isAppInstalled {
            MonkeyKing.oauth(for: .weibo) { [weak self] result in
                switch result {
                case let .success(info):
                    if let accessToken = info?["access_token"] as? String {
                        self?.accessToken = accessToken
                    }
                case let .failure(error):
                    print("error: \(String(describing: error))")
                }
            }
        }
    }
    
    /// 分享微博
    public func share(item: AXSocialShareInfoItem, block: AXSocialShareCompletionHandler?) {
        let info = MonkeyKing.Info(
            title: item.title,
            description: item.subTitle,
            thumbnail: item.thumbnail,
            media: item.toMedia()
        )
        let message = MonkeyKing.Message.weibo(.default(info: info, accessToken: accessToken))
        MonkeyKing.deliver(message) { result in
            print("AXSocialShareWeibo 分享微博 = result: \(result)")
            actionResult(result, block)
        }
    }
}
