//
//  XMGNavigationController.swift
//  XMGTV
//
//  Created by 小码哥 on 2016/12/4.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit

class XMGNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barStyle = .default
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = UIColor.white
        let app = UINavigationBarAppearance()
        // 重置背景和阴影的颜色
        app.configureWithOpaqueBackground()
        app.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        // 设置导航栏背景色
        app.backgroundColor = UIColor.black
        // 设置导航栏下边界分割线透明
        app.shadowImage = UIColor.clear.toImage()
        // 带scroll滑动的页面
        navigationBar.scrollEdgeAppearance = app
        // 常规页面
        navigationBar.standardAppearance = app
        
        // 1.取出手势&view
        guard let gesture = interactivePopGestureRecognizer else { return }
        gesture.isEnabled = false
        let gestureView = gesture.view

//        var count : UInt32 = 0
//        let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
//        for i in 0..<count {
//            let ivar = ivars[Int(i)]
//            let name = ivar_getName(ivar)
//            print(String(cString: name!))
//        }

        // 2.获取所有的target
        let target = (gesture.value(forKey: "_targets") as? [NSObject])?.first
        guard let transition = target?.value(forKey: "_target") else { return }
        let action = Selector(("handleNavigationTransition:"))

        // 3.创建新的手势
        let popGes = UIPanGestureRecognizer()
        popGes.maximumNumberOfTouches = 1
        gestureView?.addGestureRecognizer(popGes)
        popGes.addTarget(transition, action: action)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
