//
//  NameSettingViewController.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/23.
//

import UIKit

class NameSettingViewController: UIViewController {
    
    static let identifier = "NameSettingViewController"
    var nickName: String?
    
    @IBOutlet weak var nameSettingTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "대장님 이름 정하기"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: nil, action: #selector(saveButtonTapped))
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        nameSettingTextField.text = nickName
        designTextField(textFieldName: nameSettingTextField)
        
        
   }
    
    func designTextField(textFieldName: UITextField){
        textFieldName.borderStyle = .none
        textFieldName.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        textFieldName.keyboardType = .default
        textFieldName.attributedPlaceholder = NSAttributedString(string: "대장님 이름을 알려주세요!", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 0.5)])
        textFieldName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
    
    @objc
    func saveButtonTapped(){
        
        guard let textFieldInput = nameSettingTextField.text, textFieldInput.count >= 2 && textFieldInput.count <= 6 else { return }
        
        UserDefaults.standard.set(textFieldInput, forKey: "nickname")
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nameSettingTextFieldRetrun(_ sender: UITextField) {
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        nameSettingTextField.resignFirstResponder()
//        return true
//    }
    
}
// 다시 화면 돌아갔을 때 데이터 전달
// 왜 키보드가 올라가있는 상황에서만 뒤로 팝 할까?

