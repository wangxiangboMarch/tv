//
//  HomeViewModel.swift
//  TV
//
//  Created by GongsiWang on 2022/3/11.
//

import UIKit

class HomeViewModel {
    lazy var anchorModels: [AnchorModel] = Array(repeating: AnchorModel(name: "王电视"), count: 20)
}

extension HomeViewModel {
    func loadHomeData(type : HomeType, index : Int,  finishedCallback : @escaping () -> ()) {
        NetworkTools.requestData(.get, URLString: "https://qf.56.com/home/v4/moreAnchor.ios", parameters: ["type" : type.type, "index" : index, "size" : 48], finishedCallback: { (result) -> Void in
//            guard let json = JSONSerialization.jsonObject(with: result, options: .allowFragments) else {return}
            let jsonStr = String(data: result as! Data, encoding: .utf8)
            
            guard let resultDict = result as? [String : Any] else { return }
            guard let messageDict = resultDict["message"] as? [String : Any] else { return }
            guard let dataArray = messageDict["anchors"] as? [[String : Any]] else { return }
            
//            for (index, dict) in dataArray.enumerated() {
//                let anchor = AnchorModel(dict: dict)
//                anchor.isEvenIndex = index % 2 == 0
//                self.anchorModels.append(anchor)
//            }
            
            finishedCallback()
        })
    }
}
