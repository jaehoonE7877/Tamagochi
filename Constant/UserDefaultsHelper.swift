//
//  UserDefaultsHelper.swift
//  Tamagochi
//
//  Created by Seo Jae Hoon on 2022/08/01.
//

import Foundation

class UserDefaultsHelper {
    
    private init() { }
    
    static let standard = UserDefaultsHelper()
    
    let userDefaults = UserDefaults.standard
    
    enum Key: String {
        case nickname, rice, water, first, choice
    }
    
    var nickname: String {
        get {
            return userDefaults.string(forKey: Key.nickname.rawValue) ?? "대장"
        }
        set {
            userDefaults.set(newValue, forKey: Key.nickname.rawValue)
        }
    }
    
    var rice: Int {
        get {
            return userDefaults.integer(forKey: Key.rice.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.rice.rawValue)
        }
    }
    
    var water: Int {
        get {
            return userDefaults.integer(forKey:  Key.water.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.water.rawValue)
        }
    }
    
    var choice: Int {
        get {
            return userDefaults.integer(forKey: Key.choice.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.choice.rawValue)
        }
    }
    
    var first: Bool {
        get {
            return userDefaults.bool(forKey: Key.first.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.first.rawValue)
        }
    }
}
