//
//  UserDefaultsManager.swift
//  TestH
//
//  Created by sherbakova on 25.08.2024.
//

import Foundation

// UserDefaultsKeys enumeration for defining keys in UserDefaults
enum UserDefaultsKeys: String {
    case isOnboardingPassed
    case userZodiacType
}

final class UserDefaultsManager {
    
    static var isOnboardingPassed: Bool {
        get {
            getValue(for: .isOnboardingPassed) ?? false
        }
        set {
            setValue(value: newValue, for: .isOnboardingPassed)
        }
    }
    
    static var userZodiacType: ZodiacType? {
        get {
            if let value: String = getValue(for: .userZodiacType) {
                return ZodiacType(rawValue: value)
            }
            return nil
        }
        set {
            setValue(value: newValue?.rawValue, for: .userZodiacType)
        }
    }
}

extension UserDefaultsManager {
    
    static func setValue<T>(value: T?, for key: UserDefaultsKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func getValue<T>(for key: UserDefaultsKeys) -> T? {
        UserDefaults.standard.object(forKey: key.rawValue) as? T
    }
}
