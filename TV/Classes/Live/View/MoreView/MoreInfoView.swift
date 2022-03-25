//
//  MoreInfoView.swift
//  XMGTV
//
//  Created by apple on 16/11/11.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit

class MoreInfoView: UIView {
}

extension MoreInfoView {
    class func loadMoreInfoView() -> MoreInfoView {
        return Bundle.main.loadNibNamed("MoreInfoView", owner: nil, options: nil)?.last as! MoreInfoView
    }
}
