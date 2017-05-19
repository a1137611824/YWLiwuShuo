//
//  YWClassifyTitleView.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/19.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

protocol YWClassifyTitleViewDelegate {
    func selectedOptionAtIndex(index: Int)
}


class YWClassifyTitleView: UIView {
    
    var delegate: YWClassifyTitleViewDelegate?
    
    private var strategyBtn: UIButton?
    private var singleBtn: UIButton?
    private let lineMargin: CGFloat = 10
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }
    
    //MARK: - 视图
    private func setupUI() {
        
        backgroundColor = UIColor.clearColor()
        strategyBtn = createBtn("攻略")
        strategyBtn?.addTarget(self, action: #selector(YWClassifyTitleView.strategyBtnClick), forControlEvents: .TouchUpInside)
        singleBtn = createBtn("单品")
        strategyBtn?.addTarget(self, action: #selector(YWClassifyTitleView.singleBtnClick), forControlEvents: .TouchUpInside)
        addSubview(strategyBtn!)
        addSubview(singleBtn!)
        addSubview(line)
        
    } 
    
    private func setupUIFrame() {
        strategyBtn?.frame = CGRectMake(0, 0, frame.size.width/2, frame.size.height)
        singleBtn?.frame = CGRectMake(CGRectGetMaxX(strategyBtn!.frame), 0, frame.size.width/2, frame.size.height)
        line.frame = CGRectMake(lineMargin/2, frame.size.height - 6, frame.size.width/2 - lineMargin, 2)
    }

    
    private func createBtn(title: String) -> UIButton {
        let btn = UIButton(type: .Custom)
        btn.setTitle(title, forState: .Normal)
        btn.setTitleColor(UIColor.whiteColor() , forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        
        return btn
    }
    
    
    //MARK: - 事件
    @objc private func strategyBtnClick() {
        delegate?.selectedOptionAtIndex(0)
    }
    
    @objc private func singleBtnClick() {
        delegate?.selectedOptionAtIndex(1)
    
    }
    
    //MARK: -懒加载
    private lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        return view
    }()

    // MARK: - 公共方法
    func scrollLine(scrollViewWidth: CGFloat, offsetX: CGFloat) {
        line.frame.origin.x = lineMargin/2 + offsetX / scrollViewWidth * (bounds.width - line.bounds.width - lineMargin)
    }
   

}
