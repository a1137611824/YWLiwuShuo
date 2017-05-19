//
//  YWMineHeaderView.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWMineHeaderView: UIView {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }
    
    
    //MARK: -视图
    func setupUI() {
        
        backgroundColor = UIColor.purpleColor()
        addSubview(bgimageView)
        addSubview(loginBtn)
        addSubview(nickLab)
        addSubview(meOptionView)
        
        
        loginBtn.addTarget(self, action: #selector(YWMineHeaderView.loginBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func setupUIFrame() {
        loginBtn.snp_makeConstraints { (make) in
            make.top.equalTo(90)
            make.left.equalTo((SCREEN_WIDTH - loginBtn.bounds.width)/2)
        }
        nickLab.snp_makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp_bottom).offset(5)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        meOptionView.snp_makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(70)
        }

    }
    
    //MARK: -懒加载
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "me_avatar_boy"), forState: UIControlState.Normal)
        btn.sizeToFit()
        return btn
    }()
    
    private lazy var nickLab: UILabel = {
        let lab = UILabel()
        lab.text = "登陆"
        lab.textColor = UIColor.whiteColor()
        lab.font = UIFont.systemFontOfSize(14)
        lab.textAlignment = NSTextAlignment.Center
        lab.sizeToFit()
        return lab
    }()
    
    private lazy var meOptionView: UIView = {
        let view = MeOptionView()
        return view
    }()
    
    lazy var bgimageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "me_profilebackground"))
        return imageView
    }()
    
    
    //MARK: -事件
    @objc private func loginBtnAction() {
        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }

       

}
