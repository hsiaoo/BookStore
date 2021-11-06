//
//  UserManager.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/10/10.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import Foundation

enum UserInfoKey: String
{
    case UID = "UID"
    case EM = "EM"
}

class UserManager
{
    static let shared = UserManager()
    private let userDefault = UserDefaults.standard
    
    /// 檢查使用者登入狀態
    var isLogin: Bool
    {
        if stringFromUserInfo(key: .UID).isEmpty
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    /// 登入
    func login(em: String)
    {
        setUserInfo(key: .UID, value: UUID().uuidString)
        setUserInfo(key: .EM, value: em)
    }
    
    /// 登出
    func logout()
    {
        removeUserInfo(key: .UID)
    }
    
}

// MARK: - Private method
extension UserManager
{
    /// 存入特定的UserInfo
    private func setUserInfo(key: UserInfoKey, value: Any)
    {
        userDefault.set(value, forKey: key.rawValue)
    }
    
    /// 移除特定的UserInfo
    private func removeUserInfo(key: UserInfoKey)
    {
        // 移除某個key的value => 將value設為空字串
        setUserInfo(key: key, value: "")
    }
    
    /// 取得value型別為String的UserInfo
    private func stringFromUserInfo(key: UserInfoKey) -> String
    {
        if let value = userDefault.value(forKey: key.rawValue) as? String
        {
            return value
        } else {
            return ""
        }
    }
}
