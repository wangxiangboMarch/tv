//
//  FocusViewCell.swift
//  XMGTV
//
//  Created by apple on 16/11/21.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit

class FocusViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var liveImageView: UIImageView!
    
    var anchorModel : AnchorModel? {
        didSet {
            iconImageView.setImage(anchorModel?.pic51)
            nickNameLabel.text = anchorModel?.name
        }
    }
}
