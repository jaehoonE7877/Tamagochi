//
//  Extension+TextFieldKeyboard.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/25.
//

import Foundation
import UIKit

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.isEmpty {
            return true
        }
        // 숫자만 포함하는 상수
        let charSetExceptNum = CharacterSet.decimalDigits.inverted
        // 숫자를 제외한 문자
        let stringComp = string.components(separatedBy: charSetExceptNum)
        // 숫자만 저장된 배열(우리가 사용할 숫자)
        let numFiltered = stringComp.joined(separator: "")
        
        // 2자리 99까지만 들어갈 수 있게
        let maxLenght = 2
        let currentString = textField.text! as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        if newString.count == maxLenght && string.isNumber {
            textField.text = newString
            textField.resignFirstResponder()
            return false
        }
        
        return string == numFiltered
            
    }
    
}

extension String {
    var isNumber: Bool {
        // 비어있지 않고 숫자만 있을 때
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
