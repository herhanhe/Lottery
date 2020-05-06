//
//  HMTabBarController.swift
//  彩票
//
//  Created by Gao on 17/2/3.
//  Copyright © 2017年 Odm. All rights reserved.
//

import UIKit


// 这个类是为了，当tabBarItem的图片设置为 （？）x 49 的图片，
// 没有Title时的,需要设置Item的情况
class HMTabBarController: UITabBarController {
    
    weak var myTabbar: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        //设置标签栏文字和图片的颜色
        //        tabBar.tintColor = UIColor.orange
        //
        //        //设置标签栏的颜色
        //        tabBar.barTintColor = UIColor.black
        //
        //        //设置标签栏风格(默认高度49)
        //        tabBar.barStyle = .black
        

        layoutSubviews()
    }
    
    // [iOS]调用layoutSubViews方法(有的时候为啥会调用2遍)
    // http://www.68idc.cn/help/buildlang/ask/20150728463807.html
    // override func viewWillLayoutSubviews() {
    func layoutSubviews() {
        
        //
        //            // 苹果提供的方法，size是只读，不能设置值，所以只能曲线救国了
        //            // vc.tabBarItem.image?.size = CGSize(width: 64, height: 49) error

        guard let viewControllers = viewControllers else { return }
        
        // 用UIView覆盖到原来的tabBar上
        let myTabbar: UIView = UIView(frame: tabBar.frame)
        myTabbar.backgroundColor = UIColor.black
        
        var tagIndex = 0
        for vc in viewControllers {
            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            
            guard let myImage = vc.tabBarItem.image ,
                let myselectedImage = vc.tabBarItem.selectedImage
                else {continue}
            
            let myButton = UIButton()
            
            myButton.setImage(myImage, for: .normal)
            myButton.setImage(myselectedImage, for: .selected)
            myButton.tag = tagIndex
            
            
            // 计算按钮的 frame
            let w = UIScreen.main.bounds.width / CGFloat(viewControllers.count)
            let h = CGFloat(49)
            let x = CGFloat(tagIndex) * w
            let y = CGFloat(0)
            
            myButton.frame = CGRect(x: x, y: y, width: w, height: h)
            
            myButton.addTarget(self, action: #selector(tabBarButtonClick(_ :)), for: .touchDown)

            
            myTabbar.addSubview(myButton)
            
            // 点一下第一个按钮
            if (tagIndex == 0) {
                
                tabBarButtonClick(myButton)
            }
            
            tagIndex += 1
            
        }
        
        self.myTabbar = myTabbar
        
        view.addSubview(myTabbar)
        
        self.tabBar.removeFromSuperview()
        
        
        
    }
    
    
    var hideTabBar: Bool = false{
        didSet{
            self.myTabbar?.isHidden = hideTabBar
        }
    }
    
    weak var currentButton: UIButton?
    @objc func tabBarButtonClick(_ sender: UIButton){
        
        // 取消记录的按钮的选中状态
        currentButton?.isSelected = false
        
        // 设置点击的按钮为选中状态
        sender.isSelected = true
        
        // 记录选中的按钮
        currentButton = sender
        
        // 切换控制器
        selectedIndex = sender.tag
        
    }
    
}
