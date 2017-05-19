//
//  YWClassifyViewController.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/17.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWClassifyViewController: YWBaseViewController {

    struct Static {
        static var dispatchOnceToken: dispatch_once_t = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUIFrame()
    }
    
    //MARK: - 视图
    private func setupUI() {
       automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = Color_GlobalBackground
        
        navigationItem.titleView = titleView
        view.addSubview(scrollView)
    
    }
    
    private func setupUIFrame() {
        dispatch_once(&Static.dispatchOnceToken) {
            self.titleView.frame = CGRectMake(0, 0, 120, 44)
            self.scrollView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 44)
            self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.width * 2, self.scrollView.bounds.height)
        
        }
    }
    
    //MARK: - 懒加载
    private lazy var titleView: YWClassifyTitleView = {
        var temptitleView = YWClassifyTitleView()
        temptitleView.delegate = self
        return temptitleView
    }()
    
    private lazy var scrollView: UIScrollView = {
        var tempScrollView = UIScrollView()
        tempScrollView.delegate = self
        tempScrollView.showsHorizontalScrollIndicator = false
        tempScrollView.pagingEnabled = true
        tempScrollView.backgroundColor = UIColor.greenColor()
        return tempScrollView
    }()

}

extension YWClassifyViewController: YWClassifyTitleViewDelegate, UIScrollViewDelegate {
    
    func selectedOptionAtIndex(index: Int) {
        scrollView.setContentOffset(CGPointMake(CGFloat(index) * scrollView.bounds.width, 0), animated: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        /// 更改titleView底部线条x
        titleView.scrollLine(scrollView.bounds.width, offsetX: scrollView.contentOffset.x)

    }
}
