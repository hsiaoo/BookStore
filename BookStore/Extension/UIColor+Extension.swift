//
//  UIColor+Extension.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/12/12.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import UIKit

extension UIColor
{
    // 閱讀器背景色
    static let readerBackgroundYellow = UIColor(red: 248/255, green: 244/255, blue: 209/255, alpha: 1)
    static let readerBackgroundBlack = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
    
    /// 將UIColor轉成Data
    func toData() -> Data?
    {
        do
        {
            return try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
        } catch {
            print("Failed turning color into data.")
            return nil
        }
    }
    
    /// 將Data轉成UIColor
    static func fromData(_ data: Data) -> UIColor
    {
        do
        {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
            if let color = color
            {
                return color
            }
            else
            {
                return .clear
            }
        } catch {
            print("Failed turning Data to UIColor")
            return .clear
        }
    }
}
