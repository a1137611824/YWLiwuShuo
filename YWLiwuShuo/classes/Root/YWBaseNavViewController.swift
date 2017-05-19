//
//  YWBaseNavViewController.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/17.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWBaseNavViewController: UINavigationController {


    lazy var backBtn: UIButton = UIButton(backTarget: self, action: #selector(YWBaseNavViewController.backBtnClick))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    
    func initUI() {
        //导航栏的切换方式关闭
        self.interactivePopGestureRecognizer?.delegate = nil
        
        let appearance = UINavigationBar.appearance()
        appearance.translucent = false
        
        appearance.setBackgroundImage(UIImage.imageWithColor(Color_NavBackground, size: CGSizeMake(1, 1)), forBarMetrics: .Default)
        
        var textAttr: [String:AnyObject] = Dictionary()
        textAttr[NSForegroundColorAttributeName] = UIColor.whiteColor()
        textAttr[NSFontAttributeName] = UIFont.systemFontOfSize(16)
        appearance.titleTextAttributes = textAttr
        
    }
    
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    
    func backBtnClick() {
        self.popViewControllerAnimated(true)
    }
    




}
