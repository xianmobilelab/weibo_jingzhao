//
//  UserModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/19/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserModel {
    
    let id:String
    let screenName:String
    let name:String
    let avatarImage:String
    
    init(userDataInfo:[String:JSON]){
        let userData = JSON(userDataInfo)
        id = userData["id"].stringValue
        screenName = userData["screen_name"].stringValue
        name = userData["name"].stringValue
        avatarImage = userData["profile_image_url"].stringValue
    }
    
}