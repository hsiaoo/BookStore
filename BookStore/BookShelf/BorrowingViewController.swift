//
//  BorrowingViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/11/27.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import UIKit

class BorrowingViewController: UIViewController
{
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 顯示“無借閱中的書籍”
        noDataLabel.isHidden = !Borrowing.books.isEmpty
        
        // Register BookCollectionViewCell
        let bookNib = UINib(nibName: String(describing: BookCollectionViewCell.self), bundle: nil)
        collectionView.register(bookNib, forCellWithReuseIdentifier: String(describing: BookCollectionViewCell.self))
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension BorrowingViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return Borrowing.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BookCollectionViewCell.self), for: indexPath) as! BookCollectionViewCell
        let book = Borrowing.books[indexPath.item]
        cell.updateUI(title: book.title, author: book.author)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        // TODO: - 應該要做一個閱讀器工廠，把書本丟給工廠，工廠根據檔案類型產生對應的閱讀器，回傳給BorrowingViewController，然後在這裡push reader vc
        
        let book = Borrowing.books[indexPath.item]
        
        switch book.fileType
        {
        case .PDF:
            let pdfReaderStoryboard = UIStoryboard(name: "PdfReader", bundle: nil)
            if let pdfReaderVC = pdfReaderStoryboard.instantiateInitialViewController() as? PdfReaderViewController
            {
                // TODO: - 這裡沒有用到vc的init，storyboard reference和vc init怎麼一起使用？
                pdfReaderVC.book = book
                navigationController?.pushViewController(pdfReaderVC, animated: true)
            }
            
        case .TXT:
            let txtReaderStoryboard = UIStoryboard(name: "TxtReader", bundle: nil)
            if let txtReaderVC = txtReaderStoryboard.instantiateInitialViewController() as? TxtReaderViewController
            {
                // TODO: - 這裡沒有用到vc的init，storyboard reference和vc init怎麼一起使用？
                txtReaderVC.book = book
                navigationController?.pushViewController(txtReaderVC, animated: true)
            }
            
        default: break  // 還沒做其他類型的閱讀器
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BorrowingViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return BookCollectionViewCell.itemSize
    }
}
