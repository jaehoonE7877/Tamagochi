//
//  ViewController.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    static let identifier = "ViewController"
    var tamaMainName: String?
    // 인스턴스 생성
    var tamaMainInfo = TamaInfo()
    
    let nickname = "대장"
    var tamaRice = UserDefaults.standard.integer(forKey: "rice")
    var tamaWater = UserDefaults.standard.integer(forKey: "water")
    
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var bubbleLabel: UILabel!
    @IBOutlet weak var tamaImageView: UIImageView!
    @IBOutlet weak var tamaNameLabel: UILabel!
    
    @IBOutlet weak var tamaLevelLabel: UILabel!
    
    @IBOutlet weak var tamaRiceTextField: UITextField! { didSet { tamaRiceTextField.delegate = self }}
    @IBOutlet weak var tamaRiceButton: UIButton!
    
    @IBOutlet weak var tamaWaterTextField: UITextField! { didSet { tamaWaterTextField.delegate = self }}
    @IBOutlet weak var tamaWaterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 상단 네비바
        title = "\(nickname)님의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        // Main view 색상, 말풍선
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        bubbleImageView.image = UIImage(named: "bubble.png")
        designLabel(labelName: bubbleLabel)
        bubbleLabel.text = "\(nickname)님 \(tamaMainInfo.tamaStatus[0])"
        bubbleLabel.font = .boldSystemFont(ofSize: 13)
        bubbleLabel.numberOfLines = 0
        
        // 이름 레이블 디자인
        designLabel(labelName: tamaNameLabel)
        guard let tamaMainName = tamaMainName else { return }
        tamaNameLabel.text = tamaMainName + " 다마고치"
        tamaNameLabel.font = .boldSystemFont(ofSize: 14)
        tamaNameLabel.layer.borderWidth = 1
        tamaNameLabel.layer.cornerRadius = 4
        tamaNameLabel.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        designLabel(labelName: tamaLevelLabel)
        // 이미지 & 레벨
        showLevel()
        
        
        // 버튼 디자인
        tamaRiceButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        tamaWaterButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        tamaRiceButton.setTitle(" 밥먹기", for: .normal)
        tamaWaterButton.setTitle(" 물먹기", for: .normal)
        designButton(buttonName: tamaRiceButton)
        designButton(buttonName: tamaWaterButton)
        
        //텍스트 필드 디자인
        designTextField(textFieldName: tamaRiceTextField)
        designTextField(textFieldName: tamaWaterTextField)
        tamaRiceTextField.attributedPlaceholder = NSAttributedString(string: "밥주세용", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)])
        tamaWaterTextField.attributedPlaceholder = NSAttributedString(string: "물주세용", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)])
        
        UserDefaults.standard.removeObject(forKey: "rice")
        UserDefaults.standard.removeObject(forKey: "water")
    }
    
    // 다시짜기
    @IBAction func tamaRiceButtonTapped(_ sender: UIButton) {
        
        if tamaRiceTextField.text != nil {
            
            let riceValue = UserDefaults.standard.integer(forKey: "rice")
            
            let updateRiceValue = riceValue + Int(tamaRiceTextField.text!)!
            
            UserDefaults.standard.set(updateRiceValue, forKey: "rice")
            
        } else if tamaRiceTextField.text == ""{
            
            let riceValue = UserDefaults.standard.integer(forKey: "rice")
            
            let updateRiceValue = riceValue + 1
            
            UserDefaults.standard.set(updateRiceValue, forKey: "rice")
        }
        
        showLevel()
        
        tamaRiceTextField.text = ""
        
        bubbleLabel.text = "\(nickname)님 \(tamaMainInfo.tamaStatus[Int.random(in: 1...10)])"
        
    }
    
    @IBAction func tamaWaterButtonTapped(_ sender: UIButton) {
        
        if tamaWaterTextField.text != nil {
            
            let waterValue = UserDefaults.standard.integer(forKey: "water")
            
            let updateWaterValue = waterValue + Int(tamaWaterTextField.text!)!
            
            UserDefaults.standard.set(updateWaterValue, forKey: "water")
            
        } else {
            
            let waterValue = UserDefaults.standard.integer(forKey: "water")
            
            let updateWaterValue = waterValue + 1
           
            UserDefaults.standard.set(updateWaterValue, forKey: "water")
        }
        
        showLevel()
        
        tamaWaterTextField.text = ""
        
        bubbleLabel.text = "\(nickname)님 \(tamaMainInfo.tamaStatus[Int.random(in: 1...10)])"
    }
    
    func showLevel() {
        
        let tamaTotalLevel = tamaLevel(rice: UserDefaults.standard.integer(forKey: "rice"), water: UserDefaults.standard.integer(forKey: "water"))
        
        switch tamaTotalLevel {
        case 0:
            designMainImage(level: 1)
        case 1:
            designMainImage(level: 1)
        case 2:
            designMainImage(level: 2)
        case 3:
            designMainImage(level: 3)
        case 4:
            designMainImage(level: 4)
        case 5:
            designMainImage(level: 5)
        case 6:
            designMainImage(level: 6)
        case 7:
            designMainImage(level: 7)
        case 8:
            designMainImage(level: 8)
        case 9:
            designMainImage(level: 9)
        default:
            designMainImage(level: 9)
        }
        
        tamaLevelLabel.text = #"LV\#(tamaLevel(rice: UserDefaults.standard.integer(forKey: "rice"), water: UserDefaults.standard.integer(forKey: "water")))∙\#(UserDefaults.standard.integer(forKey: "rice"))개∙\#(UserDefaults.standard.integer(forKey: "water"))개"#
        
    }
    
    
    func designLabel(labelName: UILabel){
        labelName.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        labelName.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        labelName.textAlignment = .center
    }
    
    func designButton(buttonName: UIButton){
        buttonName.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        buttonName.layer.borderWidth = 1
        buttonName.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        buttonName.layer.cornerRadius = 4
        buttonName.layer.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1).cgColor
        buttonName.titleLabel?.font = .boldSystemFont(ofSize: 13)
    }
    
    func designTextField(textFieldName: UITextField){
        textFieldName.textAlignment = .center
        textFieldName.borderStyle = .none
        textFieldName.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        textFieldName.keyboardType = .default
    }
    
    // 레벨 값 저장해서 아규먼트로
    func designMainImage(level: Int){
        
        for i in 0...2 {
            if tamaMainInfo.tamaName[i] == tamaMainName {
                tamaImageView.image = UIImage(named: "\(i+1)-\(level).png")
            }
        }
    }
    
    // 레벨 계산
    func tamaLevel(rice: Int, water: Int) -> Int {
        
        return ((rice / 5) + (water / 2)) / 10
    }
    
    //키보드 return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tamaWaterTextField.resignFirstResponder()
        tamaRiceTextField.resignFirstResponder()
        return true
    }
}

// 추가 및 수정사항
// 1. 숫자만 입력 가능 + 99개 넘기면 toast
// 2. 버튼 클릭시 옵셔널 처리 다시하기

