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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setVersionLabel()
    }
    
    @IBAction func logout(_ sender: UIButton)
    {
        // 移除UID即登出
        UserManager.shared.removeUserInfo(key: .UID)
        
        // 提示使用者已登出，按下OK後回到首頁
        let alert = UIAlertController(title: "登出成功", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "確認", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
            self.tabBarController?.selectedIndex = 0
        }))
        present(alert, animated: true, completion: nil)
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
        
        var status: Bool?
        switch tag
        {
        case 0:  // 自動下載借閱書籍
            status = DeviceManager.shared.boolFromDeviceInfo(key: .AUTO_DOWNLOAD)
            
        case 1:  // 自動刪除已歸還書籍
            status = DeviceManager.shared.boolFromDeviceInfo(key: .AUTO_DELETE)
            
        default: break
        }
        
        if let status = status
        {
            switchControl.isOn = status
        } else {
            switchControl.isOn = false
        }
        
        return switchControl
    }
    
    @objc private func switchValueChange(_ switchControl: UISwitch)
    {
        // 一旦設定有變化，便將目前的偏好設定傳給DeviceManager寫入UserDefault
        switch switchControl.tag
        {
        case 0:  // 自動下載借閱書籍
            DeviceManager.shared.setDeviceInfo(key: .AUTO_DOWNLOAD, value: switchControl.isOn)
            
        case 1:  // 自動刪除已歸還書籍
            DeviceManager.shared.setDeviceInfo(key: .AUTO_DELETE, value: switchControl.isOn)
            
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
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return PreferenceSetting.Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return PreferenceSetting.getSectionTitle(section: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return PreferenceSetting.getSettings(section: section)?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreferenceSettingCell", for: indexPath)
        
        if let settingDictionary = PreferenceSetting.getSettings(section: indexPath.section)
        {
            cell.textLabel?.text = settingDictionary[indexPath.row]
        }
        
        switch indexPath.section
        {
        case 0:  // 第一個Section: 書檔管理
            switch indexPath.row
            {
            // 設定cell的accessoryView
            case 0, 1:  // 自動下載借閱書籍、自動刪除已歸還書籍
                let switchControl = setSwitchControl(tag: indexPath.row)
                cell.accessoryView = switchControl
            case 2:  // 刪除所有書籍
                cell.accessoryType = .disclosureIndicator
            default: break
            }
            
        default: break
        }
        
        return cell
    }
    
}
