//
//  MainViewController.swift
//  XMGTV
//
//  Created by apple on 16/11/8.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.orange
        self.tabBar.isTranslucent = false
        let home = HomeViewController()
        let rank = RankViewController()
        let discover = DiscoverViewController()
        let profile = ProfileViewController()

        let dataSource: [(UIViewController, String, String)] = [
            (home, "直播", "live"),
            (rank, "排行", "ranking"),
            (discover, "发现", "found"),
            (profile, "我的", "mine"),
        ]
        loadVcToTabbar(items: dataSource)
        
        // 处理下面的tabbar 上面的灰色横线
        let standardAppearance = UITabBarAppearance()
        standardAppearance.backgroundColor = UIColor.white
        standardAppearance.shadowColor = UIColor.clear
        self.tabBar.scrollEdgeAppearance = standardAppearance
    
        // 适配 列表头部高度
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0.0
        }
    }
    
}


extension MainViewController {
    /// 装载子菜单到tabbar上
    private func loadVcToTabbar(items: [(UIViewController, String, String)]) {
        for item in items {
            addChildViewController(item.0, title: item.1, imageName: item.2)
        }
    }
    
    // 添加子vc到父vc
    private func addChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        childController.title = title
        
        if imageName.count > 0 {
            childController.tabBarItem.image = UIImage(named: imageName + "-n")
            childController.tabBarItem.selectedImage = UIImage(named: imageName + "-p")
        }
        let nav = XMGNavigationController(rootViewController: childController)
        addChild(nav)
    }
}
