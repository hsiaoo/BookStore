//
//  LibraryViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/21.
//

import UIKit

class LibraryViewController: UIViewController
{
    @IBOutlet weak var bookTableView: UITableView!
    @IBOutlet weak var magazineTableView: UITableView!
    
    var bookMainCategory: [BookMainCategoryType] = []
    var magazineMainCategory: [MagazineMainCategoryType] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Category Data
        bookMainCategory = BookMainCategoryType.allCases
        magazineMainCategory = MagazineMainCategoryType.allCases
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toSubCategory",
           let vc = segue.destination as? LibrarySubCategoryViewController,
           let subCategoryData = sender as? [Int: String]
        {
            vc.subCategoryData = subCategoryData
        }
    }
    
    @IBAction func categorySegmentChanged(_ sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex
        {
        case 0: // 電子書
            bookTableView.isHidden = false
            magazineTableView.isHidden = true
        case 1: // 電子雜誌
            bookTableView.isHidden = true
            magazineTableView.isHidden = false
        default: break
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension LibraryViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == bookTableView
        {
            return bookMainCategory.count
        }
        else if tableView == magazineTableView
        {
            return magazineMainCategory.count
        }
        else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == bookTableView
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookCategoryCell", for: indexPath)
            cell.textLabel?.text = bookMainCategory[indexPath.row].rawValue
            return cell
        }
        else if tableView == magazineTableView
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineCategoryCell", for: indexPath)
            cell.textLabel?.text = magazineMainCategory[indexPath.row].rawValue
            return cell
        }
        else
        {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        var subCategoryData: [Int: String]?
        if tableView == bookTableView
        {
            let mainType = bookMainCategory[indexPath.row]
            subCategoryData = BookMainCategory.getSubCategory(from: mainType).subDictionary
        }
        else if tableView == magazineTableView
        {
            let mainType = magazineMainCategory[indexPath.row]
            subCategoryData = MagazineMainCategory.getSubCategory(from: mainType).subDictionary
        }
        performSegue(withIdentifier: "toSubCategory", sender: subCategoryData)
    }
}
