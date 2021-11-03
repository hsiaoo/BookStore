//
//  OverviewViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/20.
//

import UIKit

class OverviewViewController: UIViewController
{
    // Containers height constraint
    @IBOutlet weak var informationContainerHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setHeightConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        checkLoginStatus()
    }
    
    // MARK: - Private method
    
    // 設定所有Containers的高度
    private func setHeightConstraints()
    {
        informationContainerHeightConstraint.constant = InformationViewController.height
    }
    
    // 檢查登入裝態
    private func checkLoginStatus()
    {
        UserManager.shared.checkLoginStatus
        { isLogin in
            guard isLogin else
            {
                // 使用者未登入，建立右上角的登入按鈕
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(
                    image: UIImage(systemName: "person"),
                    style: .plain,
                    target: self,
                    action: #selector(self.login))
                
                return
            }
            
            // 使用者已登入，不需要顯示右上角的登入按鈕
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    @objc func login()
    {
        // 畫面導往登入頁面
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}

