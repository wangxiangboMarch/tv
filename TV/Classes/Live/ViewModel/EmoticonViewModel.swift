//
//  EmoticonViewModel.swift
//  XMGTV
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit

class EmoticonViewModel {
    
    static let shareInstance : EmoticonViewModel = EmoticonViewModel()
    lazy var packages : [EmoticonPackage] = [EmoticonPackage]()
       
    init() {
        packages.append(EmoticonPackage(plistName: "QHNormalEmotionSort.plist"))
        packages.append(EmoticonPackage(plistName: "QHSohuGifSort.plist"))
    }
}
