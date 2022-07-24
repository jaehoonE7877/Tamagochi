//
//  ChoiceCollectionViewCell.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/23.
//

import UIKit

class ChoiceCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChoiceCollectionViewCell"
    
    @IBOutlet weak var tamaImageView: UIImageView!
    @IBOutlet weak var tamaNameLabel: UILabel!
    
    
    func configureCell(index: Int, data: TamaInfo){
        
        
      
        if index < 3 {
            tamaImageView.image = UIImage(named: "\(index+1)-1.png")
            tamaNameLabel.text = "\(data.tamaName[index])" + " 다마고치 "
        } else {
            tamaImageView.image = UIImage(named: "noImage.png")
            tamaNameLabel.text = " 준비중이에요 "
        }
        
        
        tamaNameLabel.font = .boldSystemFont(ofSize: 12)
        tamaNameLabel.textAlignment = .center
        tamaNameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        tamaNameLabel.layer.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1).cgColor
        tamaNameLabel.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        tamaNameLabel.layer.cornerRadius = 4
        tamaNameLabel.layer.borderWidth = 1
        
    }
    
}

