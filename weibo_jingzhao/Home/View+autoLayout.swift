//
//  View+autoLayout.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/20/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

extension UIView {
    func addConstraits(format:String, views:AnyObject) {
        guard let stingParams = views as? [String:AnyObject] else {
            return
        }
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: stingParams ))
    }
    
}