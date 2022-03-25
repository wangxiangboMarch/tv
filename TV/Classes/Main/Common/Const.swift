//
//  Const.swift
//  TV
//
//  Created by GongsiWang on 2022/3/11.
//

import UIKit

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

let kNavigationBarH: CGFloat = isFullScreen() ? 88 : 64
let kTabBarH: CGFloat = 49
let kBottomSafeH: CGFloat = isFullScreen() ? 34 : 0
let kTopSafeH: CGFloat = isFullScreen() ? 44 : 20

let kNavAndBottomBarH = kNavigationBarH + kBottomSafeH


func isFullScreen() -> Bool {
    if #available(iOS 11, *) {
        guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
            return false
        }
        if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
            print(unwrapedWindow.safeAreaInsets)
            return true
        }
    }
    return false
}
