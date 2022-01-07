//
//  Helper.swift
//  GMap
//
//  Created by ahmed abdalla on 06/01/2022.
//

import Foundation

class Helper {
    class func save(key : String,data :NSData)->OSStatus{
        let query = [
            kSecClass as String : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String : data
        ] as [String : Any]
        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    class func load(key:String)->NSData? {
        let query = [
            kSecClass as String : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecReturnData as String : kCFBooleanTrue ?? "",
            kSecMatchLimit as String : kSecMatchLimitOne
        ] as [String : Any]
        var dataTypeRef : AnyObject? = nil
        let status : OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            return (dataTypeRef as! NSData)
        }else{
            return nil
        }
    }
}
