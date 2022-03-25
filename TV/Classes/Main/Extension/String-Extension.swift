//
//  String-Extension.swift
//  XMGTV
//
//  Created by apple on 16/11/15.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import Foundation

extension String {
    static var documentPath : String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    }
}
