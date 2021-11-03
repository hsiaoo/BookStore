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
    var books: [Book]?
    
    /// 生成橫向滑動的書籍Group，每個Group都有標題
    convenience init(groupTitle: String, books: [Book])
    {
        self.init()
        self.groupTitle = groupTitle
        self.books = books
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateUI()
        
        // Register BookCollectionViewCell
        let bookNib = UINib(nibName: String(describing: BookCollectionViewCell.self), bundle: nil)
        collectionView.register(bookNib, forCellWithReuseIdentifier: String(describing: BookCollectionViewCell.self))
    }
    
    // MARK: - Private method
    private func updateUI()
    {
        groupTitleLabel.text = groupTitle
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension HorizontalCollectionView: UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return books?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BookCollectionViewCell.self), for: indexPath) as! BookCollectionViewCell
        if let book = books?[indexPath.row]
        {
            bookCell.updateUI(title: book.title, author: book.author)
        }
        return bookCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        guard let book = books?[indexPath.row] else { return }
        let bookDetailController = BookDetailViewController(book: book)
        self.navigationController?.pushViewController(bookDetailController, animated: true)
    }
}

extension HorizontalCollectionView: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return BookCollectionViewCell.itemSize
    }
}
