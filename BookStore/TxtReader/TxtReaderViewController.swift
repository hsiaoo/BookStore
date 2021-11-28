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
    
    var book: Book?
    
    convenience init(book: Book)
    {
        self.init()
        self.book = book
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        openBook()
    }
    
    // MARK: - Private method
    private func setReader()
    {
        
    }
    
    private func openBook()
    {
        if let book = book, let fileURL = Bundle.main.url(forResource: "\(book.title)", withExtension: "txt")
        {
            let text = try? String(contentsOf: fileURL)
            textView.text = text
        }
        else
        {
            print("找不到書籍資料，所以無法打開閱讀器")
        }
    }
    
}
