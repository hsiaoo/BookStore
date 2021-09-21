//
//  LibraryBooksViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/21.
//

import UIKit

class LibraryBooksViewController: UIViewController
{
    @IBOutlet weak var stackView: UIStackView!
    
    let category: LibraryCategory
    let subCategory: LibrarySubCategory
    
    init?(category: LibraryCategory, subCategory: LibrarySubCategory, coder: NSCoder)
    {
        self.category = category
        self.subCategory = subCategory
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "\(category.rawValue) / \(subCategory.rawValue)"
    }
}
