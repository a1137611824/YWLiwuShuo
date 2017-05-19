//
//  YWMineViewController.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/17.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit


private let cellReuseIdentifier = "cell"
class YWMineViewController: YWBaseViewController {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: -视图
    private func setupUI() {
        hideNavigationBar(false)
        setupBarView()
        setupTableView()
        
        self.view.backgroundColor = UIColor.lightGrayColor()
    }
    
    
    /**
     隐藏导航条
     
     -parameter showBgImage:是否显示导航条背景
     */
    private func hideNavigationBar(showBgImage: Bool) {
        automaticallyAdjustsScrollViewInsets = false
        navigationController?.navigationBar.translucent = true
        navigationController?.navigationBar.setBackgroundImage(showBgImage ? UIImage(named: "me_profilebackground") : UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    /**
     布局导航栏按钮
     */
    private func setupBarView() {
        let mailButton = UIButton(x: 0, iconName: "me_message", target: self, action: #selector(YWMineViewController.mailBtnAction), imageEdgeInsets: UIEdgeInsetsMake(0, -20, 0, 0))
        let alarmclockButton = UIButton(x: 44, iconName: "me_giftremind", target: self, action: #selector(YWMineViewController.alarmclockBtnAction), imageEdgeInsets: UIEdgeInsetsMake(0, -20, 0, 0))
        leftBarView.addSubview(mailButton)
        leftBarView.addSubview(alarmclockButton)
        
        let qrcodeButton = UIButton(x: 0, iconName: "me_scan", target:self, action:#selector(YWMineViewController.qrcodeBtnAction), imageEdgeInsets: UIEdgeInsetsMake(0, 0, 0, -20))
        let settingButton = UIButton(x: 44, iconName: "iconSettings", target:self, action: #selector(YWMineViewController.settingBtnAction), imageEdgeInsets: UIEdgeInsetsMake(0, 0, 0, -20))
        rightBarView .addSubview(qrcodeButton)
        rightBarView.addSubview(settingButton)
        
        let leftBarItem = UIBarButtonItem()
        leftBarItem.customView = leftBarView
        let rightBarItem = UIBarButtonItem()
        rightBarItem.customView = rightBarView
        
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.rightBarButtonItem = rightBarItem
    }
    
    /**
     布局TableView
     */
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.backgroundColor = Color_GlobalBackground
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
        view.addSubview(tableView)
        
    }
    
    //MARK: -懒加载
    private lazy var leftBarView: UIView = {
        return UIView(frame: CGRect(x: 0, y: 0, width: 88, height: 44))
    }()
    
    private lazy var rightBarView: UIView = {
        return UIView(frame: CGRect(x: 0, y: 0, width: 88, height: 44))
    }()
    
    private lazy var footerView: MeFooterView = {
        return MeFooterView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 300))
    }()
    
    private lazy var sectionView: UIView = {
        let nibs: NSArray = NSBundle.mainBundle().loadNibNamed("MeSectionView", owner: nil, options: nil)!
        let view = nibs.lastObject as! UIView
        view.frame = CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 60)
        return view
    }()
    
    private lazy var headerView: YWMineHeaderView = {
        return YWMineHeaderView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 214 + 70))
    }()

    
    //MARK: -事件
    @objc private func mailBtnAction() {
        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }
    
    @objc private func alarmclockBtnAction() {
        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }
    
    @objc private func qrcodeBtnAction() {
        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }
    
    @objc private func settingBtnAction() {
        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }

}


//MARK: - 代理
extension YWMineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier)
    
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionView
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //处理背景图片拉伸效果
        let offsetY = scrollView.contentOffset.y
        if offsetY > 0 { return }
        
        let upFactor: CGFloat = 0.5
        if offsetY >= 0.0 {
            headerView.bgimageView.transform = CGAffineTransformMakeTranslation(0, offsetY)
        }else{
            let transform = CGAffineTransformMakeTranslation(0, offsetY * upFactor)
            let s = 1 - offsetY * 0.01
            headerView.bgimageView.transform = CGAffineTransformScale(transform, 1, s)
        }
        
    }
    
    
}


