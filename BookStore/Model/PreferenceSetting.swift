//
//  PreferenceSetting.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/10/9.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

struct PreferenceSetting
{
    /**設定頁面的Section**/
    enum Sections: Int, CaseIterable
    {
        case FilesManagement = 0
    }
    
    /**取得Section的名稱*/
    static func getSectionTitle(section: Int) -> String?
    {
        switch Sections(rawValue: section)
        {
        case .FilesManagement: return "書檔管理"
        default: break
        }
        return nil
    }
    
    /**取得Section的細項設定*/
    static func getSettings(section: Int) -> Dictionary<Int, String>?
    {
        switch Sections(rawValue: section)
        {
        case .FilesManagement:
            return [0: "自動下載借閱書籍", 1: "自動刪除已歸還書籍", 2: "刪除所有書籍"]
        default: break
        }
        return nil
    }
}
