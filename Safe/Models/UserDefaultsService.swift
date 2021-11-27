//
//  UserDefaultsService.swift
//  Safe
//
//  Created by IgorGalimski on 27/11/2021.
//

import Foundation

class UserDefaultsService
{
    private let PasswordKey = "Password"
    private let PasswordSetKey = "PasswordSet"
    private let AutoLoginKey = "AutoLogin"
    
    private let defaults = UserDefaults.standard
    
    static let Instance = UserDefaultsService()
    
    var password: String
    {
        get
        {
            guard let _password = defaults.object(forKey: PasswordKey) as? String else
            {
                return ""
            }
            
            return _password
        }
        set (newPassword)
        {
            defaults.set(newPassword, forKey: PasswordKey)
        }
    }
    
    var autoLogin: Bool
    {
        get
        {
            return defaults.bool(forKey: AutoLoginKey)
        }
        set (value)
        {
            defaults.set(value, forKey: AutoLoginKey)
        }
    }
    
    var isPasswordSet: Bool
    {
        get
        {
            return defaults.bool(forKey: PasswordSetKey)
        }
        set (value)
        {
            defaults.set(value, forKey: PasswordSetKey)
        }
    }
}
