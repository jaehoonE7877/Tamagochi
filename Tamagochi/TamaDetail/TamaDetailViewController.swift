//
//  TamaDetailViewController.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/23.
//

import UIKit

class TamaDetailViewController: UIViewController {
        
//    var tamaName: String?
//    var tamaImage: String?
//    var tamaDetail: String?
    var tamaNum: Int?
    var tamaInfo = TamaInfo()
    
    static let identifier = "TamaDetailViewController"
    
    @IBOutlet weak var detailMainView: UIView!
    @IBOutlet weak var detailTamaImageView: UIImageView!
    @IBOutlet weak var detailTamaLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var detailMainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.2, alpha: 0.2)
        detailMainView.backgroundColor = UIColor.bgColor
        
        designButton(buttonName: cancelButton, text: "취소")
        designButton(buttonName: okButton, text: "변경하기")
        
        guard let tamaNum = tamaNum else { return }

        
        let tamaName = tamaInfo.tamaName[tamaNum]
        let tamaImage = tamaInfo.tamaBaseImage[tamaNum]
        let tamaDetail = tamaInfo.tamaInformation[tamaNum]
        detailTamaLabel.text = "\(tamaName)" + " 다마고치"
        detailTamaImageView.image = UIImage(named: tamaImage)
        detailMainLabel.text = tamaDetail
        
        
        designLabel(labelName: detailTamaLabel)
        designLabel(labelName: detailMainLabel)
        detailTamaLabel.font = .boldSystemFont(ofSize: 14)
        detailMainLabel.font = .systemFont(ofSize: 13)
        
        
    }
    

    func designLabel(labelName: UILabel){
        labelName.textColor = UIColor.letterColor
        labelName.backgroundColor = UIColor.bgColor
        labelName.textAlignment = .center
        labelName.layer.borderWidth = 1
        labelName.layer.cornerRadius = 4
        labelName.layer.borderColor = UIColor.letterColor.cgColor
        labelName.numberOfLines = 0
    }
    
    func designButton(buttonName: UIButton, text: String){
        buttonName.setTitle(text, for: .normal)
        buttonName.backgroundColor = UIColor.bgColor
        buttonName.setTitleColor(UIColor.letterColor, for: .normal)
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: ViewController.identifier) as! ViewController
        
        vc.tamaNum = tamaNum
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        
        self.present(nav, animated: false)
    }
    
}
