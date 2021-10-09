//
//  LibrarySubCategoryViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/21.
//

import UIKit

class LibrarySubCategoryViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    var category: LibraryCategory
    var subCategory: [LibrarySubCategory] = []
    
    init?(category: LibraryCategory, coder: NSCoder)
    {
        self.category = category
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        subCategory = LibraryCategory.getSubCategory(category: category)
    }
    
    @IBSegueAction func toLibraryBooks(_ coder: NSCoder, sender: Any?) -> LibraryBooksViewController?
    {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return nil }
        let subCategory = subCategory[indexPath.row]
        return LibraryBooksViewController(category: category, subCategory: subCategory, coder: coder)
    }
    
}

extension LibrarySubCategoryViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return subCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryCell", for: indexPath)
        cell.textLabel?.text = subCategory[indexPath.row].rawValue
        return cell
    }
}
