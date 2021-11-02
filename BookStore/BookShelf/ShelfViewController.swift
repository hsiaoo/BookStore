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
    
    let shelfTitle = ["我的借閱", "我的收藏", "我的借閱紀錄"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        UserManager.shared.checkLoginStatus { isLogin in
            guard isLogin else
            {
                let alert = UIAlertController(title: "請先登入", message: "登入以檢視我的書櫃", preferredStyle: .alert)
                let loginAction = UIAlertAction(title: "登入", style: .destructive, handler: { _ in
                    let loginView = LoginViewController()
                    self.navigationController?.pushViewController(loginView, animated: true)
                })
                let cancelAction = UIAlertAction(title: "取消", style: .cancel) { _ in
                    self.tabBarController?.selectedIndex = 0
                }
                                   
                alert.addAction(loginAction)
                alert.addAction(cancelAction)
                
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            self.createGroup()
        }
    }
    
    private func createGroup()
    {
        for title in shelfTitle
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
