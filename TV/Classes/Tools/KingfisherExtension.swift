//
//  KingfisherExtension.swift
//  XMGTV
//
//  Created by apple on 16/11/9.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(_ URLString : String?, _ placeHolderName : String? = nil) {
        guard let URLString = URLString else {
            return
        }
        
        guard let url = URL(string: URLString) else {
            return
        }
        
        guard let placeHolderName = placeHolderName else {
            kf.setImage(with: url)
            return
        }
        
        kf.setImage(with: url, placeholder : UIImage(named: placeHolderName))
    }
}
