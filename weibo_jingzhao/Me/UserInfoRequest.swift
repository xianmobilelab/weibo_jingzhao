//
//  UserInfoRequest.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/27/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation

class UserInfoRequest {
    
    typealias CompletionBlock = (weiboUser: WeiboUser?) -> Void
    
    func requesetUserInfo(callback: CompletionBlock) {
        let user = UserStore().fetchUser()
        _ = WBHttpRequest(forUserProfile: user?.userID, withAccessToken: user?.accessToken, andOtherProperties: nil, queue: nil) { (WBHttpRequest, result, error) in
            guard let resultData = result as? WeiboUser where error == nil else {
                print("no data: \(error)")
                return
            }
            callback(weiboUser: resultData)
        }
    }
    
}

class UserInfoTransform {
    
    func transformUserInfo(user: WeiboUser) -> UserInfoModel {
        return UserInfoModel(name: user.name, description: user.userDescription, profile: user.profileImageUrl, statuses: UserInfoNumModel(name: "微博", count: user.statusesCount), friends: UserInfoNumModel(name: "关注", count: user.favouritesCount), followers: UserInfoNumModel(name: "粉丝", count: user.followersCount))
    }
    
}

struct UserInfoModel {
    
    let name: String
    let description: String
    let profile: String
    let statuses: UserInfoNumModel
    let friends: UserInfoNumModel
    let followers: UserInfoNumModel
    
}

struct UserInfoNumModel {
    
    let name: String
    let count: String
    
}
