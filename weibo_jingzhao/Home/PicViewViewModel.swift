//
//  PicViewModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/23/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation
import SwiftyJSON

class PicViewViewModel {
    
    private let model: [String]
    
    init(model: [String]) {
        self.model = model
    }
    
    var picImages: [UIImage] {
        return model.map { pic -> UIImage in
            guard let urlAvatarImage = NSURL(string: pic),
                let dataAvatar = NSData(contentsOfURL: urlAvatarImage),
                let image = UIImage(data: dataAvatar) else {
                    return UIImage()
            }
            return image
        }
    }
    
    var picUrlsCount: Int {
        return model.count
    }
    
    var horizontalNum: Int {
        switch model.count {
        case 1:
            return 1
        case 4:
            return 2
        default:
            return 3
        }
    }
    
}
