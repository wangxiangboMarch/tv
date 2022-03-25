//
//  NormalRankViewController.swift
//  XMGTV
//
//  Created by apple on 16/11/29.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit

class NormalRankViewController: SubrankViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubrankUI(["日榜", "周榜", "月榜", "总榜"])
    }
    
}
