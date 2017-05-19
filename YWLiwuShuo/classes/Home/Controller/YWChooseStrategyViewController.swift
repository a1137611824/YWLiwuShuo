//
//  YWChooseStrategyViewController.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWChooseStrategyViewController: YWBaseStrategyViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUIFrame()
    }
    
    func setupUI() {
        headerView.addSubview(topic)
        headerView.addSubview(banner)
        tableView.tableHeaderView = headerView
    }
    
    func setupUIFrame() {
        banner.frame = CGRectMake(0, 0, self.tableView.bounds.width, 170)
        topic.frame = CGRectMake(0, banner.bounds.size.height, banner.bounds.size.width, 120)
        headerView.frame = CGRectMake(0, 0, self.tableView.bounds.width, banner.bounds.height + topic.bounds.height + 10)
        //重新设置高度并赋值
        tableView.tableHeaderView = headerView
    }

    
    //MARK: -懒加载
    private lazy var headerView: UIView = UIView()
    
    private lazy var banner: BannerCollectionView = BannerCollectionView(frame: CGRectZero, collectionViewLayout: BannerFlowLayout())
    
    private lazy var topic: TopicCollectionView = TopicCollectionView(frame: CGRectZero, collectionViewLayout: TopicFlowLayout())



}
