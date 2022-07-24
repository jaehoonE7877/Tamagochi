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
    
    @IBOutlet weak var nickNameLabel: UILabel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        self.navigationController?.navigationBar.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        self.title = "설정"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)]
        
        nickNameLabel.text = ownerNickname
        nickNameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        nickNameLabel.font = .systemFont(ofSize: 13)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            
            let sb = UIStoryboard(name: "NameSetting", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: NameSettingViewController.identifier) as! NameSettingViewController
            
            vc.nickName = ownerNickname
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            
            let sb = UIStoryboard(name: "Choice", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: ChoiceCollectionViewController.identifier) as! ChoiceCollectionViewController
            
            //let nav = UINavigationController(rootViewController: vc)
            
            self.navigationController?.pushViewController(vc, animated: true)

        case 2:
            UserDefaults.standard.removeObject(forKey: "rice")
            UserDefaults.standard.removeObject(forKey: "water")
            
        default:
            print("오류입니다.")
        }
        
    
    }
}
//추가 및 수정사항
// Alert만들어서 case 2번에 넣기
// case 0 은 닉네임 데이터 들고가서 변경시켜주기.
