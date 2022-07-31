//
//  ViewController.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    static let identifier = "ViewController"
    // 인스턴스 생성
    var tamaNum: Int?
    var tamaRice: Int?
    var tamaWater: Int?
    //var nickname: String?
    
    // 처음 사용했으면 true
    var tamaInfo = TamaInfo()

    
    //var isFirst = UserDefaults.standard.bool(forKey: "first")
    var nickname = UserDefaults.standard.string(forKey: "nickname") ?? "대장"
    //var choiceNum = UserDefaults.standard.integer(forKey: "choice")
    
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
        
        guard let tamaNum = tamaNum else { return }
        UserDefaults.standard.set(tamaNum, forKey: "choice")
        
        // 상단 네비바
        navigationItem.title = "\(nickname)님의 다마고치"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(settingButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.letterColor
        
        // Main view 색상, 말풍선
        view.backgroundColor = UIColor.bgColor
        bubbleImageView.image = UIImage(named: "bubble.png")
        designLabel(labelName: bubbleLabel)
        bubbleLabel.text = "\(nickname)님 \(tamaInfo.tamaStatus[0])"
        bubbleLabel.font = .boldSystemFont(ofSize: 13)
        bubbleLabel.numberOfLines = 0
        
        // 이름 레이블 디자인
        designLabel(labelName: tamaNameLabel)
        tamaNameLabel.text = tamaInfo.tamaName[tamaNum] + " 다마고치"
        tamaNameLabel.font = .boldSystemFont(ofSize: 14)
        tamaNameLabel.layer.borderWidth = 1
        tamaNameLabel.layer.cornerRadius = 4
        tamaNameLabel.layer.borderColor = UIColor.letterColor.cgColor
        
        // 이미지 & 레벨(viewDidLoad)
        showLevel()
        designLabel(labelName: tamaLevelLabel)
        tamaLevelLabel.font = .boldSystemFont(ofSize: 14)
        
        // 버튼 디자인
        designButton(buttonName: tamaRiceButton, imageName: "drop.circle", text: " 밥먹기")
        designButton(buttonName: tamaWaterButton, imageName: "leaf.circle", text: " 물먹기")
        
        //텍스트 필드 디자인
        designTextField(textFieldName: tamaRiceTextField, text: "밥주세용")
        designTextField(textFieldName: tamaWaterTextField, text: "물주세용")
        
        
        //다음 화면 backbutton 이름 지우기
        navigationItem.backButtonTitle = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let changedName = UserDefaults.standard.string(forKey: "nickname") else { return }
        self.navigationItem.title = "\(changedName)님의 다마고치"
        bubbleLabel.text = "\(changedName)님 \(tamaInfo.tamaStatus[0])"
        nickname = changedName

    }
    
    // 밥주세요 버튼 액션
    @IBAction func tamaRiceButtonTapped(_ sender: UIButton) {
        
        
        guard let tamaRice = tamaRiceTextField.text else { return }

        // 1. 텍스트 필드안에 아무것도 없을 때 버튼 누르면 1씩 증가
        if tamaRice == "" {
            
            let riceValue = UserDefaults.standard.integer(forKey: "rice")
            
            let updateRiceValue = riceValue + 1
            
            UserDefaults.standard.set(updateRiceValue, forKey: "rice")
            // 2. 텍스트 필드안에 숫자가 있을 때 숫자만큼 증가
        } else {
            
            let riceValue = UserDefaults.standard.integer(forKey: "rice")
            
            guard let tamaRiceCnt = Int(tamaRice) else { return }
            
            let updateRiceValue = riceValue + tamaRiceCnt
            
            UserDefaults.standard.set(updateRiceValue, forKey: "rice")
        }
        
        showLevel()
        
        tamaRiceTextField.text = ""
        
        bubbleLabelReset(name: nickname)
        
    }
    // 물주세요 버튼 액션
    @IBAction func tamaWaterButtonTapped(_ sender: UIButton) {
        
        guard let tamaWater = tamaWaterTextField.text else { return }
        
        if tamaWater == "" {
            
            let waterValue = UserDefaults.standard.integer(forKey: "water")
            
            let updateWaterValue = waterValue + 1
            
            UserDefaults.standard.set(updateWaterValue, forKey: "water")
            
        } else {
            
            let waterValue = UserDefaults.standard.integer(forKey: "water")
            
            guard let tamaWaterCnt = Int(tamaWater) else { return }
            
            let updateWaterValue = waterValue + tamaWaterCnt
            
            UserDefaults.standard.set(updateWaterValue, forKey: "water")
        }
        
        showLevel()
        
        tamaWaterTextField.text = ""
        
        bubbleLabelReset(name: nickname)
        
    }
    
    // 레벨 계산 및 레벨 당 이미지 변환
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
        
        tamaLevelLabel.text = #"LV\#(tamaTotalLevel) ∙ 밥알\#(UserDefaults.standard.integer(forKey: "rice"))개 ∙ 물방울\#(UserDefaults.standard.integer(forKey: "water"))개"#
        
    }
    
    
    func designLabel(labelName: UILabel){
        labelName.textColor = UIColor.letterColor
        labelName.backgroundColor = UIColor.bgColor
        labelName.textAlignment = .center
    }
    
    func designButton(buttonName: UIButton, imageName: String, text: String){
        buttonName.tintColor = UIColor.letterColor
        buttonName.layer.borderWidth = 1
        buttonName.layer.borderColor = UIColor.letterColor.cgColor
        buttonName.layer.cornerRadius = 4
        buttonName.layer.backgroundColor = UIColor.bgColor.cgColor
        buttonName.titleLabel?.font = .boldSystemFont(ofSize: 13)
        buttonName.setImage(UIImage(systemName: imageName), for: .normal)
        buttonName.setTitle(text, for: .normal)
        
    }
    
    func designTextField(textFieldName: UITextField, text: String){
        textFieldName.textAlignment = .center
        textFieldName.borderStyle = .none
        textFieldName.backgroundColor = UIColor.bgColor
        textFieldName.keyboardType = .default
        textFieldName.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightLetterColor])
    }
    
    func bubbleLabelReset(name: String){
        //버튼 누른 순간 false
        UserDefaults.standard.set(false, forKey: "first")
        
        bubbleLabel.text = "\(name)님 \(tamaInfo.tamaStatus[Int.random(in: 1...10)])"
    }
    
    // 레벨 값 저장해서 아규먼트로
    func designMainImage(level: Int){
        guard let tamaNum = tamaNum else { return }
        tamaImageView.image = UIImage(named: "\(tamaNum + 1)-\(level).png")
    }
    
    // 레벨 계산
    func tamaLevel(rice: Int, water: Int) -> Int {
        
        let level = ((rice / 5) + (water / 2)) / 10
        
        // 초기 레벨 = 1, 만렙 == 10
        if level <= 1{
            return 1
        } else if level >= 10 {
            return 10
        } else {
            return level
        }
    }
    
    //키보드 return(한 자리수 일 때)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tamaWaterTextField.resignFirstResponder()
        tamaRiceTextField.resignFirstResponder()
        return true
    }
    
    //setting 화면으로 이동
    @objc
    func settingButtonTapped() {
        
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: SettingTableViewController.identifier) as! SettingTableViewController
        // 닉네임 전달
        vc.ownerNickname = nickname
        
        vc.completionHandler = { text in
            self.navigationItem.title = "\(text)님의 다마고치"
            self.bubbleLabelReset(name: text)
            return text
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
