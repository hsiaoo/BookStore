//
//  BookShelfViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/28.
//

import UIKit
import SafariServices

class BookShelfViewController: UIViewController
{
    @IBOutlet weak var loginReminderView: UIView!
    @IBOutlet weak var preferenceBarButton: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        // 防止從登入頁回來這一頁沒有出現navigation bar和tab bar
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = false
        
        checkLoginStatus()
    }
    
    // MARK: - IBAction
    @IBAction func login(_ sender: UIButton)
    {
        let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let loginVC = loginStoryboard.instantiateViewController(withIdentifier: "LoginVC")
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func signUp(_ sender: UIButton)
    {
        if let url = URL(string: "https://www.ebookservice.tw/#membership/intro")
        {
            let safariViewController = SFSafariViewController(url: url)
            navigationController?.present(safariViewController, animated: true, completion: nil)
        }
    }
    
}

// MARK: - Private method
extension BookShelfViewController
{
    /// 檢查登入狀態
    private func checkLoginStatus()
    {
        loginReminderView.isHidden = UserManager.shared.isLogin
        preferenceBarButton.isEnabled = UserManager.shared.isLogin
    }
}
