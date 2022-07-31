//
//  NameSettingViewController.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/23.
//

import UIKit
import Toast
import IQKeyboardManagerSwift

class NameSettingViewController: UIViewController, UITextFieldDelegate {
    
    static let identifier = "NameSettingViewController"
    var nickName: String?
    
    @IBOutlet weak var nameSettingTextField: UITextField! { didSet { nameSettingTextField.delegate = self }}
    
    var completionHandler: ((String) -> (String))?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "대장님 이름 정하기"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.letterColor]
        
        
        view.backgroundColor = UIColor.bgColor
        
        
        nameSettingTextField.text = nickName
        designTextField(textFieldName: nameSettingTextField)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        
        
   }
    
    func designTextField(textFieldName: UITextField){
        textFieldName.borderStyle = .none
        textFieldName.backgroundColor = UIColor.bgColor
        textFieldName.keyboardType = .default
        textFieldName.attributedPlaceholder = NSAttributedString(string: "대장님 이름을 알려주세요!", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightLetterColor])
        textFieldName.textColor = UIColor.letterColor
    }
    
    @objc
    func saveButtonTapped(){
        
        guard let textFieldInput = nameSettingTextField.text else { return }
        
        if textFieldInput.count >= 2 && textFieldInput.count <= 6 {
            UserDefaults.standard.set(textFieldInput, forKey: "nickname")
            
            _ = completionHandler?(self.nameSettingTextField.text ?? "")
            self.navigationController?.popViewController(animated: true)
            
        } else {
            view.makeToast("대장 이름은 2글자에서 6글자 사이여야합니다.", duration: 3, position: .center)
        }
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameSettingTextField.resignFirstResponder()
        return true
    }
    
}
