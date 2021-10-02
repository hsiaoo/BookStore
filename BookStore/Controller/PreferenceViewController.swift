//
//  PreferenceViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/10/2.
//

import UIKit
import SafariServices

class PreferenceViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var versionLabel: UILabel!
    
    let fileManagementTitle = ["自動下載借閱書籍", "自動刪除已歸還書籍", "刪除所有書籍"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setVersionLabel()
    }
    
    @IBAction func logout(_ sender: UIButton)
    {
    }
    
    @IBAction func openOfficialWebsite(_ sender: UIButton)
    {
        guard let url = URL(string: "https://www.ebookservice.tw") else { return }
        let safari = SFSafariViewController(url: url)
        self.navigationController?.present(safari, animated: true, completion: nil)
    }
    
    private func setSwitchControl(tag: Int) -> UISwitch
    {
        let switchControl = UISwitch()
        switchControl.tag = tag
        switchControl.addTarget(self, action: #selector(switchValueChange(_:)), for: .valueChanged)
        return switchControl
    }
    
    @objc private func switchValueChange(_ switchControl: UISwitch)
    {
        switch switchControl.tag
        {
        case 0:
            print("自動下載借閱書籍")
        case 1:
            print("自動刪除已歸還書籍")
        case 2:
            print("刪除所有書籍")
        default: break
        }
    }
    
    private func setVersionLabel()
    {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1"
        let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
        versionLabel.text = "版本：\(version)_\(buildNumber)"
    }
    
}

extension PreferenceViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "書檔管理"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return fileManagementTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileManagementCell", for: indexPath)
        cell.textLabel?.text = fileManagementTitle[indexPath.row]
        let switchControl = setSwitchControl(tag: indexPath.row)
        cell.accessoryView = switchControl
        return cell
    }
    
}
