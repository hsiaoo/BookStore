//
//  LoginViewController.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/25.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController
{
    @IBOutlet weak var libraryTextField: UITextField!
    @IBOutlet weak var emTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
        
        textFieldConfigure()
        registerKeyboardNotification()
    }
    
    @IBAction func backToPreviousView()
    {
        // 返回上一頁
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapGestureOnView(_ sender: UITapGestureRecognizer)
    {
        // 收起鍵盤
        libraryTextField.resignFirstResponder()
        emTextField.resignFirstResponder()
        pwTextField.resignFirstResponder()
    }
    
    @IBAction func tappedLoginButton(_ sender: UIButton)
    {
        if UserManager.shared.isLogin
        {
            // 已登入
            return
        }
        else
        {
            let library = self.libraryTextField.text ?? ""
            let em = self.emTextField.text ?? ""
            let pw = self.pwTextField.text ?? ""
            
            guard !library.isEmpty && !em.isEmpty && !pw.isEmpty else
            {
                // 資料沒有填寫完全，不能登入
                let alert = UIAlertController(title: "資料填寫不完全", message: "請輸入完整資料", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "好", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            // 登入
            UserManager.shared.login(em: em)
            
            // 回前一頁
            self.backToPreviousView()
        }
    }
    
    @IBAction func tappedSignUpButton(_ sender: UIButton)
    {
        if let url = URL(string: "https://www.ebookservice.tw/#membership/intro")
        {
            let safariViewController = SFSafariViewController(url: url)
            self.navigationController?.present(safariViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func tappedForgetPwButton(_ sender: UIButton)
    {
        if let url = URL(string: "https://www.ebookservice.tw/#membership/forget-password")
        {
            let safariViewController = SFSafariViewController(url: url)
            self.navigationController?.present(safariViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func tappedLearnMoreButton(_ sender: UIButton)
    {
        let learnMoreLabel = UILabel()
        learnMoreLabel.textColor = .label
        learnMoreLabel.numberOfLines = 0
        learnMoreLabel.text =
 """
【台灣雲端書庫@公共圖書館、學校、企業】

- 【台灣雲端書庫】與各城市及推廣閱讀單位合作，輔助公共圖書館及學校、企業圖書館，提供電子書／雜誌線上借閱服務。
- 若您已是【台灣雲端書庫】合作之圖書館單位的讀者，請依該圖書館單位提供給您的帳號與密碼登入；讀者每次借閱電子書／雜誌期限為14天，到期後系統會自動歸還。

【台灣雲端書庫】所有內容均來自出版機構合法授權，並且擁有著作權人授與電子版權的出版發行權利，若有第三者提出異議產生法律糾紛，本公司願意負擔所有相關責任。

服務信箱：service@ebookservice.tw
電話：+886-02-2392-6899#766
"""
        
        let learnMoreViewController = UIViewController()
        learnMoreViewController.view.backgroundColor = .systemBackground
        learnMoreViewController.view.addSubview(learnMoreLabel)
        
        learnMoreLabel.translatesAutoresizingMaskIntoConstraints = false
        learnMoreLabel.centerYAnchor.constraint(equalTo: learnMoreViewController.view.centerYAnchor).isActive = true
        learnMoreLabel.leadingAnchor.constraint(equalTo: learnMoreViewController.view.leadingAnchor, constant: 16).isActive = true
        learnMoreLabel.trailingAnchor.constraint(equalTo: learnMoreViewController.view.trailingAnchor, constant: -16).isActive = true
        self.navigationController?.present(learnMoreViewController, animated: true, completion: nil)
    }
    
    func textFieldConfigure()
    {
        // textField cornerRadius
        libraryTextField.layer.cornerRadius = 10
        emTextField.layer.cornerRadius = 10
        pwTextField.layer.cornerRadius = 10
        
        libraryTextField.layer.masksToBounds = true
        emTextField.layer.masksToBounds = true
        pwTextField.layer.masksToBounds = true
        
        libraryTextField.layer.borderWidth = 1
        emTextField.layer.borderWidth = 1
        pwTextField.layer.borderWidth = 1
        
        libraryTextField.layer.borderColor = UIColor.lightGray.cgColor
        emTextField.layer.borderColor = UIColor.lightGray.cgColor
        pwTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        // 以pickerView取代libraryTextField的keyboard
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        libraryTextField.inputView = picker
    }
    
    func registerKeyboardNotification()
    {
        // 這裡要使用"will show"和"will hide"，才能在鍵盤出現與消失的同時上下移動view。若使用"did show和did hide"，動作看起來是分割的，鍵盤消失時甚至會有黑影
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification)
    {
        guard let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        self.view.frame.origin.y = 0 // 每次都先讓View回到原點(0,0)
        self.view.frame.origin.y -= keyboardSize.height // 再調整view的y點，若沒有先回到原點，畫面可能會一直往上升，就會出現黑影
    }
    
    @objc func keyboardWillHide(_ notification: Notification)
    {
        self.view.frame.origin.y = 0
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // 按下Return鍵後關閉keyboard
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension LoginViewController: UIPickerViewDataSource, UIPickerViewDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return Library.libraries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return Library.libraries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if row == 0
        {
            libraryTextField.text = Library.libraries[row]
        }
        else
        {
            libraryTextField.text = "台灣雲端書庫@\(Library.libraries[row])"
        }
    }
}
