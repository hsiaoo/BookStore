//
//  HorizontalCollectionView.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/20.
//

import UIKit

class HorizontalCollectionView: UIViewController
{
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var groupTitle: String = ""
    var books: [Book] = []
    
    convenience init(groupTitle: String, books: [Book] = [])
    {
        self.init()
        self.groupTitle = groupTitle
        self.books = books
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // group標題
        groupTitleLabel.text = groupTitle
        
        // 抓取樣本書籍
        if books.isEmpty
        {
            books = Book.BookSample            
        }
        
        // Register BookCollectionViewCell
        let bookNib = UINib(nibName: String(describing: BookCollectionViewCell.self), bundle: nil)
        collectionView.register(bookNib, forCellWithReuseIdentifier: String(describing: BookCollectionViewCell.self))
    }
    
}

extension HorizontalCollectionView: UICollectionViewDataSource, UICollectionViewDelegate
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let book = books[indexPath.row]
        let bookDetailController = BookDetailViewController(book: book)
        self.navigationController?.pushViewController(bookDetailController, animated: true)
    }
}

extension HorizontalCollectionView: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        //cell width: 螢幕寬*142/375
        //cell height: group高度*0.75(一個大概的比例)
        let screenWidth = self.view.frame.width
        let groupHeight = self.view.frame.height
        return CGSize(width: screenWidth*142/375, height: groupHeight*0.75)
    }
}
