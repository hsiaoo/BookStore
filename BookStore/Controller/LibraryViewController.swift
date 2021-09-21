//
//  LibraryViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/21.
//

import UIKit

class LibraryViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    var libraryCategory: [LibraryCategory] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        libraryCategory = LibraryCategory.allCases
    }
    
    @IBSegueAction func toSubCategory(_ coder: NSCoder, sender: Any?) -> LibrarySubCategoryViewController?
    {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return nil }
        let category = libraryCategory[indexPath.row]
        return LibrarySubCategoryViewController(category: category, coder: coder)
    }
}

extension LibraryViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return libraryCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = libraryCategory[indexPath.row].rawValue
        return cell
    }
}
