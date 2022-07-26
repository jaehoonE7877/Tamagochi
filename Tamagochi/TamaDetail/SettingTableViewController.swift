//
//  SettingTableViewController.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/23.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    static let identifier = "SettingTableViewController"
    var ownerNickname: String?
    var completionHandler: ((String) -> (String))?
    
    @IBOutlet weak var nickNameLabel: UILabel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.bgColor
        
        self.title = "설정"
        self.navigationController?.navigationBar.tintColor = UIColor.letterColor
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.letterColor ]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backButtonTapped))
        
        nickNameLabel.text = ownerNickname
        nickNameLabel.textColor = UIColor.letterColor
        nickNameLabel.font = .systemFont(ofSize: 13)
        
        
    }
    //cell button action
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            
            let sb = UIStoryboard(name: "NameSetting", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: NameSettingViewController.identifier) as! NameSettingViewController
            
            vc.nickName = ownerNickname
            
            vc.completionHandler = { text in
                self.nickNameLabel.text = text
                UserDefaults.standard.set(text, forKey: "nickname")
                return text
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            
            let sb = UIStoryboard(name: "Choice", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: ChoiceCollectionViewController.identifier) as! ChoiceCollectionViewController
                        
            self.navigationController?.pushViewController(vc, animated: true)

        case 2:
            showAlertController()
            
        default:
            return
        }
    }
    // 데이터 초기화 Alert
    func showAlertController() {
        
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가융?", preferredStyle: .alert)
        
        let no = UIAlertAction(title: "아냐!", style: .default, handler: nil)
        let yes = UIAlertAction(title: "웅", style: .destructive){ _ in
            
            let sb = UIStoryboard(name: "Choice", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: ChoiceCollectionViewController.identifier) as! ChoiceCollectionViewController
            
            let nav = UINavigationController(rootViewController: vc)
            
            nav.modalPresentationStyle = .fullScreen
            
            UserDefaults.standard.set(true, forKey: "first")
            UserDefaults.standard.removeObject(forKey: "rice")
            UserDefaults.standard.removeObject(forKey: "water")
            UserDefaults.standard.removeObject(forKey: "nickname")
            
            self.present(nav, animated: false)
            
        }
        
        alert.addAction(no)
        alert.addAction(yes)
        
        present(alert, animated: true)
    }
    
    @objc
    func backButtonTapped(){
        _ = completionHandler?(self.nickNameLabel.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
}

