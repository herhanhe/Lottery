//
//  HMNavigationController.swift
//  彩票
//
//  Created by Gao on 17/2/4.
//  Copyright © 2017年 Odm. All rights reserved.
//

import UIKit

class HMNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置导航栏图片
        navigationBar.setBackgroundImage(UIImage(named: "NavBar64"), for: .default)
        // 设置文字为白色
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        // 设置渲染的颜色
        navigationBar.tintColor = UIColor.white
        
        // 状态栏颜色(注意：在Info.plist中设置UIViewControllerBasedStatusBarAppearance 为NO)
        UIApplication.shared.statusBarStyle = .lightContent
    }


    // 以后只要使用这个 nav 去push 那么都隐藏tabbar
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        (tabBarController as? HMTabBarController)?.hideTabBar = true
        
        super.pushViewController(viewController, animated: animated)
        
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        (tabBarController as? HMTabBarController)?.hideTabBar = false
        
        return super.popViewController(animated: animated)
    }

}
