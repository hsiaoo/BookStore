//
//  SearchViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/11/14.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController
{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredBooks: [Book] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setSearchController()
        
        // 註冊BookCollectionViewCell
        let bookNib = UINib(nibName: String(describing: BookCollectionViewCell.self), bundle: nil)
        collectionView.register(bookNib, forCellWithReuseIdentifier: String(describing: BookCollectionViewCell.self))
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        searchController.searchBar.searchTextField.becomeFirstResponder()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return filteredBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BookCollectionViewCell.self), for: indexPath) as! BookCollectionViewCell
        let book = filteredBooks[indexPath.item]
        cell.updateUI(title: book.title, author: book.author)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let book = filteredBooks[indexPath.item]
        let bookDetailViewController = BookDetailViewController(book: book)
        navigationController?.pushViewController(bookDetailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return BookCollectionViewCell.libraryBooksItemSize
    }
}

// MARK: - Private method
extension SearchViewController
{
    private func setSearchController()
    {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate
{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        filteredBooks.removeAll()
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        filteredBooks.removeAll()
        collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        // 取得使用者輸入的字串
        guard let searchString = searchBar.text else { return }
        
        // 找出含有特定字串的書籍名稱
        filteredBooks = Book.sampleBooks.filter({ book in
            let bookNSString = NSString(string: book.title)
            return bookNSString.range(of: searchString, options: .caseInsensitive).location != NSNotFound
        })
        
        collectionView.reloadData()
        searchBar.resignFirstResponder()
    }
}
