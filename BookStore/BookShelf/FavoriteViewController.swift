//
//  FavoriteViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/11/28.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController
{
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 顯示“無收藏書籍”
        noDataLabel.isHidden = !Favorite.books.isEmpty
        
        // Register BookCollectionViewCell
        let bookNib = UINib(nibName: String(describing: BookCollectionViewCell.self), bundle: nil)
        collectionView.register(bookNib, forCellWithReuseIdentifier: String(describing: BookCollectionViewCell.self))
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return Favorite.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BookCollectionViewCell.self), for: indexPath) as! BookCollectionViewCell
        let book = Favorite.books[indexPath.item]
        cell.updateUI(title: book.title, author: book.author)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FavoriteViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return BookCollectionViewCell.itemSize
    }
}
