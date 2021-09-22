//
//  BookDetailViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/22.
//

import UIKit

class BookDetailViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publicationDateLabel: UILabel!
    @IBOutlet weak var fileTypeLabel: UILabel!
    @IBOutlet weak var pagesLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // 一定要有書本的資料，打開這頁才有意義
    var book: Book!
    
    convenience init(book: Book)
    {
        self.init()
        self.book = book
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateUI()
        
        // 隱藏navigation bar及tab bar
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func backButton(_ sender: UIButton)
    {
        // 要回到上一頁了，顯示navigation bar及tab bar
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateUI()
    {
        //TODO: image view
        
        bookTitleLabel.text = book.title
        authorLabel.text = book.author
        publicationDateLabel.text = "\(book.publicationDate) 出版"
        fileTypeLabel.text = "\(book.fileType.rawValue)  /"
        pagesLabel.text = "\(book.pages.description)頁"
        descriptionTextView.text = book.description
    }
}
