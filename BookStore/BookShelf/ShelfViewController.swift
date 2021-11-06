//
//  ShelfViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/28.
//

import UIKit

class ShelfViewController: UIViewController
{
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        checkLoginStatus()
    }
    
}

// MARK: - Private method
extension ShelfViewController
{
    /// 檢查登入狀態
    private func checkLoginStatus()
    {
        if UserManager.shared.isLogin
        {
            // 已登入，建立書櫃版位
            createGroup()
        }
        else
        {
            // 未登入，要求使用者登入
            let alert = UIAlertController(title: "請先登入", message: "登入以檢視我的書櫃", preferredStyle: .alert)
            
            let login = UIAlertAction(title: "登入", style: .default) { _ in
                let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
                let loginVC = loginStoryboard.instantiateViewController(withIdentifier: "LoginVC")
                self.navigationController?.pushViewController(loginVC, animated: true)
            }
            
            let cancel = UIAlertAction(title: "取消", style: .cancel) { _ in
                self.tabBarController?.selectedIndex = 0
            }
            
            alert.addAction(login)
            alert.addAction(cancel)
            navigationController?.present(alert, animated: true, completion: nil)
        }
    }
    
    private func createGroup()
    {
        for title in Library.shelfGroups
        {
            let group = HorizontalCollectionView(groupTitle: title, books: Book.sampleBooks)
            stackView.addArrangedSubview(group.view)
            self.addChild(group)
            group.didMove(toParent: self)
            
            group.view.translatesAutoresizingMaskIntoConstraints = false
            group.view.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        }
    }
}
