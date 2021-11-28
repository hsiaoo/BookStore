//
//  ReadingRecordViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/11/28.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import UIKit

class ReadingRecordViewController: UIViewController
{
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 顯示“無借閱紀錄”
        noDataLabel.isHidden = !ReadingRecord.books.isEmpty
        
        // Register BookCollectionViewCell
        let bookNib = UINib(nibName: String(describing: BookCollectionViewCell.self), bundle: nil)
        collectionView.register(bookNib, forCellWithReuseIdentifier: String(describing: BookCollectionViewCell.self))
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ReadingRecordViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return ReadingRecord.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BookCollectionViewCell.self), for: indexPath) as! BookCollectionViewCell
        let book = ReadingRecord.books[indexPath.item]
        cell.updateUI(title: book.title, author: book.author)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ReadingRecordViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return BookCollectionViewCell.itemSize
    }
}
