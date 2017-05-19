//
//  YWCommonBaseViewController.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWCommonBaseViewController: UIViewController {

    override func loadView() {
        let classString = String(self.dynamicType)
        NSBundle.mainBundle().loadNibNamed(classString, owner: self, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
