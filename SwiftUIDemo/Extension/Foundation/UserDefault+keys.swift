//
//  UserDefault+keys.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 01/04/24.
//

import Foundation


extension UserDefaults {
    public func setValues(_ value: Any?, forKey key: UserDefaultsKeys) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    public func getValue(forKey key: UserDefaultsKeys) -> Any? {
        UserDefaults.standard.value(forKey: key.rawValue)
    }
    
    public func removeObject(forKey: UserDefaultsKeys) {
        UserDefaults.standard.removeObject(forKey: forKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
}
