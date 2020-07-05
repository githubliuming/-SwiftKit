//
//  PFFileManager.swift
//  PDFMaster
//
//  Created by anita on 2020/5/15.
//  Copyright © 2020 anita. All rights reserved.
//

import Foundation
extension FileManager {
    /// 沙盒路径
    public func documentDirectorPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
    }

    /// cathe 文件路径
    public func catcheDirectorPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last!
    }

    /// library 文件路径
    public func libraryDirectorPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).last!
    }

    /// 沙盒根路径
    public func sanboxHomeDirectorPath() -> String {
        return NSHomeDirectory()
    }

    // 验证文件夹是否存在
    public func directoryIsExists(path: String) -> Bool {
        var directoryExists = ObjCBool(false)
        let fileExists = FileManager.default.fileExists(atPath: path, isDirectory: &directoryExists)
        return fileExists && directoryExists.boolValue
    }
}
