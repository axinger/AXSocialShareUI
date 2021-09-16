//
//  AXSocialShareUtil.swift
//  AXiOSKit
//
//  Created by 小星星吃KFC on 2021/4/26.
//  Copyright © 2021 axinger. All rights reserved.
//

import MonkeyKing
import UIKit

public typealias AXSocialShareCompletionHandler = (_ result: Bool, _ error: Error?) -> Void

/// MonkeyKing 不支持oc调用,需要封装一层
/// oc 不知道怎么调用 MonkeyKing.framework
@objcMembers public class AXSocialShareSevice: NSObject {
    
    public static let shared = AXSocialShareSevice()
    
    private override init() {}
    
    public override func copy() -> Any {
        return self
    }
    
    public override func mutableCopy() -> Any {
        return self
    }
    
    // Optional
    func reset() {
    }
    
    private let _weibo = AXSocialShareWeibo()
    private let _weChat = AXSocialShareWeChat()
    private let _qq = AXScoialShareQQ()

    /// 表示当前类是否在使用,临时区分 handleOpenUrl
    var isStart: Bool = false

    ///  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool
    public func handleOpen(url: URL) -> Bool {
        if !isStart {
            return false
        }

        isStart = false
        return MonkeyKing.handleOpenURL(url)
    }

    /// func application(_ application: UIApplication, handleOpen url: URL) -> Bool
    public func handleOpen(userActivity: NSUserActivity) -> Bool {
        return MonkeyKing.handleOpenUserActivity(userActivity)
    }

    /// 分享
    public func share(type: AXSocialSharePlatform, item: AXSocialShareInfoItem, block: AXSocialShareCompletionHandler?) {
        if type.isEqual(to: AXSocialSharePlatformWeiChatSession) {
            if !weChat.isInstalled() {
                block!(false, error(code: -2, msg: "未安装"))
            } else {
                weChat.share(type: .session, item: item, block: block)
            }

        } else if type.isEqual(to: AXSocialSharePlatformWeiChatTimeLine) {
            if !weChat.isInstalled() {
                block!(false, error(code: -2, msg: "未安装"))
            } else {
                weChat.share(type: .timeLine, item: item, block: block)
            }
        } else if type.isEqual(to: AXSocialSharePlatformSinaWeibo) {
            if !weibo.isInstalled() {
                block!(false, error(code: -2, msg: "未安装"))
            } else {
                weibo.share(item: item, block: block)
            }
        } else if type.isEqual(to: AXSocialSharePlatformQQFriends) {
            if !qq.isInstalled() {
                block!(false, error(code: -2, msg: "未安装"))
            } else {
                qq.share(type: .friends, item: item, block: block)
            }
        }
    }
}

extension AXSocialShareSevice {
    public var weibo: AXSocialShareWeibo {
        isStart = true
        return _weibo
    }

    public var weChat: AXSocialShareWeChat {
        isStart = true
        return _weChat
    }

    public var qq: AXScoialShareQQ {
        isStart = true
        return _qq
    }
}

func error(code: Int, msg: String) -> NSError {
    return NSError(domain: "com.dl.mam.service.error",
                   code: code,
                   userInfo: [NSLocalizedDescriptionKey: msg])
}

func error(msg: String) -> NSError {
    return NSError(domain: "com.dl.mam.service.error",
                   code: -1,
                   userInfo: [NSLocalizedDescriptionKey: msg])
}

func actionResult(_ result: Result<MonkeyKing.ResponseJSON?, MonkeyKing.Error>, _ block: AXSocialShareCompletionHandler?) {
    switch result {
    case .success:
        block!(true, nil)
    case .failure(.noApp):
        block!(false, error(msg: "未安装app"))
    case .failure(.userCancelled):
        block!(false, error(msg: "用户取消操作"))
    case .failure(.resource(_)):
        block!(false, error(msg: "资源错误"))
    case .failure(.sdk(_)):
        block!(false, error(msg: "sdk错误"))
    case .failure(.apiRequest(_)):
        block!(false, error(msg: "api错误"))
    case .failure(.noAccount):
        block!(false, error(msg: "没有账号"))
    }
}
