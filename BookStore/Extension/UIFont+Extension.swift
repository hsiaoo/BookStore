//
//  UIFont+Extension.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/12/12.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import UIKit

extension UIFont
{
    enum FontType: String
    {
        case HiraMaruProN = "HiraMaruProN-W4"
        case MenloRegular = "Menlo Regular"
        case TimesNewRoman = "Times New Roman"
    }
    
    static func customFont(font: FontType, with size: CGFloat?) -> UIFont
    {
        return UIFont(name: font.rawValue, size: size ?? 16.0) ?? .systemFont(ofSize: 16.0)
    }
    
    /// 將UIFont轉成Data
    func toData() -> Data?
    {
        do
        {
            return try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
        } catch {
            print("Failed turning font into data.")
            return nil
        }
    }
    
    /// 將Data轉成UIFont
    static func fromData(_ data: Data) -> UIFont
    {
        do
        {
            let font = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIFont.self, from: data)
            if let font = font
            {
                return font
            }
            else
            {
                return .systemFont(ofSize: 16.0)
            }
        } catch {
            print("Failed turning Data to UIFont")
            return .systemFont(ofSize: 16.0)
        }
    }
}
