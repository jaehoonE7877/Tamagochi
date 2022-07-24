//
//  ChoiceCollectionViewController.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/23.
//

import UIKit


class ChoiceCollectionViewController: UICollectionViewController {
    
    let tamaList = TamaInfo()
    static let identifier = "ChoiceCollectionViewController"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "다마고치 선택하기"
        
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 20
        
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2 )
        
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        collectionView.collectionViewLayout = layout
        
        collectionView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
   
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChoiceCollectionViewCell", for: indexPath) as? ChoiceCollectionViewCell else { return UICollectionViewCell() }
        
        
        cell.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        cell.configureCell(index: indexPath.row, data: tamaList)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "TamaDetail", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: TamaDetailViewController.identifier) as! TamaDetailViewController
        
        if indexPath.row <= 2 {
            vc.tamaName = tamaList.tamaName[indexPath.row]
            vc.tamaImage = tamaList.tamaBaseImage[indexPath.row]
            vc.tamaDetail = tamaList.tamaInformation[indexPath.row]
        }
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .overCurrentContext
        
        if indexPath.row <= 2 {
            self.present(nav, animated: true)
        }
    }
    
    
    
}
