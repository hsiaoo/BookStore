//
//  OverviewViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/20.
//

import UIKit

class OverviewViewController: UIViewController
{
    @IBOutlet weak var stackView: UIStackView!
    
    let groupsTitle = ["最新上架", "當期雜誌", "最新熱門", "閱讀快訊", "非常作家"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createGroups()
    }
    
    func createGroups()
    {
        for title in groupsTitle
        {
            let group = HorizontalCollectionView(groupTitle: title)
            stackView.addArrangedSubview(group.view)
            self.addChild(group)
            group.didMove(toParent: self)
            
            // group貼進stackView後再設定constraints，放在stackView.addArrangedSubview之前會出錯，因為view階層關係有問題
            group.view.translatesAutoresizingMaskIntoConstraints = false
            group.view.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
        }
    }
}

