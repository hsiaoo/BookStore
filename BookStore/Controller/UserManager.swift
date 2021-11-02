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
}

class UserManager
{
    static let shared = UserManager()
    
    private let userDefault = UserDefaults.standard
    private let USER_IFNO = "USER_IFNO"
    
    func setUserInfo(key: UserInfoKey, value: Any)
    {
        userDefault.set(value, forKey: key.rawValue)
    }
    
    func removeUserInfo(key: UserInfoKey)
    {
        userDefault.removeObject(forKey: key.rawValue)
    }
    
    /**取得value型別為String的使用者資料(UserInfo)**/
    func stringFromUserInfo(key: UserInfoKey) -> String?
    {
        if let value = userDefault.value(forKey: key.rawValue) as? String
        {
            return value
        } else {
            return nil
        }
    }
    
    /**檢查登入狀態*/
    func checkLoginStatus(completion: @escaping (Bool) -> ())
    {
        // 檢查是否有UID
        guard let _ = stringFromUserInfo(key: .UID) else
        {
            // 沒有UID，目前未登入
            completion(false)
            return
        }
        // 已登入
        completion(true)
    }
    
}
