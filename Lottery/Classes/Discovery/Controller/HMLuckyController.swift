//
//  HMLuckyController.swift
//  彩票
//
//  Created by Gao on 17/2/6.
//  Copyright © 2017年 Odm. All rights reserved.
//

import UIKit

class HMLuckyController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image1 = UIImage(named: "lucky_entry_light0"),
            let image2 = UIImage(named: "lucky_entry_light1") else {
                return
        }

        // 设置要做动画的图片
        imageView?.animationImages = [image1, image2]
        // 时间
        imageView?.animationDuration = 1
        // 次数
        imageView?.animationRepeatCount = 0
        // 开始
        imageView?.startAnimating()
        
    }


}
