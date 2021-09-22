//
//  LibraryBooksViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/21.
//

import UIKit

class LibraryBooksViewController: UIViewController
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let category: LibraryCategory // 圖書主分類
    let subCategory: LibrarySubCategory // 圖書次分類
    var books = [Book]() //TODO: 應要根據圖書主次分類抓取書籍陣列，目前先用BookSample
    
    init?(category: LibraryCategory, subCategory: LibrarySubCategory, coder: NSCoder)
    {
        self.category = category
        self.subCategory = subCategory
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "\(category.rawValue) / \(subCategory.rawValue)"
        
        if books.isEmpty
        {
            books = Book.BookSample
        }
        
        let bookNib = UINib(nibName: String(describing: BookCollectionViewCell.self), bundle: nil)
        collectionView.register(bookNib, forCellWithReuseIdentifier: String(describing: BookCollectionViewCell.self))
    }
}

extension LibraryBooksViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BookCollectionViewCell.self), for: indexPath) as! BookCollectionViewCell
        let book = books[indexPath.row]
        cell.updateUI(title: book.title, author: book.author)
        return cell
    }
}

extension LibraryBooksViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        // cell width: (螢幕寬 - cell與鄰居的邊界距離25*3個距離) / 一列有2個cell，即可得到一個cell的寬
        // cell height: cell width*(Figma cell長192+17+36)/(Figma cell寬142)
        
        let cellSpacing: CGFloat = 25
        let cellWidth: CGFloat = (UIScreen.main.bounds.width - cellSpacing * 3) / 2
        let cellHeight = cellWidth*(192+17+36)/142
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        // 列與列之間距離20
        return CGFloat(20)
    }
}
