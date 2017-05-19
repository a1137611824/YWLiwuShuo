//
//  YWHomeViewController.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/17.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWHomeViewController: UIViewController {

    //标题栏
    var categoryTitles: [NSString] {
        return ["精选", "海淘", "创意生活", "送女票", "科技范", "送爸妈", "送基友", "送闺蜜", "送同事", "送宝贝", "设计感", "文艺范", "奇葩搞怪", "萌萌哒"]
    }
    var cacheCategoryViews = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUIFrame()
    }
    
    private func setupUIFrame() {
        popoverCategoryView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 44.0)
        scrollView.frame = CGRect(x: 0, y: CGRectGetMaxY(popoverCategoryView.frame), width: view.bounds.width, height: view.bounds.height - popoverCategoryView.bounds.height - 44.0)
        for i in 0..<cacheCategoryViews.count {
            let view = cacheCategoryViews[i]
            view.frame = CGRect(x: scrollView.bounds.width * CGFloat(i), y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        }
        scrollView.contentSize = CGSizeMake(CGFloat(cacheCategoryViews.count) * scrollView.bounds.width, 0)
    }

    
    func initUI() {
        self.title = "礼物说"
        self.view.backgroundColor = Color_GlobalBackground
        
        self.view.addSubview(scrollView)
        self.view.addSubview(popoverCategoryView)
        
        for i in 0..<categoryTitles.count {
            let categoryVC = i == 0 ? YWChooseStrategyViewController() : YWBaseStrategyViewController()
            
            addChildViewController(categoryVC)
            scrollView.addSubview(categoryVC.view)
            cacheCategoryViews.append(categoryVC.view)
        }
    }
    
    //MARK: -懒加载
    private lazy var popoverCategoryView: PopoverCategoryView = {
        let forview = PopoverCategoryView.popoverCategoryView()
        forview.delegate = self
        forview.categoryTitles = self.categoryTitles
        
        return forview
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.delegate = self
        view.showsHorizontalScrollIndicator = false
        view.pagingEnabled = true
        return view
    }()



}

// MARK: - 代理
extension YWHomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.bounds.width;
        popoverCategoryView.scrollCategoryBtnByIndex(NSInteger(index))
    }
}

extension YWHomeViewController: PopoverCategoryViewDelegate {
    
    func selectedCategoryEndWithIndex(index: NSInteger) {
        scrollView.setContentOffset(CGPointMake(CGFloat(index) * scrollView.bounds.width, 0), animated: true)
    }
}
