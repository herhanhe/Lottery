//
//  HMArenaController.swift
//  彩票
//
//  Created by Gao on 17/2/6.
//  Copyright © 2017年 Odm. All rights reserved.
//

import UIKit

class HMArenaController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置控制器的背景图片(拉伸)
        view.layer.contents = UIImage(named: "NLArenaBackground")?.cgImage
        
        // 设置 navbar 的图片
        // 图片NLArenaNavBar64原来提供的是2x的宽度320，
        // 运行的效果是，包含上面的状态栏 ，切图片不会自适应导航栏的大小
        // 参照：http://blog.csdn.net/zhoushuangjian511/article/details/50191155
        // 解决办法,将2x的图片当作1x图片用
        navigationController?.navigationBar.setBackgroundImage(UIImage(named:"NLArenaNavBar64"), for: .default)
        
        // 获取 titleView
        let seg = navigationItem.titleView as? UISegmentedControl
        
        // 设置默认的背景图片
        seg?.setBackgroundImage(UIImage(named: "CPArenaSegmentBG"), for: .normal, barMetrics: .default)

        // 设置选中的背景图片
        seg?.setBackgroundImage(UIImage(named: "CPArenaSegmentSelectedBG"), for: .selected, barMetrics: .default)


        // 设置文字的颜色
        seg?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        seg?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)

        // 取消蓝色的线
        seg?.tintColor = UIColor.clear
    }

}
