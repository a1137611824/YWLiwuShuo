//
//  YWBaseStrategyCell.swift
//  YWLiwuShuo
//
//  Created by Mac on 2017/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class YWBaseStrategyCell: UITableViewCell {

    
    @IBOutlet weak var tagBtn: UIButton!
    @IBOutlet weak var tagTitleBtn: UIButton!
    @IBOutlet weak var headBtn: UIButton!
    @IBOutlet weak var nickLab: UILabel!
    @IBOutlet weak var coverImageview: UIImageView!
    @IBOutlet weak var textLab: UILabel!
    @IBOutlet weak var priseBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        initUI()
    }

    
    private func initUI() {
        selectionStyle = UITableViewCellSelectionStyle.None
        layer.borderWidth = 3
        layer.borderColor = Color_GlobalBackground.CGColor
        
        tagBtn.layer.cornerRadius = 5
        tagBtn.layer.masksToBounds = true
        headBtn.layer.cornerRadius = headBtn.bounds.width/2
        headBtn.layer.masksToBounds = true
        
        
        coverImageview.clipsToBounds = true
        coverImageview.contentMode = .ScaleAspectFill
        coverImageview.image = UIImage(named: "strategy_\(Int(arc4random() % 17) + 1).jpg")
    }
    
    
    

    
}
