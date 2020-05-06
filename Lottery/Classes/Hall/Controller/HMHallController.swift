//
//  HMHallController.swift
//  彩票
//
//  Created by Gao on 17/2/4.
//  Copyright © 2017年 Odm. All rights reserved.
//

import UIKit

class HMHallController: UITableViewController {
    
    weak var coverView: UIView?
    weak var imageView: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var image = UIImage(named: "CS50_activity_image")
        // 告诉系统 使用这个图片的时候 不进行渲染
        image = image?.withRenderingMode(.alwaysOriginal)
        // 创建item
        let item = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.activityClick))
        self.navigationItem.leftBarButtonItem = item
        
    }
    
    
    // 活动的点击事件
    @objc func activityClick() {
        // 遮罩
        let coverView = UIView(frame: UIScreen.main.bounds)
        coverView.backgroundColor = UIColor.black
        coverView.alpha = 0.5
        // 添加到最外层的控制器
//        UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(coverView) // 也可以的
        
        tabBarController?.view?.addSubview(coverView)
 
        self.coverView = coverView
        // imageView
        let imageView = UIImageView(image: UIImage(named: "showActivity"))
        // 开启用户交互
        imageView.isUserInteractionEnabled = true
        imageView.center = self.view.center
        //    [coverView addSubview:imageView];
        // 注意: 不添加到 cover 上的原因 是因为 父控件如果透明 那么子控件也会透明
        tabBarController?.view?.addSubview(imageView)
        self.imageView = imageView
        
        // 关闭按钮
        let closeButton = UIButton()
        // 获取图片
        let closeButtonImage = UIImage(named: "alphaClose")
        closeButton.frame = CGRect(x: CGFloat(imageView.bounds.size.width - (closeButtonImage?.size.width)!), y: CGFloat(0), width: CGFloat(0), height: CGFloat(0))
        closeButton.setBackgroundImage(closeButtonImage, for: .normal)
        closeButton.sizeToFit()
        imageView.addSubview(closeButton)
        // 监听关闭按钮的点击
        closeButton.addTarget(self, action: #selector(self.closeClick), for: .touchUpInside)
    }
    
    
    // 关闭按钮
    @objc func closeClick() {
        UIView.animate(withDuration: 0.25, animations: {() -> Void in
            self.coverView?.removeFromSuperview()
            self.imageView?.removeFromSuperview()
        })
    }
    
  

    
    ///-----------------------------------------------
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
}
