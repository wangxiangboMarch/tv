//
//  UITextField-Extension.swift
//  XMGTV
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit

extension UITextField {
    func selectedRange() -> NSRange {
        let begin = beginningOfDocument
        let textRange = selectedTextRange!
        
        let start = textRange.start
        let end = textRange.end
        
        let location = offset(from: begin, to: start)
        let length = offset(from: start, to: end)
        
        return NSMakeRange(location, length)
    }
}
