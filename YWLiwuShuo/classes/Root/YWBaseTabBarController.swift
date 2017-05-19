//
//  YWBaseTabBarController.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/17.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWBaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()
    }
    
    private func addChildViewControllers() {
        addChildViewController(YWHomeViewController(), title: "礼物说", imageName: "tabbar_home")
        addChildViewController(YWHotViewController(), title: "热门", imageName: "tabbar_gift")
        addChildViewController(YWClassifyViewController(), title: "分类", imageName: "tabbar_category")
        addChildViewController(YWMineViewController(), title: "我", imageName: "tabbar_me")
    }
    
    private func addChildViewController(vc: UIViewController, title: String, imageName: String) {
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")
        
        vc.tabBarItem.title = title
        let nav = YWBaseNavViewController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
    }


    
    
   



}
