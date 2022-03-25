//
//  ProfileHeaderView.swift
//  XMGTV
//
//  Created by apple on 16/11/30.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
}

extension ProfileHeaderView {
    class func loadProfileView() -> ProfileHeaderView {
        return Bundle.main.loadNibNamed("ProfileHeaderView", owner: nil, options: nil)?.first as! ProfileHeaderView
    }
}
