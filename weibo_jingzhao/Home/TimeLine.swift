//
//  UserStatusModel.swift
//  weibo_jingzhao
//
//  Created by JingZhao on 7/22/16.
//  Copyright © 2016 JingZhao. All rights reserved.
//

import Foundation
import SwiftyJSON

class TimeLineTransform {
    
    func timeLineTransformFromDictionary(jsonResult:String) -> [TimeLine] {
        guard let jsonData = jsonResult.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) else {
            return []
        }
        let timeLineData = JSON(data: jsonData)["statuses"].arrayValue
        return timeLineData.map { timeLineJson -> TimeLine in
            let UserTimeLineJson = timeLineJson["user"]
            let userTimeLine = UserTimeLine(id: UserTimeLineJson["id"].stringValue, screenName: UserTimeLineJson["screen_name"].stringValue, name: UserTimeLineJson["name"].stringValue, avatarImage: UserTimeLineJson["profile_image_url"].stringValue)
            return TimeLine(creatAt: timeLineJson["s"].stringValue, text: timeLineJson["text"].stringValue, source: timeLineJson["source"].stringValue, userModel: userTimeLine)
        }
    }
}

struct TimeLine {
    
    let creatAt: String
    let text: String
    let source: String
    let userModel: UserTimeLine
    
}

struct UserTimeLine {
    
    let id: String
    let screenName: String
    let name: String
    let avatarImage: String
    
}
