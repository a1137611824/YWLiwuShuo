//
//  UIButton+Extension.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/17.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

extension UIButton {

    convenience init(x: CGFloat, iconName: NSString, target: AnyObject?, action: Selector, imageEdgeInsets: UIEdgeInsets){
        self.init()
        frame = CGRect(x: x, y: 0, width: 44, height: 44)
        setImage(UIImage(named: iconName as String), forState: UIControlState.Normal)
        setImage(UIImage(named: iconName as String), forState: UIControlState.Highlighted)
        self.imageEdgeInsets = imageEdgeInsets
        addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    /// 导航栏返回按钮
    convenience init(backTarget: AnyObject?, action: Selector) {
        self.init()
        setImage(UIImage(named: "back"), forState: UIControlState.Normal)
        frame = CGRect(x: 0, y: 0, width: 44.0, height: 44.0)
        contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        addTarget(backTarget, action: action, forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
}
