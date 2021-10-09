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
        createGroup()
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
