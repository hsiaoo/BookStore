//
//  TxtReaderViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/11/24.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import UIKit

class TxtReaderViewController: UIViewController
{
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var readerControlView: ReaderControlView!
    
    let deviceManager = DeviceManager.shared
    var book: Book?
    var textSize: CGFloat = 16.0
    
    convenience init(book: Book)
    {
        self.init()
        self.book = book
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setReader()
        openBook()
        
        readerControlView.delegate = self
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        // 儲存閱讀器偏好設定
        saveReaderPreference()
    }
    
    @IBAction func tapOnTextView(_ sender: UITapGestureRecognizer)
    {
        // 顯示/隱藏navigationBar和readerControlView
        navigationController?.setNavigationBarHidden(!readerControlView.isHidden, animated: true)
        readerControlView.isHidden.toggle()
    }
    
    // MARK: - Private method
    private func setReader()
    {
        // 背景色
        let backgroundColor = deviceManager.colorFromDeviceInfo(key: .READER_BACKGROUND_COLOR)
        view.backgroundColor = backgroundColor == .clear ? .white : backgroundColor
        
        // 文字色
        let textColor = deviceManager.colorFromDeviceInfo(key: .READER_TEXT_COLOR)
        textView.textColor = textColor == .clear ? .black : textColor
        
        // 字型
        textView.font = deviceManager.fontFromDeviceInfo(key: .READER_FONT)
        
        // TODO: - 間距
        //let lineSpacing = deviceManager.intFromDeviceInfo(key: .READER_LINE_SPACING)
        
        // 字體大小
        textSize = deviceManager.fontFromDeviceInfo(key: .READER_FONT).pointSize
    }
    
    private func openBook()
    {
        if let book = book, let fileURL = Bundle.main.url(forResource: "\(book.title)", withExtension: "txt")
        {
            do
            {
                let string = try String(contentsOf: fileURL)
                textView.text = string
            }
            catch
            {
                print("TxtReaderViewController - 無法取得書檔內文")
            }
        }
        else
        {
            print("TxtReaderViewController - 找不到書籍資料，所以無法打開閱讀器")
        }
    }
    
    private func saveReaderPreference()
    {
        // 儲存背景色
        let backgroundColor = view.backgroundColor ?? UIColor.clear
        if let backgroundColorData = backgroundColor.toData()
        {
            deviceManager.setDeviceInfo(key: .READER_BACKGROUND_COLOR, value: backgroundColorData)
        }
        
        // 儲存文字色
        let textColor = textView.textColor ?? UIColor.black
        if let textColorData = textColor.toData()
        {
            deviceManager.setDeviceInfo(key: .READER_TEXT_COLOR, value: textColorData)
        }
        
        // 儲存字型、字體大小
        let font = textView.font ?? .systemFont(ofSize: 16.0)
        if let fontData = font.toData()
        {
            deviceManager.setDeviceInfo(key: .READER_FONT, value: fontData)
        }
        
        // TODO: - 儲存行間距
    }
    
}

// MARK: - ReaderControlViewDelegate
extension TxtReaderViewController: ReaderControlViewDelegate
{
    func readerControlViewBackgroundColorWhite(_ readerControlView: ReaderControlView)
    {
        // 白色背景色
        view.backgroundColor = .white
        textView.textColor = .black
    }
    
    func readerControlViewBackgroundColorYellow(_ readerControlView: ReaderControlView)
    {
        // 米黃色背景色
        view.backgroundColor = .readerBackgroundYellow
        textView.textColor = .black
    }
    
    func readerControlViewBackgroundColorBlack(_ readerControlView: ReaderControlView)
    {
        // 黑色背景色
        view.backgroundColor = .readerBackgroundBlack
        textView.textColor = .white
    }
    
    func readerControlViewFontA(_ readerControlView: ReaderControlView)
    {
        textView.font = UIFont.customFont(font: .HiraMaruProN, with: textSize)
    }
    
    func readerControlViewFontB(_ readerControlView: ReaderControlView)
    {
        textView.font = UIFont.customFont(font: .MenloRegular, with: textSize)
    }
    
    func readerControlViewFontC(_ readerControlView: ReaderControlView)
    {
        textView.font = UIFont.customFont(font: .TimesNewRoman, with: textSize)
    }
    
    // TODO: - 調整間距的功能尚未完成
    func readerControlViewIncreaseSpacing(_ readerControlView: ReaderControlView)
    {
    }
    
    func readerControlViewDecreaseSpacing(_ readerControlView: ReaderControlView)
    {
    }
    
    func readerControlViewIncreaseTextSize(_ readerControlView: ReaderControlView)
    {
        if let font = textView.font
        {
            textSize += 1
            textView.font = UIFont(name: font.fontName, size: textSize)
        }
    }
    
    func readerControlViewDecreaseTextSize(_ readerControlView: ReaderControlView)
    {
        if let font = textView.font
        {
            textSize -= 1
            textView.font = UIFont(name: font.fontName, size: textSize)
        }
    }
}
