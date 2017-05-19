//
//  YWHotViewController.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/17.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWHotViewController: YWGoodsBaseViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setupRefresh()
    }
    
    private func initUI() {
        self.title = "热门"
        self.view.backgroundColor = Color_GlobalBackground
  
    }
    
    private func setupRefresh() {
        let header = Refresh(refreshingTarget: self, refreshingAction: #selector(YWHotViewController.pullDownLoadData))
        collectionView.mj_header = header
    }
    
    @objc private func pullDownLoadData() {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.collectionView.mj_header.endRefreshing()
        }
    }

    
        
    


   

}
