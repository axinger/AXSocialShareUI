//
//  AXSocialShareConfig.swift
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/5/7.
//  Copyright © 2021 axinger. All rights reserved.
//
protocol AXShareProtocol {
    
    /// 判断是否安装
    func isInstalled() -> Bool
    
    /// 第三方平台注册
    func registerAccount()
}

struct AXShareConfigs {
    
    struct Weibo {
        static let appID = ""
        static let appKey = ""
        static let redirectURL = ""
        static let universalLink: String? = nil
    }
    
    struct WeChat {
        static let appID = ""
        static let appKey: String? = nil
        static let miniAppID: String? = nil
        static let universalLink: String = ""
    }
    
    struct QQ {
        static let appID = "1103099842"
        static let appKey: String? = nil
        static let universalLink: String = ""
    }
    
}


