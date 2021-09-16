//
//  AXSocialShareQQ.swift
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/5/7.
//  Copyright © 2021 axinger. All rights reserved.
//
import MonkeyKing

@objcMembers public class AXScoialShareQQ: NSObject,AXShareProtocol {
    
    public enum DLQQType  {
        case friends
        case zone
        case favorites
        case dataline
    }
    
    override init() {
        super.init()
        registerAccount()
    }
    
    /// 判断是否安装
    public  func isInstalled() -> Bool {
        return MonkeyKing.SupportedPlatform.qq.isAppInstalled
    }
    
    /// 第三方平台注册
    public  func registerAccount() {
        let account = MonkeyKing.Account.qq(appID: AXShareConfigs.QQ.appID,
                                            universalLink: AXShareConfigs.QQ.universalLink)
        MonkeyKing.registerAccount(account)
    }
    
    
    
    /// 分享QQ
    public   func share(type:DLQQType ,item:AXSocialShareInfoItem, block:AXSocialShareCompletionHandler? ) {
        
        registerAccount()
        
        var subtype: MonkeyKing.Message.QQSubtype!
        let info = MonkeyKing.Info(
            title: item.title,
            description: item.subTitle,
            thumbnail: item.thumbnail,
            media: item.toMedia()
        )
        
        switch type {
        case .friends:
            subtype = MonkeyKing.Message.QQSubtype.friends(info: info)
            
        case .zone:
            subtype = MonkeyKing.Message.QQSubtype.zone(info: info)
            
        case .favorites:
            subtype = MonkeyKing.Message.QQSubtype.favorites(info: info)
        case .dataline:
            subtype = MonkeyKing.Message.QQSubtype.dataline(info:info)
        }
        
        let message = MonkeyKing.Message.qq(subtype)
        MonkeyKing.deliver(message) { result in
            print("AXSocialShareQQ 分享qq type = \(type), result =  \(result)")
            actionResult(result,block)
        }
    }
    
    
}
