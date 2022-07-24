//
//  ViewController.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/22.
//

import UIKit

class ViewController: UIViewController {

    static let identifier = "ViewController"
    let nickname = "대장"
    
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var bubbleLabel: UILabel!
    @IBOutlet weak var tamaImageView: UIImageView!
    @IBOutlet weak var tamaNameLabel: UILabel!
    
    @IBOutlet weak var tamaLevelLabel: UILabel!
    
    @IBOutlet weak var tamaRiceTextField: UITextField!
    @IBOutlet weak var tamaRiceButton: UIButton!
    
    @IBOutlet weak var tamaWaterTextField: UITextField!
    @IBOutlet weak var tamaWaterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(nickname)님의 다마고치"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
    }


}

