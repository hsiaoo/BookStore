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
    @IBOutlet weak var descriptionLabel: UILabel!
    
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
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        // 隱藏navigation bar及tab bar
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - IBAction
    @IBAction func backButton(_ sender: UIButton)
    {
        // 要回到上一頁了，顯示navigation bar及tab bar
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapPreRead(_ sender: UIButton)
    {
        checkLoginStatus {
            // 使用者已登入
            print("試閱")
        }
    }
    
    @IBAction func tapFavorite(_ sender: UIButton)
    {
        checkLoginStatus {
            // 使用者已登入
            print("收藏")
        }
    }
    
    @IBAction func tapBookBorrow(_ sender: UIButton)
    {
        checkLoginStatus {
            // 使用者已登入
            print("我要借閱")
        }
    }
    
}

// MARK: - Private method
extension BookDetailViewController
{
    private func updateUI()
    {
        //TODO: image view
        
        bookTitleLabel.text = book.title
        authorLabel.text = book.author
        publicationDateLabel.text = "\(book.publicationDate) 出版  /"
        fileTypeLabel.text = "\(book.fileType.rawValue)  /"
        pagesLabel.text = "\(book.pages.description)頁"
        descriptionLabel.text = book.description
    }
    
    // 檢查登入裝態
    private func checkLoginStatus(completion: @escaping () -> Void)
    {
        if UserManager.shared.isLogin
        {
            // 已登入
            completion()
        }
        else
        {
            // 未登入，要求使用者登入
            let alert = UIAlertController(title: "請先登入", message: "", preferredStyle: .alert)
            
            let login = UIAlertAction(title: "登入", style: .default) { _ in
                let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
                let loginVC = loginStoryboard.instantiateViewController(withIdentifier: "LoginVC")
                self.navigationController?.pushViewController(loginVC, animated: true)
            }
            
            let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            
            alert.addAction(login)
            alert.addAction(cancel)
            navigationController?.present(alert, animated: true, completion: nil)
        }
    }
}
