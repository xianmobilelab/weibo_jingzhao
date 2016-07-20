//
//  UIView+autoLayout.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/23/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

extension UIView {

    func addConstraits(format: String, views:[String : AnyObject])  {
        let constraints =  NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: views)
        addConstraints(constraints)
    }
    
}
