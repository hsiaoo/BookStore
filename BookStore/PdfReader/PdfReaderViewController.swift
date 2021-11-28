//
//  PdfReaderViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/11/23.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import UIKit
import PDFKit

class PdfReaderViewController: UIViewController
{
    @IBOutlet weak var pdfView: PDFView!
    
    var book: Book?
    
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
    }
    
    // MARK: - Private method
    private func setReader()
    {
        pdfView.autoScales = true
    }
    
    private func openBook()
    {
        if let book = book, let fileURL = Bundle.main.url(forResource: "\(book.title)", withExtension: "pdf")
        {
            pdfView.document = PDFDocument(url: fileURL)
        }
        else
        {
            print("找不到書籍資料，所以無法開啟閱讀器")
        }
    }
}
