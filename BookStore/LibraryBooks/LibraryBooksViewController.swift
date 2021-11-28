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
    
    var subCategoryTitle: String?
    var books = [Book]() //TODO: 應要根據圖書主次分類抓取書籍陣列，目前先用sampleBooks
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // navigation bar 標題
        title = subCategoryTitle
        
        // 樣本書籍資料
        if books.isEmpty
        {
            books = Book.sampleBooks
        }
        
        // 註冊BookCollectionViewCell
        let bookNib = UINib(nibName: String(describing: BookCollectionViewCell.self), bundle: nil)
        collectionView.register(bookNib, forCellWithReuseIdentifier: String(describing: BookCollectionViewCell.self))
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        // 防止從BookDetail回來這一頁沒有出現navigation bar和tab bar
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let book = books[indexPath.row]
        let bookDetailController = BookDetailViewController(book: book)
        navigationController?.pushViewController(bookDetailController, animated: true)
    }
}

extension LibraryBooksViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return BookCollectionViewCell.libraryBooksItemSize
    }
}
