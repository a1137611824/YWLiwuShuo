//
//  YWBaseStrategyViewController.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

private let BaseStrategyCell = "BaseStrategyCell"
class YWBaseStrategyViewController: YWBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUIFrame()
    }
    
    //MARK: -视图
    private func initUI() {
        view.addSubview(tableView)
    }
    
    private func setupUIFrame() {
        tableView.frame = self.view.bounds
    }

    //MARK: -懒加载
    lazy var tableView: UITableView = {
        let temptableView = UITableView(frame: CGRectZero, style: .Plain)
        temptableView.delegate = self
        temptableView.dataSource = self
        temptableView.backgroundColor = Color_GlobalBackground
        temptableView.showsVerticalScrollIndicator = false
        temptableView.showsHorizontalScrollIndicator = false
        temptableView.separatorStyle = .None
        temptableView.registerNib(UINib(nibName: "YWBaseStrategyCell", bundle: nil), forCellReuseIdentifier: BaseStrategyCell)
        return temptableView
    }()
    

}



//MARK: -UITableViewDelegate and UITableViewDataSource
extension YWBaseStrategyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(BaseStrategyCell, forIndexPath: indexPath) as! YWBaseStrategyCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.navigationController?.pushViewController(YWCommonBaseViewController(), animated: true)
    }
}




