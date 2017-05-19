//
//  YWBaseViewController.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @objc private func login() {
        let sb = UIStoryboard(name: "LoginViewController", bundle: nil)
        let login = sb.instantiateInitialViewController()
        presentViewController(login!, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(YWBaseViewController.login), name: Notif_Login, object: nil)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: Notif_Login, object: nil)
    }
    
    
  

}
