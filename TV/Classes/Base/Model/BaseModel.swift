//
//  BaseModel.swift
//  TV
//
//  Created by GongsiWang on 2022/3/11.
//

import UIKit

@objcMembers class BaseModel: NSObject {
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

