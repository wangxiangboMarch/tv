//
//  HomeViewController.swift
//  XMGTV
//
//  Created by 小码哥 on 2016/12/4.
//  Copyright © 2016年 coderwhy. All rights reserved.
//

import UIKit
import PageViewLibrary

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
    }
    
}


// MARK:- 设置UI界面
extension HomeViewController {
    fileprivate func setupUI() {
        setupNavigationBar()
        setupPageView()
    }
    
    private func setupNavigationBar() {
        // 1.左侧logoItem
        let logoImage = UIImage(named: "home-logo")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logoImage, style: .plain, target: nil, action: nil)
        
        // 2.设置右侧收藏的item
        let collectImage = UIImage(named: "search_btn_follow")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: collectImage, style: .plain, target: self, action: #selector(followItemClick))
        // 事件监听 --> 发送消息 --> 将方法包装SEL  --> 类方法列表 --> IMP
        
        // 3.搜索框
        let searchFrame = CGRect(x: 0, y: 0, width: 200, height: 32)
        let searchBar = UISearchBar(frame: searchFrame)
        searchBar.searchTextField.isEnabled = false
        searchBar.placeholder = "主播昵称/房间号/链接"
        navigationItem.titleView = searchBar
        searchBar.searchBarStyle = .minimal
    }
    
    private func setupPageView() {
        
        // 1.获取数据
        let homeTypes = loadTypesData()
        
        // 1.搞定frame
        let pageViewFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - kNavAndBottomBarH - kTabBarH - 10)
        
        let titles = homeTypes.map({ $0.title })
        
        // 3.titleView的样式
        let style = HYTitleStyle()
        style.titleHeight = 44
        style.isScrollEnable = true
//        style.isTitleScale = true
        
        style.isShowCover = true
        
        // 4.初始化所有的子控制器
        var childVcs = [UIViewController]()
        for type in homeTypes {
            let vc = AnchorViewController()
            vc.homeType = type
            childVcs.append(vc)
        }
        
        // 5.创建HYPageView
        let pageView = HYPageView(frame: pageViewFrame, titles: titles, style: style, childVcs: childVcs, parentVc: self)
        
        // 6.将pageView添加到控制器的view中
        view.addSubview(pageView)
        
//        pageView.translatesAutoresizingMaskIntoConstraints = false
//
//        pageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        pageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        pageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        pageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    fileprivate func loadTypesData() -> [HomeType] {
        let path = Bundle.main.path(forResource: "types", ofType: "plist")!
        let dataArray = NSArray(contentsOfFile: path) as! [[String : Any]]
        var tempArray = [HomeType]()
        for dict in dataArray {
            tempArray.append(HomeType(dict: dict))
        }
        return tempArray
    }
}


// MARK:- 事件监听函数
extension HomeViewController {
    
    @objc fileprivate func followItemClick() {
        print("------")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}

