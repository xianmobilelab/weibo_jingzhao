//
//  UserHeaderViewModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/23/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class  UserHeaderViewModel {
    
    private let model: UserTimeLine
    
    init(model: UserTimeLine) {
        self.model = model
    }
    
    var profileImage: UIImage? {
        guard let urlAvatarImage = NSURL(string: model.avatarImage),
            let dataAvatar = NSData(contentsOfURL: urlAvatarImage) else {
                return nil
        }
        return UIImage(data: dataAvatar)
    }
    
    var name: String {
        return model.name
    }
    
}
