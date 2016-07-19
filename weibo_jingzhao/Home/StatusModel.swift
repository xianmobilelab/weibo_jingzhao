//
//  StatusModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/19/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation
import SwiftyJSON

class StatusModel {
    
    let creatAt:String
    let text:String
    let source:String
    let userModel:UserModel
    
    init(jsonData: JSON) {
        creatAt = jsonData["s"].stringValue
        text = jsonData["text"].stringValue
        source = jsonData["source"].stringValue
        userModel = UserModel.init(userDataInfo: jsonData["user"].dictionaryValue)
    }
}