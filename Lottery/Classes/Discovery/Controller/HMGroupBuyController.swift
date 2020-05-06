//
//  HMGroupBuyController.swift
//  彩票
//
//  Created by Gao on 17/2/6.
//  Copyright © 2017年 Odm. All rights reserved.
//

import UIKit

class HMGroupBuyController: UIViewController {
    
    lazy var blueView: UIView = {
        
        var blueView = UIView()
        blueView.backgroundColor = UIColor.blue
        blueView.frame = CGRect(x: CGFloat(0),
                                y: CGFloat(64),
                                width: CGFloat(UIScreen.main.bounds.size.width),
                                height: CGFloat(0))
        
        return blueView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(blueView)
        
    }
    
    // 全部彩种的点击事件
    @IBAction func groupBuyClick(_ sender: HMGroupBuyButton) {
        
        UIView.animate(withDuration: 0.25, animations: {() -> Void in
            let buleFrame = CGRect(x: self.blueView.frame.origin.x,
                                   y: self.blueView.frame.origin.y,
                                   width: self.blueView.frame.size.width,
                                   height: self.blueView.frame.size.height > 0 ? 0.0 :150.0)
            
            // 如果高度有值 那么设置为0 如果没有值(值为0) 那么设置150
            self.blueView.frame = buleFrame
            
            // 旋转 只要一点 就在自身的基础上 加半圈儿
            sender.imageView?.transform = (sender.imageView?.transform.rotated(by: .pi))!
        })
        
    }
    
}
