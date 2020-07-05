//
//  PFStorebordTool.swift
//  PDFMaster
//
//  Created by 明刘 on 2020/5/31.
//  Copyright © 2020 anita. All rights reserved.
//

import Foundation
import UIKit
open class PFStoreboard<T:UIViewController>
{
    
    /// 加在Main Storeboard 里面的viewcontroller
    /// - Parameter storeboardID: storeboardID
    /// - Returns: UIViewController
    open class func loadVCFromeMainStoreBoard(storeboardID:String) -> T
    {
        return loadVCFromeStoreboard(storeboarName: "Main", storeboardID: storeboardID)
    }
    
    /// 加在 制定storeboard 上的viewcontroller
    /// - Parameters:
    ///   - storeboarName: 指定storeboard
    ///   - storeboardID: storeboardID
    /// - Returns: UIViewController
    open class func loadVCFromeStoreboard(storeboarName:String,storeboardID:String ) ->T
    {
        let orderTVC = UIStoryboard.init(name: storeboarName, bundle: nil).instantiateViewController(withIdentifier: storeboardID)
        return orderTVC as! T
    }
    
}
