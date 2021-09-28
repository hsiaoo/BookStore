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
            books = Book.sampleBooks            
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
        //cell width: 螢幕寬*142/375，142/375來自figma
        //cell height: cell width*(245/142)，245和142來自figma
        let cellWidth = self.view.frame.width*142/375
        let cellHeight = cellWidth*1.725
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
