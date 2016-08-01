//
//  UserInfoViewViewModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/27/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class UserInfoViewViewModel {
    
    private let userInfo: UserInfoModel
    
    init (userInfo: UserInfoModel) {
        self.userInfo = userInfo
    }
    
    var name: String {
        return userInfo.name
    }
    
    var profileSource: UIImage? {
        guard let url = NSURL(string: userInfo.profile), let data = NSData(contentsOfURL: url) else {
            return nil
        }
        return UIImage(data: data)
    }
    
    var describe: String {
        return  userInfo.description.isEmpty ? "暂无介绍" : userInfo.description
    }
    
    var weibo: UserInfoNumViewViewModel {
        return UserInfoNumViewViewModel (model: userInfo.statuses)
    }
    
    var friend: UserInfoNumViewViewModel {
        return UserInfoNumViewViewModel (model: userInfo.friends)
    }
    
    var follower: UserInfoNumViewViewModel {
        return UserInfoNumViewViewModel(model: userInfo.followers)
    }
    
}

class UserInfoNumViewViewModel {
    
    private let model: UserInfoNumModel
    
    init (model: UserInfoNumModel) {
        self.model = model
    }
    
    var name: String {
        return model.name
    }
    
    var count: String {
        return model.count
    }
    
}
