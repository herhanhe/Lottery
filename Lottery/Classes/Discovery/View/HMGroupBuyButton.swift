//
//  HMGroupBuyButton.swift
//  彩票
//
//  Created by Gao on 17/2/6.
//  Copyright © 2017年 Odm. All rights reserved.
//

import UIKit

class HMGroupBuyButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let titleLabel = self.titleLabel,
            let imageView = self.imageView else {return }
        
        // 交换 btn 内部控件的位置
        titleLabel.frame.origin.x = 0
        imageView.frame.origin.x = titleLabel.frame.size.width
    }

}
