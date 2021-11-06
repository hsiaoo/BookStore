//
//  OverviewViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/20.
//

import UIKit

class OverviewViewController: UIViewController
{
    @IBOutlet weak var loginButton: UIBarButtonItem!
    
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
    
}

// MARK: - Private method
extension OverviewViewController
{
    // 設定所有Containers的高度
    private func setHeightConstraints()
    {
        informationContainerHeightConstraint.constant = InformationViewController.height
    }
    
    // 檢查登入裝態
    private func checkLoginStatus()
    {
        if UserManager.shared.isLogin
        {
            // 已登入，隱藏右上角的登入按鈕
            loginButton.image = nil
            loginButton.isEnabled = false
        }
        else
        {
            // 未登入，顯示右上角的登入按鈕
            loginButton.image = UIImage(systemName: "person")
            loginButton.isEnabled = true
        }
    }
}
