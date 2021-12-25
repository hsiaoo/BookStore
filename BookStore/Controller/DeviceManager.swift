//
//  DeviceManager.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/10/9.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import UIKit
import Foundation

enum DeviceInfoKey: String, CaseIterable
{
    case AUTO_DOWNLOAD = "AUTO_DOWNLOAD"    // 自動下載借閱書籍
    case AUTO_DELETE = "AUTO_DELETE"    // 自動刪除已歸還書籍
    
    // Reader
    case READER_BACKGROUND_COLOR = "READER_BACKGROUND_COLOR"    // 背景色
    case READER_TEXT_COLOR = "READER_TEXT_COLOR"    // 文字色
    case READER_FONT = "READER_FONT"    // 字型
    case READER_LINE_SPACING = "READER_LINE_SPACING"    // 行間距
    case READER_TEXT_SIZE = "READER_TEXT_SIZE"  // 字體大小
}

class DeviceManager
{
    static let shared = DeviceManager()
    
    private let userDefault = UserDefaults.standard
    private let DEVICE_INFO = "DEVICE_INFO"
    
    func setDeviceInfo(key: DeviceInfoKey, value: Any)
    {
        userDefault.set(value, forKey: key.rawValue)
    }
    
    /// 預設回傳false
    func boolFromDeviceInfo(key: DeviceInfoKey) -> Bool
    {
        return userDefault.value(forKey: key.rawValue) as? Bool ?? false
    }
    
    /// 預設回傳空字串
    func stringFromDeviceInfo(key: DeviceInfoKey) -> String
    {
        return userDefault.value(forKey: key.rawValue) as? String ?? ""
    }
    
    /// 預設回傳-1
    func intFromDeviceInfo(key: DeviceInfoKey) -> Int
    {
        return userDefault.value(forKey: key.rawValue) as? Int ?? -1
    }
    
    /// 預設回傳.clear
    func colorFromDeviceInfo(key: DeviceInfoKey) -> UIColor
    {
        if let colorData = userDefault.value(forKey: key.rawValue) as? Data
        {
            return UIColor.fromData(colorData)
        }
        else
        {
            return  .clear            
        }
    }
    
    /// 預設回傳字型HiraMaruProN，大小16.0
    func fontFromDeviceInfo(key: DeviceInfoKey) -> UIFont
    {
        if let fontData = userDefault.value(forKey: key.rawValue) as? Data
        {
            return UIFont.fromData(fontData)
        }
        else
        {
            return UIFont.customFont(font: .HiraMaruProN, with: 16.0)
        }
    }
}
