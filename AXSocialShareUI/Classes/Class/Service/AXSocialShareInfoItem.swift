//
//  AXSocialShareItem.swift
//  DLAppStore
//
//  Created by 小星星吃KFC on 2021/5/7.
//  Copyright © 2021 axinger. All rights reserved.
//

import MonkeyKing

//    public enum Media {
//        case url(URL)
//        case image(UIImage)
//        case imageData(Data)
//        case gif(Data)
//        case audio(audioURL: URL, linkURL: URL?)
//        case video(URL)
//        case file(Data, fileExt: String?) /// file extension for wechat file share
//        case miniApp(url: URL, path: String, withShareTicket: Bool, type: MiniAppType)
//    }
@objcMembers public class AXSocialShareInfoItem: NSObject {
    
    @objc public enum DLMiniAppType: Int {
        case release = 0
        case test = 1
        case preview = 2
    }
    
    @objc public enum AXSocialShareInfoType: Int {
        case url
        case image
        case imageData
        case gif
        case audio
        case video
        case file
        case miniApp
    }
    
    public  var title:String?
    public var subTitle:String?
    public var thumbnail:UIImage?
    
    // oc 无法调用swift值枚举
    public var mediaType:AXSocialShareInfoType = .url
    
    //  case url(URL) mediaType = 0
    public var url:URL!
    
    // case image(UIImage) mediaType = 1
    public var image:UIImage!
    
    //  case imageData(Data) mediaType = 2
    public var imageData:Data!
    
    //  case gif(Data) mediaType = 3
    public var gifData:Data!
    
    // case audio mediaType = 4
    public  var audioURL: URL!, linkURL: URL?
    
    // case video(URL) mediaType = 5
    public var videoURL: URL!
    
    public var file: Data!, fileExt: String? /// file
    
    //  case miniApp mediaType = 6
    public var mimiURL: URL!, path: String!, ticket: Bool!, miniType: DLMiniAppType = .release
    
    public func toMedia() -> MonkeyKing.Media {
        
        switch mediaType {
        case .url:
            return MonkeyKing.Media.url(url)
        case .image:
            return MonkeyKing.Media.image(image)
        case .imageData:
            return MonkeyKing.Media.imageData(imageData)
        case .gif:
            return MonkeyKing.Media.gif(gifData)
        case .audio:
            return MonkeyKing.Media.audio(audioURL: audioURL, linkURL: linkURL)
        case .video:
            return MonkeyKing.Media.video(videoURL)
        case .file:
            return MonkeyKing.Media.file(file, fileExt: fileExt)
        case .miniApp:
            return MonkeyKing.Media.miniApp(url: mimiURL,
                                            path: path,
                                            withShareTicket: ticket,
                                            type: MonkeyKing.MiniAppType(rawValue: miniType.rawValue) ?? MonkeyKing.MiniAppType.release, userName: nil)
            
        }
        
    }
}

