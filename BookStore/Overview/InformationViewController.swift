//
//  InformationViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/11/2.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController
{
    @IBOutlet weak var stackView: UIStackView!
    
    var books: [Book] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        getData()
    }
    
    // MARK: - Private method
    private func getData()
    {
        guard !Library.informationGroups.isEmpty else { return }
        books = Book.sampleBooks
        createGroups()
    }
    
    private func createGroups()
    {
        for title in Library.informationGroups
        {
            let group = HorizontalCollectionView(groupTitle: title, books: books)
            stackView.addArrangedSubview(group.view)
            self.addChild(group)
            group.didMove(toParent: self)
            
            // group貼進stackView後才設定constraints。若在stackView.addArrangedSubview之前設定constrains會出錯，因為view階層關係有問題
            group.view.translatesAutoresizingMaskIntoConstraints = false
            group.view.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        }
    }
    
}

extension InformationViewController
{
    /**取得Information Container的高度*/
    static var height: CGFloat =
    {
        guard !Library.informationGroups.isEmpty else { return 0.0 }
        
        let screenWidth = UIScreen.main.bounds.size.width
        let ratio = 0.9
        let groupCount = CGFloat(Library.informationGroups.count - 1)
        return screenWidth * ratio * groupCount
    }()
}
