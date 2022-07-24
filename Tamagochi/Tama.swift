//
//  Tama.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/07/24.
//

import Foundation

struct Tama {
    var name: String
    var water: Int
    var rice: Int
    
    enum Level : Int{
        case one = 1, two, three, four, five, six, seven, eight, nine, ten
    }
}
