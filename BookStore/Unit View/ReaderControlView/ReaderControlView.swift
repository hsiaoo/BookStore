//
//  ReaderControlView.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/12/5.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import UIKit

protocol ReaderControlViewDelegate: AnyObject
{
    func readerControlViewBackgroundColorWhite(_ readerControlView: ReaderControlView)
    func readerControlViewBackgroundColorYellow(_ readerControlView: ReaderControlView)
    func readerControlViewBackgroundColorBlack(_ readerControlView: ReaderControlView)
    func readerControlViewFontA(_ readerControlView: ReaderControlView)
    func readerControlViewFontB(_ readerControlView: ReaderControlView)
    func readerControlViewFontC(_ readerControlView: ReaderControlView)
    func readerControlViewIncreaseSpacing(_ readerControlView: ReaderControlView)
    func readerControlViewDecreaseSpacing(_ readerControlView: ReaderControlView)
    func readerControlViewIncreaseTextSize(_ readerControlView: ReaderControlView)
    func readerControlViewDecreaseTextSize(_ readerControlView: ReaderControlView)
}

class ReaderControlView: UIView
{
    weak var delegate: ReaderControlViewDelegate?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        
        let nib = UINib(nibName: String(describing: ReaderControlView.self), bundle: nil)
        if let view = nib.instantiate(withOwner: self, options: [:]).first as? UIView
        {
            addSubview(view)
            view.frame = self.bounds
        }
    }
    
    // 背景顏色
    @IBAction func backgroundWhite(_ sender: UIButton)
    {
        delegate?.readerControlViewBackgroundColorWhite(self)
    }
    
    @IBAction func backgroundYellow(_ sender: UIButton)
    {
        delegate?.readerControlViewBackgroundColorYellow(self)
    }
    
    @IBAction func backgroundBlack(_ sender: UIButton)
    {
        delegate?.readerControlViewBackgroundColorBlack(self)
    }
    
    // 字型
    @IBAction func fontA(_ sender: UIButton)
    {
        delegate?.readerControlViewFontA(self)
    }
    
    @IBAction func fontB(_ sender: UIButton)
    {
        delegate?.readerControlViewFontB(self)
    }
    
    @IBAction func fontC(_ sender: UIButton)
    {
        delegate?.readerControlViewFontC(self)
    }
    
    // 因為這個功能還沒做出來，所以先把UI按鈕隱藏起來了
    // 行間距
    @IBAction func increaseSpacing(_ sender: UIButton)
    {
        delegate?.readerControlViewIncreaseSpacing(self)
    }
    
    @IBAction func decreaseSpacing(_ sender: UIButton)
    {
        delegate?.readerControlViewDecreaseSpacing(self)
    }
    
    // 字體大小
    @IBAction func increaseTextSize(_ sender: UIButton)
    {
        delegate?.readerControlViewIncreaseTextSize(self)
    }
    
    @IBAction func decreaseTextSize(_ sender: UIButton)
    {
        delegate?.readerControlViewDecreaseTextSize(self)
    }
}
