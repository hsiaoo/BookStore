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
    
    var subCategoryData: [Int: String]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? LibraryBooksViewController,
           let selectedIndexPath = tableView.indexPathForSelectedRow,
           let title = subCategoryData?[selectedIndexPath.row]
        {
            vc.subCategoryTitle = title
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension LibrarySubCategoryViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let subCategoryData = subCategoryData
        {
            return subCategoryData.count
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryCell", for: indexPath)
        cell.textLabel?.text = subCategoryData?[indexPath.row]
        return cell
    }
}
