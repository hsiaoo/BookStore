//
//  DeviceManager.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/10/9.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import Foundation

enum DeviceInfoKey: String
{
    case AUTO_DOWNLOAD = "AUTO_DOWNLOAD"    // 自動下載借閱書籍
    case AUTO_DELETE = "AUTO_DELETE"    // 自動刪除已歸還書籍
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
    
    func boolFromDeviceInfo(key: DeviceInfoKey) -> Bool?
    {
        if let value = userDefault.value(forKey: key.rawValue) as? Bool
        {
            return value
        }
        else
        {
            return nil
        }
    }
}
