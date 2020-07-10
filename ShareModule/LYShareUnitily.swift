//
//  LYShareUnitily.swift
//  WKCat
//
//  Created by anita on 2020/7/10.
//  Copyright © 2020 anita. All rights reserved.
//

import Foundation
import UIKit
class LYActivity: UIActivity
{
    
    let LGActivityType =  "LGActivityType"
    
    var lgTitle: String?
    var lgImage: UIImage?
    var lgUrl: URL?
    var lgShareContexts: [Any]?
    //设置title  和 image会在弹出视图里面出现一个自定义的应用，title为应用名称  image为应用图标  shareContext是存放分享的内容的
    convenience init(title: String, image: UIImage, url: URL?, shareContext:[Any]) {
        self.init()
        lgTitle = title
        lgImage = image
        if url != nil {
           lgUrl = url
        }
        lgShareContexts = shareContext
    }
    
    override init() {
        super.init()
    }
    
    // default is UIActivityCategoryAction.
    override class var activityCategory: UIActivity.Category {
        return .share
    }
    
    // default returns nil. subclass must override and must return non-nil value
    override var activityImage: UIImage? {
        return lgImage
    }
    
    // default returns nil. subclass must override and must return non-nil value
    override var activityTitle: String? {
        return lgTitle
    }
    
    var activityUrl: URL? {
        return lgUrl
    }
    
    // default returns nil. subclass may override to return custom activity type that is reported to completion handler
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType(rawValue: LGActivityType)
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        if activityItems.count > 0 {
            return true;
        }
        return false;
    }
    
     //准备分享所进行的方法，通常在这个方法里面，把item中的东西保存下来,items就是要传输的数据
    override func prepare(withActivityItems activityItems: [Any]) {
        print("activityItems --- \(activityItems)")
    }
    
    override func perform() {
    ///在这里写你自定义的应用 分享点击以后需要做的操作，比如点击需要打开链接、复制等等
        self.activityDidFinish(true)
    }
}

class LYSystemShare: NSObject {
    
    var parentVc: UIViewController?

    static let `default` = LYSystemShare()
    private override init() {
        super.init()
    }
    ///这里我设置了配置链接是可选的
    func startShare(shreVC: UIViewController, orText: String, trText: String, shareUrl: URL?) {
        parentVc = shreVC
        var activityItems = [Any]()
        if shareUrl == nil {
            activityItems = [orText, trText]
        } else {
            activityItems = [orText, trText,  shareUrl as Any]
        }
        let activity = LYActivity(title: "中国第一资讯平台", image: UIImage(systemName: "message.fill")!, url: URL(string: "https://www.baidu.com"), shareContext: activityItems)
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: [activity])
        //表示去掉不想显示的按钮  即第一点里面所包含的type 放到这里
        activityVC.excludedActivityTypes = []
  
        activityVC.isModalInPopover = true
        shreVC.present(activityVC, animated: true, completion: nil)
    }
}
