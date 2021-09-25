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
            
            // group貼進stackView後才設定constraints。若在stackView.addArrangedSubview之前設定constrains會出錯，因為view階層關係有問題
            group.view.translatesAutoresizingMaskIntoConstraints = false
            group.view.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        }
    }
}

