//
//  UIView+Frame.swift
//  彩票
//
//  Created by Gao on 17/2/3.
//  Copyright © 2017年 Odm. All rights reserved.
//

import UIKit
extension UIView {
    
    /// 为UIView，增加位置，大小的方法，方便编程

    func setX(_ x: CGFloat) {
        self.frame.origin.x = x
    }
    func getX() -> CGFloat {
        return self.frame.origin.x
    }
    
    
    func setY(_ y: CGFloat) {
        self.frame.origin.y = y
    }    
    func getY() -> CGFloat {
        return self.frame.origin.y
    }
    
    func setW(_ w: CGFloat) {
        self.frame.size.width = w
    }
    func getW() -> CGFloat {
        return self.frame.size.width
    }
    
    func setH(_ h: CGFloat) {
        self.frame.size.height = h
    }
    func getH() -> CGFloat {
        return self.frame.size.height
    }
    
    
    
}
